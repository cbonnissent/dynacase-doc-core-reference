# cleanFamily {#core-ref:acd27d66-0b1c-4eef-ae8b-d4b5ae64f750}

## Description {#core-ref:36d1817a-4749-444e-8e52-f70ca08014d4}

Ce script permet de supprimer tous les attributs en base de données qui ne sont
pas définis dans la famille. Les valeurs de ces attributs sont aussi supprimées
sur les documents.

## Usage {#core-ref:d1eaa7a1-9b7b-4464-bfb9-52d568aff032}

**`famid` (obligatoire)**
:   Identifiant (ou nom logique) de la famille sur laquelle appliquer le script.
    
    La valeur `0` indique que l'opération est à effectuer sur toutes les
    familles.

`without-confirm`
:   Ne demande pas de confirmation. En l'absence de ce paramètre, une
    confirmation est demandée sur stdin.

`verify-only`
:   N'effectue pas les changements, liste juste les attributs qui seront
    supprimées.

## Limite d'usage {#core-ref:6b17a03c-ff0d-4c69-ae74-58423cd1f16f}

**Attention** : Cette opération est irréversible !

Dans le cas de l'application sur une famille qui comporte des familles dérivées,
le traitement sera aussi appliqué à ces familles dérivées.
