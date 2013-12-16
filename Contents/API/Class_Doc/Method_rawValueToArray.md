# Doc::rawValueToArray() {#core-ref:5f4c4ac5-7429-4d07-94d0-245fe63cbfe5}

<div class="short-description" markdown="1">

La méthode `rawValueToArray` permet de de-sérialiser la valeur d'un attribut
faisant partie d'un [array][type_array] ou d'un attribut
[multi-valué][option_multiple].

</div>

## Description {#core-ref:cc0ce5a1-34eb-490b-957d-db24a7831d67}

    [php]
    array rawValueToArray ( string $v )

La méthode `rawValueToArray` permet de de-sérialiser une valeur sous la forme
d'une chaîne de caractères issue d'un attribut faisant parti d'un
[array][type_array], ou d'un attribut [multi-valué][option_multiple], obtenue
via la méthode [`Doc::getRawValue`][Doc::getRawValue].

### Avertissements {#core-ref:d60db1fb-12af-4752-8b76-8de9271e3843}

La méthode `rawValueToArray` est une méthode de bas niveau que vous ne devriez
utiliser qu'en dernier recours.

Il faut privilégier l'utilisation de la méthode
[`getAttributeValue`][Doc::getAttributeValue] qui prend en charge
automatiquement ces opérations de de-sérialisation.


## Liste des paramètres {#core-ref:2b52bcba-8dd4-4b0f-9854-3eac0a5ffb1b}

(string) `v`
:   La chaîne de caractère à de-sérialiser.

## Valeur de retour {#core-ref:a536fd4f-33d9-4f7c-a500-8b3772283d3c}

La méthode `rawValueToArray` retourne un array contenant les valeurs issues de
la chaîne de caractère fourni.

## Erreurs / Exceptions {#core-ref:d81ca1cf-a46a-40dc-bb30-c82696136b23}

Aucune.

## Historique {#core-ref:0d465b43-4d47-4552-b500-aa62d8012c0a}

### Release 3.2.5 {#core-ref:fde80b8e-908b-4d0e-b857-0be662bc9627}

La méthode `rawValueToArray` remplace la méthode précédemment nommée
`_val2array`.

L'utilisation de `_val2array` est obsolète depuis la version 3.2.5 de
dynacase-core.

## Exemples {#core-ref:e42d8e3a-6f9d-4d65-92b2-3bd078ebc3aa}

- Exemple #1

L'attribut `PHOTO_KEYWORDS` est un attribut de type texte avec l'option
[multiple][option_multiple].

    [php]
    $v = $photo->getRawValue(\Dcp\AttributeIdentifiers\MyPhoto:photo_keywords);
    
    var_dump($photo->rawValueToArray($v));

Résultat :

    array(4) {
      [0]=>
      string(11) "Tour Eiffel"
      [1]=>
      string(13) "Champ de Mars"
      [2]=>
      string(5) "Paris"
      [3]=>
      string(6) "France"
    }

## Notes {#core-ref:4cd35543-2bc7-43a6-9151-c8b041a55ad5}

Aucune.

## Voir aussi {#core-ref:05707075-e1d3-4113-9927-e67cf49c0357}

- [`Doc::getAttributeValue`][Doc::getAttributeValue]
- [`Doc::arrayToRawValue`][Doc::arrayToRawValue]
- [`Doc::getRawValue`][Doc::getRawValue]
- Attribut [array][type_array] et [multi-valué][option_multiple]

<!-- links -->
[Doc::arrayToRawValue]: #core-ref:717f6ca6-a46c-4acd-a7fb-29ff6460aa15
[Doc::getRawValue]: #core-ref:f779391c-ee61-4c3a-8976-6b74f83ecc8f
[Doc::getAttributeValue]: #core-ref:e4a8d6ff-7229-4105-81c4-94773ac24dfd
[type_array]: #core-ref:dd400581-8896-4eec-9b9e-f1e5669cf180
[option_multiple]: #core-ref:2448fbfc-c138-4134-aa46-800080f63738
