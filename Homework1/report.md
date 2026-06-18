# Documentation de conception
Xavier Chabot &
Joshua Vasquez
## 1.1 Diagrammes de classes UML
À partir du contexte nous avons identifié 6 entités:
- Arbre
- Espèce
- Emplacement
- ActiviteMaintenance
- Travailleur
- SuiviCroissance

### Relations
**Arbre - Espèce ( 1 à \* )** : Un arbre appartient à exactement une espèce, mais une espèce peut regrouper plusieurs arbres.

**Arbre - Emplacement ( \* à 1 )** : Un arbre peut seulement avoir un seul emplacement mais un emplacement peut contenir plusieurs arbres.

**Arbre — SuiviCroissance  ( 1 à * )** : Un arbre peut avoir plusieurs mesures de croissance enregistrées dans le temps.

**Arbre — ActiviteMaintenance  ( 1 à * )** : Un arbre peut avoir plusieurs activités de maintenance. 

**Travailleur — ActiviteMaintenance  ( 1 à 0..\* )** : Chaque activité de maintenance est effectuée par un seul travailleur, mais un travailleur peut effectuer 0 à plusieurs activités. En effet, si le travailleur vient tout juste d'être engagé, il n'a pas encore effectué d'activité de maintenance.

## 1.2 Modèle relationnel

### Justification des choix :

- **Clé primaire de `SuiviCroissance` et `ActiviteMaintenance`** : 

 Ces deux entités possèdent un identifiant propre (`id_suivi`, `id_activite`) car plusieurs enregistrements peuvent exister pour un même arbre. Utiliser seulement `(id_arbre, date)` comme clé composite serait risqué si deux mesures ont lieu le même jour.

 - **Attribut type_zone nullable** :
 
  Le champ `type_zone` dans `Emplacement` est défini comme nullable. Un emplacement peut être enregistré dans le système avant que son type soit déterminé. Les valeurs attendues sont : `parc`, `rue`, `forêt`, `jardin urbain`.

  - **Clé étrangère `id_travailleur` nullable dans `ActiviteMaintenance`** : 
  
  Ce champ est nullable car un travailleur enregistré dans le système n'effectue pas nécessairement des activités de maintenance terrain — il peut occuper un rôle administratif (comptable, gestionnaire, etc.). La cardinalité `0..*` du côté travailleur reflète ce choix : un travailleur peut exister sans aucune activité associée.

  - **Intégrité référentielle** : 
  
  Toutes les clés étrangères structurelles (`id_espece`, `id_emplacement` dans Arbre, `id_arbre` dans SuiviCroissance et ActiviteMaintenance) sont NOT NULL, car l'énoncé impose explicitement ces liens.

