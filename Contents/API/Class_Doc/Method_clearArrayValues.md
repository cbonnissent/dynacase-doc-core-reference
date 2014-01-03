# Doc::clearArrayValues() {#core-ref:ec1a6a50-1477-4326-b60b-c1d4ce5e4ef1}

<div class="short-description" markdown="1">

La méthode `clearArrayValues` permet de vider les valeurs d'un attribut de type
[`array`][type_array].

</div>

## Description {#core-ref:ae248b39-78c6-4fb3-b1a0-e8cbdcb5da54}

    [php]
    string clearArrayValues ( string $idAttr )

La méthode `clearArrayValues` permet de vider les valeurs d'un attribut de type
[`array`][type_array] en vidant le contenu de tous les attributs rattachés à
cet array.

### Avertissements {#core-ref:bc51a703-9b6e-43bf-84e5-6f77a87801cb}

Aucun.

## Liste des paramètres {#core-ref:c70c2690-0a66-42a7-b380-2dbdcfc1442a}

(string) `idAttr`
:   Le nom de l'attribut de type [`array`][type_array] dont on souhaite vider le
    contenu.

## Valeur de retour {#core-ref:daa8210a-0705-40bf-b91a-65283f824575}

La méthode retourne une chaîne vide s'il n'y a pas d'erreur, ou une chaîne
non-vide contenant le message d'erreur dans le cas contraire.

## Erreurs / Exceptions {#core-ref:1eccec47-d4e3-48a1-9a24-761d412d2626}

Si l'attribut `idAttr` spécifié n'est pas de type [`array`][type_array], un
message d'erreur est retourné.

## Historique {#core-ref:1887627f-cc1e-4483-8ae1-0be5c2acdf6c}

### Release 3.2.5 {#core-ref:1a1f2752-593f-4495-8bf3-5a37a8aeb310}

La méthode `clearArrayValues` remplace la méthode précédemment nommée
`deleteArray`.

L'utilisation de `deleteArray` est obsolète depuis la version 3.2.5 de
dynacase-core.

## Exemples {#core-ref:85e67c69-dab9-44ae-a099-92d0e6414af6}

-   Exemple #1
    
    L'attribut `photo_list` est un attribut de type [`array`][type_array]
    contenant les  attributs `photo_file` de type `file` et `photo_comment` de
    type `htmltext`.
    
        [php]
        $album->deleteArray(\Dcp\AttributeIdentifier\MyAlbum::photo_list);
    
    Le contenu des attributs `photo_file` et `photo_comment` est alors effacé.
    
    De la même manière, le tableau peut être vidé en vidant explicitement
    chacune des colonnes de l'array :
    
        [php]
        $album->clearValue(\Dcp\AttributeIdentifiers\MyAlbum::photo_file);
        $album->clearValue(\Dcp\AttributeIdentifiers\MyAlbum::photo_comment);

## Notes {#core-ref:4c6f3f21-dd08-41c7-9457-786095a4be01}

Aucune.

## Voir aussi {#core-ref:be92bad1-34b5-4a00-8701-7abfdfbdb782}

- [`Doc::addArrayRow`][Doc::addArrayRow]
- [`Doc::removeArrayRow`][Doc::removeArrayRow]
- [`Doc::clearValue`][Doc::clearValue]

<!-- links -->
[type_array]: #core-ref:dd400581-8896-4eec-9b9e-f1e5669cf180
[Doc::addArrayRow]: #core-ref:d75110cb-24f6-4810-9b62-45ce6fd99e70
[Doc::removeArrayRow]: #core-ref:af3014ba-dbde-46f8-8d57-7c883cfc0c19
[Doc::clearValue]: #core-ref:30b0592f-f0cd-498f-bc5f-301891c297e0
