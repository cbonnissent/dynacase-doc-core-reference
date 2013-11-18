# Doc::preDuplicate()  {#core-ref:c8d89bd7-e44c-4d30-b727-36f815a921db}

<div class="short-description" markdown="1">  

[Hameçon][hook] (ou hook) utilisé par la méthode [`Doc::duplicate()`][doccopy].
Cette méthode est appelée **avant** la duplication du document.

</div>

## Description {#core-ref:16757938-66b8-4b8e-b889-40c16d7faf97}

    [php]
    string preDuplicate ( Doc &$origin )

Cette méthode permet d'ajouter des conditions spécifiques avant la duplication
du document.

### Avertissements {#core-ref:341afc6d-0230-4f79-800c-1ea5e6993031}

Cette méthode est appelée sur le document en cours de duplication.
Son identificateur est vide, il n'est pas encore enregistré en base de donnée.
Le document contient les valeurs des attributs du document d'origine.

## Liste des paramètres {#core-ref:89b9a320-e28f-4978-83f8-ff5acff8a170}

(Doc) `origin`
:   Document d'origine de la duplication.

## Valeur de retour {#core-ref:a2e6b538-80cc-4e0b-8af1-12adbbd2cad9}

Message d'erreur. Si la méthode retourne une chaîne de caractères non vide, elle
est considérée comme un message d'erreur et la duplication est abandonnée.

Ce message est retourné par la méthode [`Doc::duplicate()`][doccopy] si elle
est non vide.

## Erreurs / Exceptions {#core-ref:83a9ea31-dc01-4857-ba88-2bd6e87e9568}

Aucune.


## Historique {#core-ref:ce443845-99d8-4305-aa64-8f3139e85c4f}

Anciennement `Doc::preCopy()`.

## Exemples {#core-ref:b551fff5-59af-4ef0-9061-12168c611a5a}

Cet exemple, interdit la duplication d'un document révisé.

    [php]
    namespace My;
    use \Dcp\AttributeIdentifiers\MyFamily as MyAttributes;
    
    class MyFamily extends Dcp\Family\Document
    {
        public function preDuplicate(Doc &$origin) {
            
            if ($origin->isFixed())
                return "Fixed document - not duplicated";
            }
            return '';
        }
    }

## Notes {#core-ref:391a85a3-a92b-4840-a0e5-416902315d7a}

Même le compte "admin" ne peut pas outrepasser les conditions de duplication de
cette méthode.

Le menu de duplication n'est pas accessible si cette méthode retourne un
message d'erreur.

## Voir aussi {#core-ref:9ae38ca1-f11f-4696-9935-0174d4ecb39b}


*   [`Doc::postDuplicate()][postcopy].
*   [`Doc::duplicate()][doccopy].

<!-- links -->
[doccopy]:      #core-ref:f7d4f454-0e45-40bd-9f4c-b149ab620295
[precopy]:      #core-ref:c8d89bd7-e44c-4d30-b727-36f815a921db
[postcopy]:     #core-ref:d3a5ed05-5efd-441f-a276-c9423a89d874
[hook]:             http://fr.wikipedia.org/wiki/Hook_(informatique) "Définition de Hook sur wikipedia"