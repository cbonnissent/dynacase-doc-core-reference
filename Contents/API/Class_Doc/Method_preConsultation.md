# Doc::preConsultation() {#core-ref:d49209b9-10ef-48c1-aa10-7bf1b687c067}

<div class="short-description" markdown="1">

[Hameçon][hook] (ou hook) utilisé par l'action de consultation html du document
[`FDL:OPENDOC`][opendoc]. Elle est appelée avant la composition du template.

</div>

## Description {#core-ref:e43cd0e3-0c52-4dea-8623-343eb997ab5d}

    [php]
    string preConsultation (  )

Cette méthode permet de réaliser des opérations afin d'ajuster l'affichage
du document. Ces opérations peuvent être :

*   Ajout d'un fichier javascript ou css.
*   Modification des visibilités d'attributs

### Avertissements {#core-ref:5a9aff6e-78c9-4a24-bcce-5528241b27fe}

À la différence de [`Doc::preRefresh()`][preRefresh] qui est appelé lors de
consultation et lors de l'édition, cette méthode n'est appelée que lors de la
consultation. Elle est appelée après la méthode [`Doc::refresh()`][docrefresh].

Cette méthode n'est pas déclenchée lors de l'affichage de liste de documents.

## Liste des paramètres {#core-ref:42e90c35-62ac-4009-9497-86ca01ae9c31}

Aucun.

## Valeur de retour {#core-ref:f31115f9-4dd4-4f05-8b45-02fbb4366a0a}

`string` : message d'information.

Ce message est affiché sur le document comme pour celui de la méthode
[`Doc::preRefresh()`][preRefresh].

## Erreurs / Exceptions {#core-ref:435cc70f-a3b2-4430-b7f2-e8cbc95e8341}

Aucune.

## Historique {#core-ref:40e290d0-d45a-4d12-a62a-0b1c3f2b24b7}

Aucun.

## Exemples {#core-ref:cdf0eead-f907-4d80-8430-35d4e74cd0bd}

### Ajout d'asset ccs et js

Cas d'une famille `MyFamily` qui possède un niveau d'urgence représenté par
l'attribut `my_level`.

Ajout d'un fichier `css` et d'un fichier `javascript` dans le cas ou
le niveau `my_level` du document est supérieur à 2.

    [php]
    class MyFamily extends \Dcp\Family\Document
    {
      public function preConsultation() {
        if ($this->getAttributeValue(\Dcp\AttributeIdentifiers\MyFamily::my_level) > 2) {
            global $action;
            $action->parent->addJsRef("MYAPP/Layout/mySpecial.js");
            $action->parent->addCssRef("MYAPP/Layout/mySpecial.css");
            if ($this->getAttributeValue(\Dcp\AttributeIdentifiers\MyFamily::my_level) > 10) {
                 $action->parent->addCssRef("MYAPP/Layout/myRedAlert.css");
                 addWarningMsg("Red Alert");
            }
        }
        return '';
    }

Si le niveau est supérieur à 10 alors une deuxième css est ajouté ainsi qu'un
message d'avertissement qui sera visible lors de la consultation.

Voir [`addjsRef`][addjsref] et [`addCssRef`][addcssref] pour l'ajout d'asset.

### Modification de visibilité

Masquage d'un attribut `my_informations` si niveau `my_level` est égal à 0.

    [php]
    class MyFamily extends \Dcp\Family\Document
    {
      public function preConsultation() {
        if ($this->getAttributeValue(\Dcp\AttributeIdentifiers\MyFamily::my_level) == 0) {
            // l'attribut my_information est caché
             $myAttribute=$this->getAttribute(\Dcp\AttributeIdentifiers\MyFamily::my_information);
             $myAttribute->setVisibility('H');
        }
        return '';
    }

**Attention** : La méthode `BasicAttribute::setVisibility()` ne propage pas la
visibilité dans le cas où l'attribut est un attribut de structure (`array`,
`frame` ou `tab`).

## Notes {#core-ref:78da86ad-54af-4e43-b318-57ce879ec4cb}

Aucune.

## Voir aussi {#core-ref:5f6e6079-2564-4cdf-9059-1017cbbb5b42}

*   [Les vues de document][docvue],
*   [`Doc::preEdition()`][preedition],
*   [`Doc::refresh()`][refresh].


<!-- links -->
[hook]:             https://fr.wikipedia.org/wiki/Hook_(informatique)
[opendoc]:          #core-ref:f9e68fa7-01b7-4903-9718-744271d63112
[preRefresh]:       #core-ref:580d6be1-6b6a-439b-abd7-34b26cfaf2e5
[docrefresh]:       #core-ref:0bab02de-50e0-46f2-8bdb-81c62dc86c93
[addjsref]:         #core-ref:b4b041aa-2649-498d-ace7-52131053c7db
[addcssref]:        #core-ref:4bba8a6b-8002-4c0a-8ac7-70d75b31b02b
[preedition]:       #core-ref:e7f56480-a7c2-4719-a0a1-22c47f63c59f
[refresh]:          #core-ref:0bab02de-50e0-46f2-8bdb-81c62dc86c93
[docvue]:           #core-ref:cb3e2b97-ee6d-4cdf-aa25-b2e41d0d3156