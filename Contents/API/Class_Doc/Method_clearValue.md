# Doc::clearValue() {#core-ref:30b0592f-f0cd-498f-bc5f-301891c297e0}

<div class="short-description" markdown="1">

La méthode `clearValue` permet d'effacer la valeur d'un attribut non
[`array`][type_array].

</div>

## Description {#core-ref:6820d770-9bbf-40d1-b5a5-9d28831a8689}

    [php]
    string deleteValue ( string $attrid )

La méthode `clearValue` permet d'effacer la valeur d'un attribut non
[`array`][type_array].

### Avertissements {#core-ref:1399cad4-4894-48ce-8553-e01a4a5adde7}

Aucun.

## Liste des paramètres {#core-ref:b4e7f1a4-b82a-4ec6-b926-a13541618770}

(string) `attrid`
:   Le nom de l'attribut (non [`array`][type_array]) à effacer.

## Valeur de retour {#core-ref:41f2834c-20c9-4f71-a9ca-7f65b71a5f89}

La méthode retourne une chaîne vide s'il n'y a pas d'erreurs, ou une chaîne
non-vide contenant le message d'erreur dans le cas contraire.

## Erreurs / Exceptions {#core-ref:223c1df2-5e96-4768-a686-65bfd2b240e7}

Les erreurs retournés sont les mêmes que celles retournées par la méthode
[`Doc::setValue`][Doc::setValue_errors].

## Historique {#core-ref:fd2d80fe-1ef2-4ba0-870f-19ec9fa65ce6}

### Release 3.2.5 {#core-ref:56cb1fc2-a4ff-4a56-aa51-79a6c778a6cc}

La méthode `clearValue` remplace la méthode précédemment nommée `deleteValue`.

L'utilisation de `deleteValue` est obsolète depuis la version 3.2.5 de
dynacase-core.

## Exemples {#core-ref:c293648a-7882-4a87-a1c8-6f7b21d29ac8}

- Exemple #1

    [php]
    $facture->clearValue(\Dcp\AttributeIdentifiers\MyFacture::montant);

## Notes {#core-ref:60636969-c1a2-4fff-806e-db1697beb77d}

Pour effacer un attribut de type [`array`][type_array], utilisez la méthode
[`Doc::clearArrayValues`][Doc::clearArrayValues].

Si l'attribut effacé est de type [`docid`][type_docid] avec une option
[`doctitle`][option_doctitle], alors l'attribut portant le titre est lui aussi
effacé.

## Voir aussi {#core-ref:c2679c1f-e7e7-4e23-b01c-eee223c1d7a9}

- [`Doc::clearArrayValues`][Doc::clearArrayValues]
- Erreurs de [`Doc::setValue`][Doc::setValue_errors]

<!-- links -->
[type_array]: #core-ref:dd400581-8896-4eec-9b9e-f1e5669cf180
[type_docid]: #core-ref:d461d5f5-b635-47a0-944d-473c227587ab
[option_doctitle]: #core-ref:9bcfd205-fb07-4a71-be06-ba07d4a9cc7c
[Doc::clearArrayValues]: #core-ref:ec1a6a50-1477-4326-b60b-c1d4ce5e4ef1
[Doc::setValue_errors]: #core-ref:3b9e376f-b8fa-47b9-8fca-dd1ab55753be