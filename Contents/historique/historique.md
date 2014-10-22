# Historique de la documentation {#core-ref:e4cf4232-38e7-4673-afd1-5730c1a95c48}

Ce chapitre contient un descriptif des améliorations entre les releases de 
Dynacase.


## Édition 6

|                                Modifications                                |                     Chapitre                     |                    Version                     |
| :-------------------------------------------------------------------------- | :----------------------------------------------- | :--------------------------------------------- |
| Ajout de l'option displayrowcount sur les array                             | [Array displayrowcount][display_row_count]       | <span class="flag update">Mise à jour</span>   |
| Ajout de l'option SET sur l'import des profils                              | [import des profil][import_profil]               | <span class="flag update">Mise à jour</span>   |
| Précision sur l'option showempty pour les images                            | [showempty][commonoptions]                       | <span class="flag update">Mise à jour</span>   |
| Précision sur la composition d'un titre                                     | [Titre de document][famattrtitle]                | <span class="flag update">Mise à jour</span>   |
| Précision sur le retour d'un paramètre de famille                           | [Doc::getFamilyParameter()][returnfamilyparam]   | <span class="flag update">Mise à jour</span>   |
| Modification du libellé du droit `modify` de dossier                        | [Droit `modify`][profildoc]                      | <span class="flag update">Mise à jour</span>   |
| Précision sur l'inclusion de css                                            | [Application::addCssRef()][addcssref]            | <span class="flag update">Mise à jour</span>   |
| Modification du retour SearchDoc::onlyCount() en cas d'erreur               | [SearchDoc::onlyCount()][searchdocOnlycount]     | <span class="flag update">Mise à jour</span>   |
| Avertissement sur l'utilisation de getCustomTitle dans les rapports         | [Doc::getCustomTitle()][customtitlew]            | <span class="flag update">Mise à jour</span>   |
| Modification visuel des attributs de type `file` et `image` en modification | Attributs [file][attrfile] et [image][attrimage] | <span class="flag update">Mise à jour</span>   |
| Option d'attribut `elabel` indiqué comme options communes d'attribut        | [Option elabel][elabel]                          | <span class="flag update">Mise à jour</span>   |
| Gestion des minuteurs                                                       | [Méthode pour les minuteurs][doctimer]           | <span class="flag new">Nouveau chapitre</span> |
|                                                                             |                                                  |                                                |


## Édition 5

|              Modifications              |              Chapitre              |                   Version                    |
| :-------------------------------------- | :--------------------------------- | :------------------------------------------- |
| Précision pour les rapports             | [Doc::getCustomTitle][customtitle] | <span class="flag update">Mise à jour</span> |
| Précision paramètre OPENDOC             | [FDL:OPENDOC][opendoc]             | <span class="flag update">Mise à jour</span> |
| Précision paramétrage du modèle de mail | [Modèle de mail][mailtpl]          | <span class="flag update">Mise à jour</span> |


## Édition 4 {#core-ref:ee35db85-a173-4840-b6d9-ce26eb93e01b}

L'édition 4 de la documentation a modifié les points suivants.


|                  Modifications                  |                     Chapitre                    |                    Version                     |
| :---------------------------------------------- | :---------------------------------------------- | :--------------------------------------------- |
| Description de la mise en place des traductions | [Internationalisation][i18n]                    | <span class="flag new">Nouveau chapitre</span> |
| Ajout chapitres sur les templates               | [Usage avancée des templates][advtemplate]      | <span class="flag new">Nouveau chapitre</span> |
| Ajout graphe d'accès                            | [Cinématique de dynacase][cinematique]          | <span class="flag new">Nouveau chapitre</span> |
| Description des principales tables              | [La base de données][database]                  | <span class="flag new">Nouveau chapitre</span> |
| Famille processus                               | [Famille processus][processus]                  | <span class="flag new">Nouveau chapitre</span> |
| Ajout chapitres Dbobj, QueryDb, Transaction     | [Mécanismes de persistance][persist]            | <span class="flag new">Nouveau chapitre</span> |
| Ajout chapitre compte                           | [Manipulation des comptes utilisateur][account] | <span class="flag new">Nouveau chapitre</span> |
| Ajout chapitre migration                        | [Migration des applications][migration]         | <span class="flag new">Nouveau chapitre</span> |
| Ajout chapitre contrôle d'accès                 | [Contrôle des accès][accesscontrol]             | <span class="flag new">Nouveau chapitre</span> |
| Ajout chapitre zones et actions de référence    | [Zone et actions de référence][zoneref]         | <span class="flag new">Nouveau chapitre</span> |
| Ajout chapitre SearchDoc                        | [Classe SearchDoc][searchdoc]                   | <span class="flag new">Nouveau chapitre</span> |
| Mise à jour des chapitres API                   | [Les essentiels de l'API][apichapter]           | <span class="flag new">Mise à jour</span>      |
| Ajout chapitre Utilitaire gestion de documents  | [Utilitaire gestion de documents][utilDoc]      | <span class="flag new">Nouveau chapitre</span> |


## Modification release 3.2.12 {#core-ref:d402539b-f0dd-4ade-9ea0-03f1d55da1da}

### Internationalisation {#core-ref:ccb46f7b-04f3-4398-b3f4-a09bf9eb508c}

Ajout de la possibilité d'utiliser les [contextes][i18nctx] et les [formes
plurielles][i18nplural] dans les traductions.

### SearchDoc::addGeneralFilter {#core-ref:95ea5aea-add4-4807-9a5c-c04ac1e87966}

La méthode [`SearchDoc::addGeneralFilter()`][searchdocAddGeneralFilter] retourne
systématiquement une exception en cas d'erreur.

### SearchDoc::join {#core-ref:80bd51a7-7db2-45ad-9556-21dc3b56b311}

La méthode [`SearchDoc::join()`][searchdocJoin] retourne une
exception en cas d'erreur.

### SearchDoc::onlyCount {#core-ref:f99061ff-3ec1-4a6f-95b3-5841b6fec880}

La méthode [`SearchDoc::onlyCount()`][searchdocOnlycount] effectue
systématiquement un appel à la base de donnée pour récupérer le résultat.

### SearchDoc::setRecursiveSearch {#core-ref:de878fe6-b2d5-47f8-9bd5-94d8eb2aeeff}

La méthode [`SearchDoc::setRecursiveSearch()`][searchdocrecursivesearch] a un
nouveau paramètre pour indiquer le niveau de profondeur. Ceci évite de mettre à
jour directement la propriété `SearchDoc::folderRecursiveLevel`.

### Importation CSV {#core-ref:a5fa61d8-3a4e-4c9c-9867-8dfae1bdfb29}

Le script [`importDocument`][wshimportDocuments] a de nouvelles options
permettant de configurer l'importation des formats [`csv`][CSV].

L'interface d'administration d'importation des documents permet aussi de
configurer les options d'importation pour les fichiers `csv`.

### Layout::eSet, Layout::eSetBlockData {#core-ref:4d01a2c8-0f6b-4c29-a64c-4b8fbef5b127}

Les méthodes [`Layout::eSet()`][layouteset] et 
[`Layout::eSetBlockData()`][layoutesetblock] ont été ajoutées afin de faciliter
l'ajout de clefs correctement encodées dans des fichiers XML et HTML.

### Dir::insertMultipleDocuments {#core-ref:b66ef951-c5ee-4ee0-9499-7913ed805042}

La méthode [`Dir::insertMultipleDocuments`][insertMultipleDocuments] a été
modifiée afin de faire remonter le message d'erreur de la méthode hameçon
[`Dir::postInsertMultipleDocuments`][postinsertMultipleDocuments] dans son
retour d'erreur.

<!-- link -->
[insertMultipleDocuments]:      #core-ref:098cf44e-568d-4dd2-8dd0-e2f104bc8615
[postinsertMultipleDocuments]:  #core-ref:e3cd509f-8678-4dec-a0cf-33aa39674cfe
[layoutesetblock]:      #core-ref:088e711c-ea91-45e7-841d-289ffc53c80b
[layouteset]:           #core-ref:2696710a-f491-4887-b953-e08d918ef4fb
[wshimportDocuments]:   #core-ref:a14d9475-0431-4aa3-853d-810b61e355a7
[histo]:                #core-ref:e4cf4232-38e7-4673-afd1-5730c1a95c48
[persist]:              #core-ref:5f09399c-bb49-4033-90d6-c04876948269
[account]:              #core-ref:68c93fb2-088c-435a-b4ac-e1b94095d0c9
[cinematique]:          #core-ref:24705f94-2dee-4e84-9429-d89dafe83589
[advtemplate]:          #core-ref:af9ea76c-069e-49e1-a382-efc8ca35f1eb
[database]:             #core-ref:e97a35de-f7f4-465d-8b2d-5c7bab5656eb
[i18n]:                 #core-ref:8f3ad20a-4630-4e86-937b-da3fa26ba423
[processus]:            #core-ref:4a65995d-a61d-4325-89e2-1a9ce15f76e8
[migration]:            #core-ref:d2bd57f9-7b5a-46b0-8570-6b5b0710d7c3
[accesscontrol]:        #core-ref:8d73fa24-b721-4a16-a34b-846004e3e9ca
[zoneref]:              #core-ref:fed06a0c-3fd6-11e3-9658-88d5dc830245
[searchdoc]:            #core-ref:a5216d5c-4e0f-4e3c-9553-7cbfda6b3255
[searchdocAddGeneralFilter]:    #core-ref:453cff11-09d9-4607-ab81-7acd36e99750
[searchdocJoin]:                #core-ref:c7fe0a1b-e71a-45d4-9182-9e4561558030
[searchdocOnlycount]:           #core-ref:2d43be1a-1991-42dd-a25d-5c3bb0b393fa
[searchdocrecursivesearch]:     #core-ref:b99a6125-5a8b-420b-b1ce-f6a459f11612
[CSV]: http://fr.wikipedia.org/wiki/Comma-separated_values "Comma-separated values sur wikipedia"
[i18nplural]:           #core-ref:3e6b8eee-4171-11e3-9688-cffb8e583c34
[i18nctx]:              #core-ref:3275febc-4171-11e3-9773-cffb8e583c34
[apichapter]:           #core-ref:0c6d26ba-ab12-4659-aaf9-bcad5a1194ef
[Dir::insertMultipleDocuments]: #core-ref:098cf44e-568d-4dd2-8dd0-e2f104bc8615
[Dir::postInsertMultipleDocuments]: #core-ref:e3cd509f-8678-4dec-a0cf-33aa39674cfe
[utilDoc]:                          #core-ref:deb7de49-dbfb-4feb-8f35-cc9aedf352a2
[customtitle]:              #core-ref:3c5ff78d-c080-48fb-a293-9736ed4e95b8
[opendoc]:          #core-ref:f9e68fa7-01b7-4903-9718-744271d63112
[mailtpl]:          #core-ref:8723b1aa-10d3-4316-af6b-071f4d59ceee
[commonoptions]:    #core-ref:16e19c90-3233-11e2-a58f-6b135c3a2496
[famattrtitle]:      #core-ref:b0e414c0-b795-4bbe-b70e-a308b7f1b4ab
[returnfamilyparam]: #core-ref:7cffbb46-353a-4072-9bca-1773599857dc
[profildoc]:         #core-ref:f1575705-10e8-4bf2-83b3-4c0b5bfb77cf
[addcssref]:         #core-ref:4bba8a6b-8002-4c0a-8ac7-70d75b31b02b
[customtitlew]:      #core-ref:d7c909a8-f2fa-4ddf-954c-00704e9a694d
[attrfile]:         #core-ref:0e904376-317c-426e-bc6d-e56fd52bad89
[attrimage]:        #core-ref:4fca7712-59e0-4186-bfd0-6214104a0f60
[elabel]:           ./core-ref:16e19c90-3233-11e2-a58f-6b135c3a2496.html#commonELabel "Option commune de elabel"
[doctimer]:          #core-ref:6403d0d7-9e4c-42e9-8a07-a2256a7c43f7
[import_profil]:    #core-ref:2ec1ae6f-4b2a-4bc2-a100-4e5873538bb5
[display_row_count]: #core-ref:9eb6f53f-158d-497d-a472-2602a195cbce