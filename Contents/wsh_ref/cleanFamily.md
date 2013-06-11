# cleanFamily {#core-ref:acd27d66-0b1c-4eef-ae8b-d4b5ae64f750}

Ce script permet de supprimer tous les attributs en base de données qui ne sont
pas définis dans la famille.

**Attention** : Ceci est irréversible !

## Usage {#core-ref:d1eaa7a1-9b7b-4464-bfb9-52d568aff032}

**`famid` (obligatoire)**
:   identifiant (ou nom logique) de la famille sur laquelle appliquer le script.

`without-confirm`
:   Ne demande pas de confirmation. En l'absence de ce paramètre, une
    confirmation est demandée sur stdin.

`verify-only`
:   N'effectue pas les changements, liste juste les attributs qui seront
    supprimées.