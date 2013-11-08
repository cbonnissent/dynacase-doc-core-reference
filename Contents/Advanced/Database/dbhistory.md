# Description de la table historique de document {#core-ref:dc380a30-61b1-4a51-997b-6a3e8f5e1fed}

La table `dochisto` contient les informations notées dans l'historique des
documents.

| Colonne |             Type            |                                    Description                                    |
| ------- | --------------------------- | --------------------------------------------------------------------------------- |
| id      | integer                     | Identifiant du document (pour une révision donnée)                                |
| initid  | integer                     | Identifiant initial du document                                                   |
| uid     | integer                     | Identifiant de l'utilisateur ayant créé l'entrée                                  |
| uname   | text                        | Nom et prénom de l'utilisateur ayant créé l'entrée                                |
| date    | timestamp without time zone | Date de l'entrée                                                                  |
| level   | integer                     | Niveau : Notice `1`, Information `2`, Message `4`, Avertissement `8`, Erreur `16` |
| code    | text                        | Code de l'entrée. Permet de catégoriser le message                                |
| comment | text                        | Message de l'entrée                                                               |


![ Relation entre dochisto et doc ](advanced/dbdochisto.png)