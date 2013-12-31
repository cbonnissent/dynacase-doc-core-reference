# Doc::getPropertyValue() {#core-ref:80e3ca49-26ea-4090-9fcd-7b92bf9d5c6d}

<div class="short-description" markdown="1">

La méthode `getPropertyValue` permet d'obtenir les valeurs des
[propriétés du document][doc_properties] courant.

</div>

## Description {#core-ref:89d2851e-5c6f-4e58-8984-4eeda3b819fa}

    [php]
    string|bool(false) getPropertyValue ( string $prop )

La méthode `getPropertyValue` permet d'obtenir les valeurs des
[propriétés du document][doc_properties] courant (telles que `id`, `initid`,
`revision`, etc.).

### Avertissements {#core-ref:01aac4e5-985b-42e2-b828-561537394043}

Aucun.

## Liste des paramètres {#core-ref:bf30280c-b80b-49a8-9d44-6d610268f16e}

(string) `prop`
:   Le nom de la propriété dont on souhaite obtenir la valeur.

## Valeur de retour {#core-ref:33c362ab-7ea0-42d9-9d38-5a193193703a}

La méthode retourne la valeur de la propriété demandée, ou `false` si la
propriété demandée n'existe pas.

## Erreurs / Exceptions {#core-ref:678d8260-b4fe-4a61-bd72-de23f9731e71}

La méthode retourne `false` si la propriété demandée n'existe pas.

## Historique {#core-ref:00ab5172-cb17-4b01-b02a-b994771cba2f}

### Release 3.2.5 {#core-ref:fe0b9315-3566-4578-92dd-dec97ad6840c}

La méthode `getPropertyValue` remplace la méthode précédemment nommée
`getProperty`.

L'utilisation de `getProperty` est obsolète depuis la version 3.2.5 de
dynacase-core.

## Exemples {#core-ref:b8e74cec-a2cf-42bc-be6f-3dd6efc82b6b}

- Exemple #1

    [php]
    /*
     * Obtenir la date de création du document.
     */
    $cdate = $doc->getPropertyValue('cdate');

## Notes {#core-ref:eaf4c2ef-3595-424b-9a79-0c5448f47196}

Aucune.

## Voir aussi {#core-ref:cb8f1ffd-efa9-481c-8ad5-3eaa4ea9ed2d}

- [Propriétés de la classe `Doc`][doc_properties]

<!-- links -->
[doc_properties]: #core-ref:9aa8edfa-2f2a-11e2-aaec-838a12b40353
