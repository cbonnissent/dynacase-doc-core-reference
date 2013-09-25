# SearchDoc::setOrder() {#core-ref:d4f0b749-ed89-460e-a84c-6c044cb1c7d7}

<div class="short-description">
Les résultats de la recherche peuvent être ordonnés à l'aide de la méthode
"setOrder()" qui permet de spécifier les attributs en fonction desquels seront
triés les résultats.
</div>


## Description {#core-ref:051c8c96-edad-492e-92a5-4f492ea8fb14}

    [php]
    void setOrder ( string $order, string $orderbyLabel = '' )

<span class="fixme template">long description</span>

### Avertissements {#core-ref:f596b417-1d51-4b8a-9308-2aec7152c27c}

<span class="fixme template">Avertissements</span>

## Liste des paramètres {#core-ref:d6cc0c54-2a69-4dce-b1a3-3879ff139e17}

(string) `order` 
:    une chaîne de caractères contenant la liste des colonnes (séparées par une
    virgule) en fonction desquelles le résultat sera ordonné. Le nom des colonnes
    peut être suffixé par un espace et le mot-clef 'asc' ou 'desc' afin de spécifier
    l'ordre du tri : ASCendant ou DESCendant (par défaut, la colonne est triée dans
    l'ordre ASCendant).

(string) `orderbyLabel` 
:   une chaîne de caractères contenant le nom d'une des colonnes spécifiées dans
    l'argument #1 (sans le suffixe de tri 'asc' ou 'desc') et pour laquelle le tri
    devra être fait non pas sur la valeur de l'attribut, mais sur le label ou le
    titre. Les attributs actuellement supportés pour l'ordonnancement par le
    label ou le titre sont : Les attributs de type 'enum'.  
    Les attributs de type 'docid("X")' déclarés avec une option 
    'doctitle=auto' ou 'doctitle=xxx'.

## Valeur de retour {#core-ref:d8e71435-38f9-44b5-9615-b8abb5d875f6}

Aucune.

## Erreurs / Exceptions {#core-ref:fa716683-f56e-4535-854c-d30a7f42ef83}

Aucune.

## Historique {#core-ref:c3158295-d9f3-489c-88e6-04ff104b4608}

Aucun.

## Exemples {#core-ref:5bd8f543-e92e-4396-9720-70d6d8587cec}

Exemple de tri en fonction d'un attribut entier ou de la clef d'un énuméré :

    [php]
    $s=new searchDoc($dbaccess, $famId);
    $s->setOrder("a_integer desc");
    $s->search();

    [php]
    $s=new searchDoc($dbaccess, $famId);
    $s->setOrder("a_enum asc");
    $s->search();

Exemple de tri en fonction du label d'un énuméré :

    [php]
    $s=new searchDoc($dbaccess, $famId);
    $s->setOrder("a_enum asc", "a_enum");
    $s->search();

Dans les exemples ci-dessus, si l'énuméré 'a_enum' est définit avec
`1|Accepté,2|Traité,3|Rejeté,4|Clos`, alors les documents seront retournés dans
l'ordre ci-dessous :


| setOrder("a_enum") | setOrder("a_enum", "a_enum") |
| ------------------ | ---------------------------- |
| 1-Accepté          | 1-Accepté                    |
| 2-Traité           | 4-Clos                       |
| 3-Rejeté           | 3-Rejeté                     |
| 4-Clos             | 2-Traité                     |



## Notes {#core-ref:bacd48d6-adf1-466f-9848-a01805179110}

Les colonnes de tri sont des noms d'attributs ou de propriétés de documents.

## Voir aussi {#core-ref:84c817d6-042d-4baf-bde4-4bb5fe81deb9}


