# Doc::postDuplicate() {#core-ref:d3a5ed05-5efd-441f-a276-c9423a89d874}

<div class="short-description" markdown="1">  

[Hameçon][hook] (ou hook) utilisé par la méthode [`Doc::duplicate()`][doccopy].
Cette méthode est appelée **après** la duplication du document.

</div>

## Description {#core-ref:454c68a3-1db0-4170-83ad-f938418108ff}

    [php]
    string postDuplicate ( Doc &$origin )

Cette méthode permet de réaliser un post-traitement après la duplication du
document.

### Avertissements {#core-ref:2217b849-0912-487f-bd3a-67f10f82be83}

Cette méthode est appelée sur le document en cours de duplication.

Le document vient d'être enregistré en base de donnée et contient un nouvel 
identificateur.

## Liste des paramètres {#core-ref:780f9e7c-c48c-4d96-8a3c-d2ebac57dd6f}

(Doc) `origin`
:   Document d'origine de la duplication.

## Valeur de retour {#core-ref:3400b805-bcad-4e3b-b064-694f9bfb212f}

Message d'information. Ce message est enregistré dans l'historique du document.

## Erreurs / Exceptions {#core-ref:8492a16b-848d-46ae-8052-61d233171eac}

Aucune.

## Historique {#core-ref:f3ef88d1-57d1-49dd-bcaf-b866e54a68af}

Anciennement `Doc::postCopy()`.


## Exemples {#core-ref:d0516a42-e87f-4e00-adf8-581ad9e7b661}

Cet exemple, mémorise l'auteur de la duplication et ajoute une entrée dans
l'historique du document originel.

    [php]
    namespace My;
    use \Dcp\AttributeIdentifiers\MyFamily as MyAttributes;
    
    class MyFamily extends Dcp\Family\Document
    {
        public function postDuplicate(Doc &$origin) {
            $origin->addHistoryEntry("duplicated target %d", $this->initid);
            
            $this->setAttributeValue(MyAttributes::sp_duplicateby, $this->getUserId());
            $this->store();
            
            return '';
        }
    }

## Notes {#core-ref:37fa4299-1954-4691-acbe-e3cc59d4c923}

Aucune.

## Voir aussi {#core-ref:baac7c2a-0b7a-47bf-aa04-47f05423ce7f}


*   [`Doc::preDuplicate()][precopy].
*   [`Doc::duplicate()][doccopy].

<!-- links -->
[doccopy]:      #core-ref:f7d4f454-0e45-40bd-9f4c-b149ab620295
[precopy]:      #core-ref:c8d89bd7-e44c-4d30-b727-36f815a921db
[postcopy]:     #core-ref:d3a5ed05-5efd-441f-a276-c9423a89d874
[hook]:             http://fr.wikipedia.org/wiki/Hook_(informatique) "Définition de Hook sur wikipedia"