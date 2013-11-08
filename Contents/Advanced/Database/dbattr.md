# Description de la table des attributs {#core-ref:77177855-c903-44c8-a79a-a297911732dd}

La table `docattr` contient les caractéristiques des attributs de famille. Lors
de l'[importation de famille][famimport] cette table est mise à jour. Elle sert
à produire les [classes PHP associées][famprop] aux familles de documents.

Composition de la table `docattr`:

|    Colonne    |     Type     |                                                   Définition                                                   |
| ------------- | ------------ | -------------------------------------------------------------------------------------------------------------- |
| id            | name         | Identifiant de l'attribut                                                                                      |
| docid         | integer      | Identifiant numérique de la famille                                                                            |
| frameid       | name         | Identifiant du cadre encadrant (tab, frame, array)                                                             |
| labeltext     | text         | Libellé de l'attribut                                                                                          |
| title         | character(1) | Indicateur appartenance au titre du document: [Y&#124;N]                                                       |
| abstract      | character(1) | Indicateur appartenance au résumé du document : [Y&#124;N]                                                     |
| type          | text         | [Type d'attribut][attrtype] (avec format) : frame, array, text, docid("MYFAM") ...                             |
| ordered       | integer      | Ordre de présentation                                                                                          |
| visibility    | character(1) | [Visibilité des attributs][attrvis]                                                                            |
| needed        | character(1) | Indicateur attribut obligatoire : [Y&#124;N]                                                                   |
| link          | text         | Définition de l'hyperlien affiché sur la valeur de l'attribut                                                  |
| phpfile       | text         | Nom du fichier PHP utilisé pour l'aide à la saisie                                                             |
| phpfunc       | text         | Déclaration de l'appel à l'aide à la saisie ou au calcul de la valeur de l'attribut                            |
| elink         | text         | Définition de l'hyperlien mis sur le bouton supplémentaire affiché sur l'interface de modification de document |
| phpconstraint | text         | Déclaration de l'appel à la méthode de contrainte d'enregistrement                                             |
| usefor        | character(1) | Catégorie d'attribut : `N`: attribut *normal*, `Q`: paramètre de famille                                                                                                               |
| options       | text         | Liste des [options d'attributs][attropt]                                                                       |

Cette table n'est pas utilisée par la méthode `Doc::getAttribute()` car la
définition des attributs par les classes PHP est faite lors de l'importation des
familles. Les modifications sur cette table ne seront prise en compte que lors
de la [regénération des familles][fdladoc].


![ Relation entre docattr et docfam ](advanced/dbdocattr.png)

<!-- links -->
[famimport]:        #core-ref:cfc7f53b-7982-431e-a04b-7b54eddf4a75 "Importation de famille"
[famprop]:          #core-ref:6f013eb8-33c7-11e2-be43-373b9514dea3 "Propriétés de familles"
[attrtype]:         #core-ref:4e167170-33ed-11e2-8134-a7f43955d6f3 "Types d'attribut"
[attrvis]:          #core-ref:3e67d45e-1fed-446d-82b5-ba941addc7e8 "Visibilité des attributs"
[attropt]:          #core-ref:16e19c90-3233-11e2-a58f-6b135c3a2496 "Options des attributs"
[fdladoc]:          #core-ref:8566efe6-782a-4c13-8117-f1ad99a7ad02 "generateDocumentClass"