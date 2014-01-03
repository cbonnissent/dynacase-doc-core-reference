# Doc::arrayToRawValue() {#core-ref:717f6ca6-a46c-4acd-a7fb-29ff6460aa15}

<div class="short-description" markdown="1">

La méthode `arrayToRawValue` permet de sérialiser un ensemble de valeurs pour
les utiliser dans un attribut faisant partie d'un [array][type_array] ou un
attribut [multi-valué][option_multiple].

</div>

## Description {#core-ref:d07bc40e-244f-4078-a755-b03cea5bc056}

    [php]
    string arrayToRawValue ( array(string) $v,
                                    string $br = "<BR>" )

La métode `arrayToRawValue` permet de sérialiser un ensemble de valeurs sous la
forme d'une chaîne de caractères qui peut ensuite être utilisée pour
positionner la valeur d'un attribut faisant partie d'un [array][type_array],
ou d'un attribut [multi-valué][option_multiple], avec la méthode
[`Doc::setValue`][Doc::setValue].

Les valeurs sont sérialisées par une concaténation avec le caractère `\n`
utilisé comme séparateur.

### Avertissements {#core-ref:609111ac-6775-491d-9ef9-ef71b0e28095}

La méthode `arrayToRawValue` est une méthode de bas niveau que vous ne devriez
utiliser qu'en dernier recours.

Il faut privilégier l'utilisation de la méthode
[`setAttributeValue`][Doc::setAttributeValue] qui prend en charge
automatiquement ces opérations de sérialisation.

## Liste des paramètres {#core-ref:6d085caa-1128-49ad-be08-c72f8109b640}

(array(string)) `v`
:   Une liste de chaînes de caractères.

(string) `br`
:   `br` permet de spécifier la chaîne de caractère utilisée pour substituer le
    caractère retour à la ligne `\n` dans les valeurs à sérialiser.
    
    Par défaut, la chaîne de caractères de substitution est la chaîne
    `<BR>`.

## Valeur de retour {#core-ref:e1d2a73e-3def-47dd-bb9e-ce0ff13bdf89}

La méthode `arrayToRawValue` retourne une chaîne de caractères correspondant à
la sérialisation des valeurs fournies.

## Erreurs / Exceptions {#core-ref:034557e1-fc5d-4f53-a3ab-85107adf86c1}

Aucune.

## Historique {#core-ref:9202b024-eeed-4a0f-a128-9b163477db47}

### Release 3.2.5 {#core-ref:32b4b7d1-72a0-4cdf-9d33-2c4e304fcbbb}

La méthode `arrayToRawValue` remplace la méthode précédemment nommée
`_array2val`.

L'utilisation de `_array2val` est obsolète depuis la version 3.2.5 de
dynacase-core.

## Exemples {#core-ref:eabbf614-bc4b-48e1-bf0a-d044126c09ad}

-   Exemple #1
    
    L'attribut `PHOTO_KEYWORDS` est un attribut de type texte multi-valué (option
    [multiple][option_multiple]).
    
        [php]
        $motsCles = array(
            'Tour Eiffel',
            'Champ de Mars',
            'Paris',
            'France'
        );
        $photo->setValue(
            \Dcp\AttributeIdentifiers\MyPhoto:photo_keywords,
            $doc->arrayToRawValue($motCles)
        );

## Notes {#core-ref:13a1c4ec-26b7-4065-bc82-59e4078b8b0d}

Les valeurs de la liste doivent être des scalaires (string, int, float).

## Voir aussi {#core-ref:f0409e33-c766-4997-80e5-eb450f7aacb1}

- [`Doc::setAttributeValue`][Doc::setAttributeValue]
- [`Doc::rawValueToArray`][Doc::rawValueToArray]
- [`Doc::setValue`][Doc::setValue]
- Attribut [array][type_array] et [multi-valué][option_multiple]

<!-- links -->
[Doc::rawValueToArray]: #core-ref:5f4c4ac5-7429-4d07-94d0-245fe63cbfe5
[Doc::setValue]: #core-ref:febc397f-e629-4d47-955d-27cab8f4ed2f
[Doc::setAttributeValue]: #core-ref:1e766800-b2e1-462b-9793-b0261ede8677
[type_array]: #core-ref:dd400581-8896-4eec-9b9e-f1e5669cf180
[option_multiple]: #core-ref:2448fbfc-c138-4134-aa46-800080f63738
