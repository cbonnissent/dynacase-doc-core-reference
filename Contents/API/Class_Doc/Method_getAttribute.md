# Doc::getAttribute() {#core-ref:04bf7629-8d07-4e43-a098-dacfcfc1d8f4}

<div class="short-description" markdown="1">

La méthode `getAttribute` permet de récupérer l'objet d'un attribut du
document.

</div>

## Description {#core-ref:b2f6e703-8f5c-4c90-8494-2d6d91cec4ff}

    [php]
    BasicAttribute|bool(false) & getAttribute ( string $idAttr,
                                               mixed & $oa = null )

La méthode `getAttribute` permet d'obtenir l'objet PHP (classe `BasicAttribute`)
d'un attribut du document.

### Avertissements {#core-ref:7a93fe11-e2bd-4b91-9cdb-9beea6378b23}

Aucun.

## Liste des paramètres {#core-ref:d695a85e-e52f-4f04-afe5-edf5a82b480a}

(string) `idAttr`
:   Le nom de l'attribut dont on souhaite obtenir l'objet.

[out] (mixed) `oa`
:   `oa` permet de spécifier une variable qui contiendra une référence à la
    valeur retournée par la méthode.
    
    Cet argument est présent pour compatibilité par rapport à l'historique de
    la méthode.

## Valeur de retour {#core-ref:0aaa7958-d929-433e-8799-8956df6d4f1e}

La méthode retourne un objet PHP de la classe `BasicAttribute` si l'attribut
demandé existe ou le booléen `false` si l'attribut demandé n'existe pas.

## Erreurs / Exceptions {#core-ref:40e3abd0-9c4e-4874-ae93-c1e0e081dc9f}

Si l'attribut demandé n'existe pas, le booléen `false` est retourné.

## Historique {#core-ref:6a366732-0b54-4d6f-bbae-fa25a02f5afb}

Aucun.

## Exemples {#core-ref:3b2b86cc-322c-4a61-a053-c87be08fcd24}

- Exemple #1

    [php]
     /*
      * Obtenir le type de l'attribut `montant`
      */
    $oa = $doc->getAttribute(\Dcp\AttributeIdentifiers\Facture::montant);
    printf("L'attribut '%s' estde type '%s'.", $oa->id, $oa->type);

Résultat :

    L'attribut 'montant' est de type 'money'.

## Notes {#core-ref:2bf066bd-2677-4921-866f-6932f27349c9}

L'attribut demandé peut-être un attribut attribut déclaré sur la famille du
document ou bien un attribut déclaré sur une famille mère. La famille d'origine
de l'attribut est alors consultable via la propriété `docid` de l'objet de
attribut qui contient l'identifiant de la famille qui déclare cet attribut.

## Voir aussi {#core-ref:73673f06-b0c6-4630-817c-b82fb3c64ac8}

<!-- links -->
