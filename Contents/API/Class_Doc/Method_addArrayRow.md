# Doc::addArrayRow() {#core-ref:d75110cb-24f6-4810-9b62-45ce6fd99e70}

<div class="short-description" markdown="1">

La méthode `addArrayRow` permet d'ajouter, ou d'insérer, une ligne dans un
attribut de type [`array`][type_array].

</div>

## Description {#core-ref:854cf0d0-611c-4539-8c8d-5842a46ac929}

    [php]
    string addArrayRow ( string $idAttr,
                          array $tv,
                            int $index = -1 )

La méthode `addArrayRow` permet d'ajouter, ou d'insérer à un indice donné, une
ligne dans un attribut de type [`array`][type_array].

La ligne insérée entraîne un décalage des lignes d'indice supérieur, qui montent
alors toutes d'un cran.

### Avertissements {#core-ref:9a730926-ffb9-4e19-9fcd-4c687d84b374}

Aucun.

## Liste des paramètres {#core-ref:182f26c7-59bd-4423-8994-b8a416c679b7}

(string) `idAttr`
:   Le nom de l'attribut de type [`array`][type_array] auquel on souhaite
    ajouter, ou insérer, une ligne.

(array) `tv`
:   Un tableau associatif dont la clef est le nom d'un attribut colonne du
    array, et la valeur est la valeur a affecter à cette colonne.
    
(int) `index`
:   `index` permet de spécifier l'indice (à partir de 0) où insérer la ligne
    dans le tableau.
    
    Si `index` vaut `0`, alors la ligne est insérée au début du tableau.
    Si `index` vaut -1 ou est supérieur ou égal au nombre de lignes du tableau,
    la ligne est alors ajoutée à la fin du tableau.

## Valeur de retour {#core-ref:9ef3c825-5f88-472f-95ed-cb1f5ff9763d}

La méthode retourne une chaîne vide s'il n'y a pas d'erreurs, ou une chaîne
non-vide contenant le message d'erreur dans le cas contraire.

## Erreurs / Exceptions {#core-ref:552748f0-127f-4522-a1d3-ca47bdee2b54}

Une erreur est retournée si :

* l'attribut `idAttr` n'est pas de type [`array`][type_array] ;
* la valeur `tv` n'est pas un array PHP ;
* une clef de `tv` n'est pas le nom d'un attribut attaché à l'attribut `idAttr`.

## Historique {#core-ref:c5324307-a994-435c-aebb-2baaa2bd9b49}

Aucun.

## Exemples {#core-ref:832e4161-65a4-4b3f-a67a-edbe4a561146}

Soit un attribut `faces` de type `array` auquel sont rattachés les attributs
`face_firstname` et `face_lastname` de type `text`.

- Exemple #1

    [php]
    /*
     * Vide le tableau
     */
    $photo->clearArrayValues(\Dcp\AttributeIdentifier\MyPhoto::faces);
    
    /*
     * Ajoute une ligne
     */
    $row = array(
        \Dcp\AttributeIdentifiers\MyPhoto::face_firstname => 'Marge',
        \Dcp\AttributeIdentifiers\MyPhoto::face_lastname  => 'Simpson'
    );
    $photo->addArrayRow(\Dcp\AttributeIdentifier\MyPhoto::faces, $row);
    
    /*
     * Ajoute une autre ligne
     */
    $row = array(
        \Dcp\AttributeIdentifiers\MyPhoto::face_firstname => 'Homer',
        \Dcp\AttributeIdentifiers\MyPhoto::face_lastname  => 'Simpson'
    );
    $photo->addArrayRow(\Dcp\AttributeIdentifier\MyPhoto::faces, $row);
    
    /*
     * Insère une ligne entre Marge et Homer
     */
    $row = array(
        \Dcp\AttributeIdentifiers\MyPhoto::face_firstname => 'Lisa',
        \Dcp\AttributeIdentifiers\MyPhoto::face_lastname  => 'Simpson'
    )
    $photo->addArrayRow(\Dcp\AttributeIdentifier\MyPhoto::faces, $row, 1);
    
    /*
     * Insère une ligne au début
     */
    $row = array(
        \Dcp\AttributeIdentifiers\MyPhoto::face_firstname => 'Bart',
        \Dcp\AttributeIdentifiers\MyPhoto::face_lastname  => 'Simpson'
    )
    $photo->addArrayRow(\Dcp\AttributeIdentifier\MyPhoto::faces, $row, 0);

Le tableau `MyPhoto::faces` résultant est alors composé comme suit :

       +-----------+----------+
       | Firstname | Lastname |
       +===========+==========+
    #0 | Bart      | Simpson  |
    #1 | Marge     | Simpson  |
    #2 | Lisa      | Simpson  |
    #3 | Homer     | Simpson  |
       +-----------+----------+

## Notes {#core-ref:c02e12d4-8bbc-4f5e-bcd4-6b57e252e867}

Aucune.

## Voir aussi {#core-ref:22b3ab38-e624-43aa-a41d-cc61f4bfb91f}

- [`Doc::clearArrayValues`][Doc::clearArrayValues]
- [`Doc::removeArrayRow`][Doc::removeArrayRow]

<!-- links -->
[type_array]: #core-ref:dd400581-8896-4eec-9b9e-f1e5669cf180
[Doc::clearArrayValues]: #core-ref:ec1a6a50-1477-4326-b60b-c1d4ce5e4ef1
[Doc::removeArrayRow]: #core-ref:af3014ba-dbde-46f8-8d57-7c883cfc0c19
