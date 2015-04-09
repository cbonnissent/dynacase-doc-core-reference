# Description de la table log de document  {#core-ref:9090c9ee-fb9c-4cca-b9d6-962052ed69a9}

La table `doclog` contient les informations notées dans le log des
documents.

Les entrées sont ajoutées avec la méthode `Doc::addLog()`.


| Colonne |             Type            |                                    Description                                    |
| ------- | --------------------------- | --------------------------------------------------------------------------------- |
| id      | integer                     | Identifiant du document (pour une révision donnée)                                |
| initid  | integer                     | Identifiant initial du document                                                   |
| title   | text                        | Message du log                                                                    |
| uid     | integer                     | Identifiant de l'utilisateur ayant créé le log                                    |
| uname   | text                        | Nom et prénom de l'utilisateur ayant créé le log                                  |
| date    | timestamp without time zone | Date du log                                                                       |
| level   | integer                     | Niveau : Notice `1`, Information `2`, Message `4`, Avertissement `8`, Erreur `16` |
| arg     | text                        | Donnée sérializée associé au log                                                  |
| comment | text                        | Commentaire du log                                                                |
|         |                             |                                                                                   |


![ Relation entre doclog et doc ](advanced/dbdoclog.png)