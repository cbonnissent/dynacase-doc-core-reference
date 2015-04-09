# cleanContext {#core-ref:100b123b-da1a-45b4-848b-0622f3e09a40}

## Description {#core-ref:b4753378-0d6a-48ad-a80f-0cd63a9e8620}

Le script `cleanContext` permet d'effectuer les opérations de nettoyage
journalières du contexte.

Opérations principales :

* Suppression des messages de log antérieurs à la durée de rétention paramétrée
  par [`CORE_LOGDURATION`][core_logduration].
* Suppression des fichiers temporaires antérieurs à la durée de rétention
  paramétrée par [`CORE_TMPDIR_MAXAGE`][core_tmpdirmaxage].
* Suppression des documents Dynacase temporaires, et des noms logiques
  temporaires (générés par l'[Exportation des profils][exportation_des_profils]
  par exemple).
* Nettoyage des noms logiques lorsque des documents ont été supprimés à la main
  en base de données.

## Usage {#core-ref:f0ae7db2-44cc-4593-9019-09ffe005cb8d}

`full` 
:   Permet d'effectuer des opérations de nettoyage additionnelles
    (telles que lancées, la nuit, par la crontab du contexte) :
    
    * Suppression des références à des documents supprimés dans les répertoires
      (`DIR`).
    * Suppression des verrous sur les documents.
    * Suppression de la définition des attributs pour les familles supprimées à
      la main en base de données.

## Limite d'usage {#core-ref:e93f7a7a-1707-4beb-bb06-7834a935d5e5}

N/A

<!-- link -->
[exportation_des_profils]: #core-ref:602c6331-7cdb-4b24-8a56-ffd11e00502f
[core_logduration]: #core-ref:0cebb954-7127-42bb-88df-28767a141f6a
[core_tmpdirmaxage]: #core-ref:24a36fc9-b3bb-4bab-a06c-ac28c4372d57