# Classe Dir {#core-ref:dd2077e0-7f3d-4974-bdb0-62a92427754d}

La famille `DIR` est la famille *"Dossier"*. Cette famille permet de référencer
des documents au sein d'une même collection. Cette famille hérite de la classe
`Dir`.

Un document de la famille `DIR` est appelé un [dossier][dossier].

Cette classe, comme la classe `DocSearch` (pour la famille
[`SEARCH`][docsearch]), hérite de la classe [`DocCollection`][collection] qui
apporte les méthodes de contenus commune aux dossiers et aux recherches tel que
`::getContent()`.

Les méthodes de la famille `DIR` permettent de gérer le référencement (ajout ou
suppression) de documents dans des dossiers.


Lors de l'ajout ou de la suppression des documents du dossier, des
[hameçons][dirhooks] peuvent être appelés.


<!-- links -->
[dirhooks]:     #core-ref:58c0013a-006d-4d72-94de-467bc9e563f9
[dossier]:      #core-ref:aa28a2c3-e74d-4b36-ad8f-ae1bb93b6726
[docsearch]:    #core-ref:64c27570-07bf-4eb8-b970-d2b392716b52
[collection]:   #core-ref:daece1b9-d710-46dc-85b6-16baa97322ab