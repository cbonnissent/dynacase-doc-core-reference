# Doc::preEdition() {#core-ref:e7f56480-a7c2-4719-a0a1-22c47f63c59f}

<div class="short-description" markdown="1">

[Hameçon]hook] (ou hook) utilisé par l'action d'affichage du formulaire html du
document [`FDL:OPENDOC`][opendoc]. Elle est appelée avant la composition du
template.

</div>

## Description {#core-ref:f57a3325-7c35-4b64-936e-df0f396c0744}

    [php]
    void preEdition (  )

Cette méthode permet de réaliser des opérations afin d'ajuster l'affichage
du formulaire de document. Ces opérations peuvent être :

*   Ajout d'un fichier javascript ou css.
*   Modification des visibilités d'attributs

### Avertissements {#core-ref:7210f200-8e81-4437-9c9f-834b816e0086}

À la différence de [`Doc::preRefresh()`][preRefresh] qui est appelé lors de
consultation et lors de l'édition, cette méthode n'est appelée que lors de
l'édition. 


## Valeur de retour {#core-ref:2cda600b-fcc2-4dc5-b3ff-e4fe33879662}

Aucune.

## Erreurs / Exceptions {#core-ref:7b31d216-7514-4be8-881e-46a70733738a}

Aucune.

## Historique {#core-ref:fbe0efdc-c2b9-4e0c-b340-eb304780388f}

Aucun.

## Exemples {#core-ref:d9363eba-cc9a-4060-93fc-7038eb0a540f}

### Ajout d'asset ccs et js {#core-ref:337df6b3-dd13-47b9-982d-77db0ae75567}

Ajout d'une `css` et d'un fichier `javascript` spécifique si c'est un formulaire de 
création de document.

    [php]
    class MyFamily extends \Dcp\Family\Document
    {
      public function preEdition() {
        if ($this->getProperty("initid") == 0) {
            global $action;
            $action->parent->addJsRef("MYAPP/Layout/mySpecialCreate.js");
            $action->parent->addCssRef("MYAPP/Layout/mySpecialCreate.css");
        }
    }


Voir [`addjsRef`][addjsref] et [`addCssRef`][addcssref] pour l'ajout d'asset.

### Modification de visibilité et caractère obligatoire {#core-ref:838f48af-ece2-467f-9002-eb08612b23de}

Rendre obligatoire l'attribut `my_level` à la création.

    [php]
    class MyFamily extends \Dcp\Family\Document
    {
      public function preEdition() {
        if ($this->getProperty("initid") == 0) {
            $myAttribute=$this->getAttribute(\Dcp\AttributeIdentifiers\MyFamily::my_level);
            $myAttribute->setVisibility('W');
            $myAttribute->setNeeded(true);
        }
    }

Attention, cela impacte juste le formulaire et non la caractère réellement
obligatoire de l'attribut. Ce caractère obligatoire peut aussi être maîtrisé par 
les [contrôles de vue][cvdoc].

## Notes {#core-ref:b40087ca-41ab-4435-883d-e32e96b81eeb}

Aucune.

## Voir aussi {#core-ref:e99a1611-7c9a-4489-8f1e-5c9750a18e3e}

*   [Les vues de document][docvue],
*   [`Doc::preConsultation()`][preconsultation],
*   [`Doc::refresh()`][refresh].

<!-- links -->
[hook]:             https://fr.wikipedia.org/wiki/Hook_(informatique)
[opendoc]:          #core-ref:f9e68fa7-01b7-4903-9718-744271d63112
[preRefresh]:       #core-ref:580d6be1-6b6a-439b-abd7-34b26cfaf2e5
[docvue]:           #core-ref:cb3e2b97-ee6d-4cdf-aa25-b2e41d0d3156
[refresh]:          #core-ref:0bab02de-50e0-46f2-8bdb-81c62dc86c93
[preconsultation]:  #core-ref:d49209b9-10ef-48c1-aa10-7bf1b687c067
[cvdoc]:            #core-ref:017f061a-7c12-42f8-aa9b-276cf706e7e0
[addjsref]:         #core-ref:b4b041aa-2649-498d-ace7-52131053c7db
[addcssref]:        #core-ref:4bba8a6b-8002-4c0a-8ac7-70d75b31b02b