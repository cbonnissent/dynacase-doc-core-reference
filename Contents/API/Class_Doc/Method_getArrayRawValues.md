# Doc::getArrayRawValues() {#core-ref:ecd1b8a5-db69-4a68-aa16-5a1e50c90796}

<div class="short-description" markdown="1">

La méthode `getArrayRawValues` retourne les valeurs d'un attribut de type
[`array`][type_array].

</div>

## Description {#core-ref:7573594f-3b1e-4412-aa43-bbf8db352b89}

    [php]
    array|bool(false) getArrayRawValues ( string $idAttr,
                                             int $index = -1 )

La méthode `getArrayRawValues` retourne les valeurs des attributs rattachés à
cet attribut de type [`array`][type_array], sous la forme d'une liste de lignes
composées chacune d'un tableau associatif.

### Avertissements {#core-ref:539d4491-e79d-4626-ac60-1f7bdb1acf95}

Aucun.

## Liste des paramètres {#core-ref:da90dfd1-4308-473d-9266-2d30bb6d018d}

(string) `idAttr`
:   Le nom de l'attribut de type [`array`][type_array] dont on souhaite obtenir
    les valeurs.

(int) `index`
:   `index` permet de ne retourner qu'une ligne en particulier en spécifiant
    l'indice (à partir de 0) de la ligne qu'on souhaite obtenir.
    
    Si `index` est égal à -1, alors toutes les lignes sont retournées.
    Si `index` est supérieur ou égal au nombre de lignes du tableau, alors une
    ligne vide est retournée.

## Valeur de retour {#core-ref:a486a040-beeb-4ee7-ae43-5eff4ddab7c1}

La méthode retourne le booléen `false` s'il y a une erreur.

Soit le tableau suivant :

| attr_1 | attr_2 | […] | attr_N |
|:------:|:------:|:---:|:------:|
| $L1_C1 | $L1_C2 | […] | $L1_CN |
| […]    | […]    | […] | […]    |
| $LM_C1 | $LM_C2 | […] | $LM_CN |

S'il n'y a pas d'erreur, la méthode retourne les lignes sous la forme
suivante :

    [php]
    array(
        /* Ligne 1 */
        0 => array(
            'attr_1' => $L1_C1, /* Colonne 1 */
            'attr_2' => $L1_C2, /* Colonne 2 */
            […]
            'attr_N' => $L1_CN  /* Colonne N */
        ),
        
        [...]
        
        /* Ligne M */
        M => array(
            'attr_1' => $LM_C1,
            'attr_2' => $LM_C2,
            […]
            'attr_N' => $LM_CN
        )
    )

Si une ligne particulière est demandée (utilisation du paramètre `index`), alors
seule la ligne demandée est retournée :

    [php]
    array(
        'attr_1' => $L1_C1, /* Colonne 1 */
        'attr_2' => $L1_C2, /* Colonne 2 */
        [...]
        'attr_N' => $L1_CN  /* Colonne N */
    )

## Erreurs / Exceptions {#core-ref:b4825b06-9861-4382-bd5e-f719770fff32}

Une erreur est retournée (`false`) si :

* l'attribut `idAttr` n'est pas de type [`array`][type_array].

## Historique {#core-ref:2b5f7da4-9ea7-48b4-a5b9-f6ecf9b998fb}

### Release 3.2.5 {#core-ref:61eef6f3-2f8f-491b-ae9c-fbe5d9680beb}

La méthode `getArrayRawValues` remplace la méthode précédemment nommée
`getAValues`.

L'utilisation de `getAValues` est obsolète depuis la version 3.2.5 de
dynacase-core.

## Exemples {#core-ref:a52ecff3-ecfe-4a3a-8595-567d92644ef4}

-   Exemple #1 :
    
    L'attribut `us_groups` est de type [`array`][type_array], avec les colonnes
    `us_idgroup` de type `docid("IUSER")` et `us_group` de type `text`.
    
        [php]
        /*
         * Retourner le contenu entier du tableau.
         */
        $v = $iuser->getArrayRawValues(
            \Dcp\AttributeIdentifiers\Iuser::us_groups
        );
        
        var_dump($v);
    
    Résultat :
    
        [php]
        array(3) {
          [0]=>
          array(2) {
            ["us_group"]=>
            string(3) "Foo"
            ["us_idgroup"]=>
            string(4) "1058"
          }
          [1]=>
          array(2) {
            ["us_group"]=>
            string(3) "Bar"
            ["us_idgroup"]=>
            string(4) "1059"
          }
          [2]=>
          array(2) {
            ["us_group"]=>
            string(3) "Baz"
            ["us_idgroup"]=>
            string(4) "1060"
          }
        }

-   Exemple #2 :
    
    L'attribut `us_groups` est de type [`array`][type_array], avec les colonnes
    `us_idgroup` de type `docid("IUSER")` et `us_group` de type `text`.
    
        [php]
        /*
         * Retourner seulement les valeur de la deuxième ligne
         * (ligne à l'indice 1).
         */
        $v = $iuser->getArrayRawValues(
            \Dcp\AttributeIdentifiers\Iuser::us_groups,
            1
        );
        
        var_dump($v);
    
    Résultat :
    
        [php]
        array(2) {
          ["us_group"]=>
          string(3) "Bar"
          ["us_idgroup"]=>
          string(4) "1059"
        }

## Notes {#core-ref:e15ddb50-7018-4ed8-94ab-f81afbedb097}

Aucune.

## Voir aussi {#core-ref:73e51e99-41db-449e-a791-d8d22175f405}

- [`Doc::getMultipleRawValues`][Doc::getMultipleRawValues]

<!-- links -->
[type_array]: #core-ref:dd400581-8896-4eec-9b9e-f1e5669cf180
[Doc::getMultipleRawValues]: #core-ref:4faf4b7c-ce4e-43a9-a95d-4b1adb1ad1a2
