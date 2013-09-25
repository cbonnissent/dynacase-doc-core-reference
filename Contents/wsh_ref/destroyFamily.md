# destroyFamily {#core-ref:534bf934-5a2f-4160-8912-567d8f933ddb}

## Description {#core-ref:85b1f18e-4f61-4668-9b2a-799223f2321c}

Le script `destroyFamily` permet de supprimer complètement une famille et ses
documents.

## Usage {#core-ref:9ae91119-bff2-4266-9d90-d1a1468c7f11}

**`famid` (obligatoire)**
:   Identifiant, ou nom logique, de la famille sur laquelle appliquer le
    traitement.

`transaction` 
:   Permet d'indiquer que l'erreur d'une sous-opération doit annuler
    l'ensemble des modifications.  
    Dans le cas contraire,  l'échec d'une sous-opération ne mettra pas en erreur
    l'ensemble du traitement, qui poursuivra alors son exécution.

## Limite d'usage {#core-ref:fd57e437-c873-44bf-b691-e2c42d2950da}

**Attention** : La suppression d'une famille entraîne la suppression de tous les
documents de cette famille et cette opération est irréversible.

Dans le cas de la suppression d'une famille qui comporte des familles dérivées,
il faudra d'abord supprimer les familles dérivées avant de pouvoir supprimer
cette famille parente.
