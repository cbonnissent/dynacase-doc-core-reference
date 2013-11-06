# Description des tables du coffre de fichiers

Ce chapitre définit les tables qui gères l'accès aux fichiers attachés aux
documents.

## Table `vaultdiskfsstorage`

La table `vaultdiskfsstorage` indique les différents coffres enregistrés.


|      Colonne       |           Type          |                                 Définition                                |
| ------------------ | ----------------------- | ------------------------------------------------------------------------- |
| id_fs              | integer                 | Identifiant de coffre (issue de la séquence `seq_id_vaultdiskfsstorage`)  |
| fsname             | text                    | Nom du coffre                                                             |
| max_size           | bigint                  | Taille max de contenu du coffre (en octets)                               |
| free_size          | bigint                  | Taille restante en octets (calculé en fonction de la taille des fichiers) |
| subdir_cnt_bydir   | integer                 | *Obsolète* Non utilisé                                                    |
| subdir_deep        | integer                 | *Obsolète* Non utilisé                                                    |
| max_entries_by_dir | integer                 | *Obsolète* Non utilisé                                                    |
| r_path             | character varying(2048) | Chemin absolu d'accès au coffre                                           |

Le répertoire `r_path` doit être accessible en lecture/écriture à l'utilisateur
du serveur web.

## Table `vaultdiskdirstorage`

La table `vaultdiskdirstorage` indique les différents répertoires utilisés par
les coffres. Un nouveau répertoire est créé automatiquement si tous les
répertoires sont pleins (`free_size` &lt; _"Taille du fichier à insérer"_).

Lors de l'ajout d'un répertoire, le nombre de fichiers autorisés est donné par
`free_entries`. Il est de 1000, ce paramètre n'est pas configurable.

Un répertoire ne peut avoir que 100 sous-répertoires. Si tous les répertoires
d'un même niveau sont pleins un nouveau répertoire de niveau inférieur est créé.


|   Colonne    |           Type          |                                    Définition                                   |
| ------------ | ----------------------- | ------------------------------------------------------------------------------- |
| id_dir       | integer                 | Identificateur de répertoire (issue de la séquence `seq_id_vaultdiskdirstorage) |
| id_fs        | integer                 | Identificateur du coffre lié au répertoire                                      |
| free_entries | integer                 | Nombre d'entrée libre (1000 à l'initialisation)                                 |
| l_path       | character varying(2048) | Chemin relatif à `r_path` du répertoire                                         |



## Table `vaultdiskstorage`

La table `vaultdiskstorage` stocke les chemins d'accès et les propriétés des
fichiers du coffres.

Les fichiers physiques sont nommés '[id_file].[extension du name]'.
Si _id_file=342_ et _name='mon test.pdf'_ alors le nom physique est `342.pdf`.

Le fichier est placé dans le répertoire `r_path/l_path`. `r_path` provient du
coffre lié (`id_fs`) et `l_path` provient du répertoire lié (`id_dir`).

|    Colonne    |             Type            |                                           Définition                                          |
| ------------- | --------------------------- | --------------------------------------------------------------------------------------------- |
| id_file       | integer                     | Identificateur de fichier (issue de la séquence `seq_id_vaultdiskstorage)                     |
| id_fs         | integer                     | Identificateur du coffre lié au fichier                                                       |
| id_dir        | integer                     | Identificateur du répertoire lié au fichier                                                   |
| public_access | boolean                     | Si vrai, l'[accès au fichier][expfile] est possible sans contrôle du droit d'accès au document |
| size          | integer                     | Taille du fichier (en octets)                                                                 |
| name          | character varying(2048)     | Nom du fichier original (basename)                                                            |
| mime_t        | text                        | Type mime (humainement lisible)                                                               |
| mime_s        | text                        | Type mime système                                                                             |
| cdate         | timestamp without time zone | Date d'insertion dans le coffre                                                               |
| mdate         | timestamp without time zone | Date de modification dans le coffre                                                           |
| adate         | timestamp without time zone | Date de dernier accès depuis le coffre                                                        |
| teng_state    | integer                     | État du fichier converti                                                                      |
| teng_lname    | text                        | Nom du fichier converti                                                                       |
| teng_id_file  | integer                     | Identifiant du fichier converti                                                               |
| teng_comment  | text                        | Message de conversion                                                                         |

Les attributs de document de type [`file`][attrfile] et [`image`][attrimg]
référence l'identifiant du fichier. La valeur d'un tel attribut dans un
document est : `<Type Mime>|<Identifiant Fichier>|<Nom du fichier>`.

L'_identifiant fichier_ référence la colonne `id_file` de la table
`vaultdiskstorage`.

![ Relations entre les tables des coffres de fichiers ](dbvault.png)



<!-- links -->
[appact]:           #core-ref:b26f57fe-4d75-4d5f-a50e-129028b379ed "Applications et action"
[app]:              #core-ref:395f44f1-6699-4ad8-b525-31e65e9b6efb "Écrire une application"
[action]:           #core-ref:e67d8aeb-939c-46e3-9be8-6fc3ba75ebc2 "Écrire une action"
[openaccess]:       #core-ref:9edc8f2e-6929-11e2-8610-0021e9fffec1 "Authentification par jetons"
[dbacl]:            #core-ref:c7caa985-3b34-4abd-8ffa-2e7110718efc "Table acl"
[acls]:             #core-ref:a98b72ea-c063-4907-abc4-e5171ab55e59 "Les droits applicatifs"
[expfile]:          #core-ref:0fc93676-888f-497e-b9bc-28cdbead52df "Action EXPORTFILE"
[attrfile]:         #core-ref:0e904376-317c-426e-bc6d-e56fd52bad89 "Attribut file"
[attrimg]:          #core-ref:4fca7712-59e0-4186-bfd0-6214104a0f60 "Attribut image"
 