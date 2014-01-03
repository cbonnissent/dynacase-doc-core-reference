# Doc::getMultipleRawValues() {#core-ref:4faf4b7c-ce4e-43a9-a95d-4b1adb1ad1a2}

<div class="short-description" markdown="1">

La méthode `getMultipleRawValues` permet de retourner les valeurs d'un attribut
[multi-valué][option_multiple] ou d'un attribut rattaché à un attribut de type
[`array`][type_array].

</div>

## Description {#core-ref:82a43608-0155-4741-a7e3-3ba6a7e82db1}

    [php]
    mixed getMultipleRawValues ( string $idAttr,
                                 string $def   = "",
                                    int $index = - 1 )

La méthode `getMultipleRawValues` permet d'obtenir les valeurs d'attributs
multi-valués.

Les attributs multi-valués peuvent être :

* des attributs déclarés avec l'option [`multiple=yes`][option_multiple] ;
* des attributs rattachés à un attribut de type [`array`][type_array].

### Avertissements {#core-ref:cd162ad0-9cc3-4c49-8160-5be597c3530d}

Aucun.

## Liste des paramètres {#core-ref:e574b6f7-d2b1-4973-891b-b231c37f99b0}

(string) `idAttr`
:   Le nom de l'attribut multi-valué dont on souhaite obtenir les valeurs.

(string) `def`
:   `def` permet de spécifier la valeur par défaut qui sera retournée si
    l'attribut n'est pas valué.
    
    Par défaut, la valeur par défaut est une chaîne vide.

(int) `index`
:   `index` permet d'obtenir la valeur à un indice (à partir de 0) donné.
    
    Si `index` est égal à `-1`, alors toutes les valeurs de l'attribut sont
    retournées.
    
    Si `index` est supérieur ou égal au nombre de valeurs, alors la valeur par
    défaut définie par `def` est retournée.

## Valeur de retour {#core-ref:35e136af-410b-4bfe-b531-f36d73809278}

La méthode retourne

-   la valeur (scalaire) si le paramètres `index` est différent de `-1`,
-   les valeurs (array) si `index` vaut `-1`,
-   ou la valeur scalaire par défaut `def` si l'attribut n'est pas valué.

## Erreurs / Exceptions {#core-ref:b350846e-3ab5-45c8-abf3-8f355a8da577}

Aucune.

## Historique {#core-ref:2b9bd644-52ef-4d4d-a158-119741ac9c4f}

### Release 3.2.5 {#core-ref:ea42f46a-8eae-4a6f-ae2f-a8c20dbfbd57}

La méthode `getMultipleRawValues` remplace la méthode précédemment nommée
`getTValue`.

L'utilisation de `getTValue` est obsolète depuis la version 3.2.5 de
dynacase-core.

## Exemples {#core-ref:218ac78c-8f34-4066-951e-83d1d06021c5}

-   Exemple #1
    
    L'attribut `us_groups` est de type [`array`][type_array], avec les colonnes
    `us_idgroup` de type `docid("IUSER")` et `us_group` de type `text`.
    
        [php]
        /*
         * Obtenir l'ensemble des valeurs de la colonne `us_group`
         */
        $v = $iuser->getMultipleRawValues(
            \Dcp\AttributeIdentifiers\Iuser::us_group
        );
        
        var_dump($v);
    
    Résultat :
    
        [php]
        array(3) {
          [0]=>
          string(3) "Foo"
          [1]=>
          string(3) "Bar"
          [2]=>
          string(3) "Baz"
        }

-   Exemple #2
    
    L'attribut `us_groups` est de type [`array`][type_array], avec les colonnes
    `us_idgroup` de type `docid("IUSER")` et `us_group` de type `text`.
    
        [php]
        /*
         * Obtenir la deuxième valeur de la colonne `us_group`
         * (valeur à l'indice 1)
         */
        $v = $iuser->getMultipleRawValues(
            \Dcp\AttributeIdentifiers\Iuser::us_group,
            "",
            1
        );
        
        var_dump($v);
    
    Résultat :
    
        [php]
        string(3) "Bar"

## Notes {#core-ref:136941c1-6eb9-44ea-adb1-9f896a9c0608}

Aucune.

## Voir aussi {#core-ref:0cf414c9-ae7f-4ebb-acb1-7c6dcfd3222f}

- [`Doc::getArrayRawValues`][Doc::getArrayRawValues]
- [`Doc::getRawValue`][Doc::getRawValue]

<!-- links -->
[type_array]: #core-ref:dd400581-8896-4eec-9b9e-f1e5669cf180
[option_multiple]: #core-ref:2448fbfc-c138-4134-aa46-800080f63738
[Doc::getArrayRawValues]: #core-ref:ecd1b8a5-db69-4a68-aa16-5a1e50c90796
[Doc::getRawValue]: #core-ref:f779391c-ee61-4c3a-8976-6b74f83ecc8f
