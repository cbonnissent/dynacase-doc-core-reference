# Doc::isChanged() {#core-ref:d1d544d5-d4a6-426e-83b6-f9672b293a6b}

<div class="short-description" markdown="1">

La méthode `isChanged` permet de savoir si des valeurs d'attributs du document
ont été changées.

</div>

## Description {#core-ref:4be650c1-ab5c-4f93-918e-f0ce4c182f40}

    [php]
    bool isChanged ( void )

La méthode `isChanged` permet de savoir si des attributs du document ont été
changés via l'utilisation de méthodes de modification des valeurs d'attributs
(par exemple [`Doc::setValue`][Doc::setValue] ou
[`Doc::clearValue`][Doc::clearValue]).

### Avertissements {#core-ref:73f752d1-53bd-4087-9de8-93b9e2030a7b}

Aucun.

## Liste des paramètres {#core-ref:cb0bfe58-81c9-4324-8b7e-8dc5f7f6e591}

Aucun.

## Valeur de retour {#core-ref:184ec52e-caa7-4a20-ba68-378334e6500f}

La méthode retourne `true` si au moins une valeur a été changée, ou `false` si
aucune valeur n'a été changée.

## Erreurs / Exceptions {#core-ref:aabbb67a-839f-4ad5-b3ad-93765d1001b6}

Aucune.

## Historique {#core-ref:1f74075a-82f3-40dd-8899-7760fece5f7d}

Aucun.

## Exemples {#core-ref:1c3695ca-c3f3-42b2-9959-d8698fd5fd2b}

- Exemple #1

Lors de la validation du formulaire d'édition d'un document, il est possible de
détecter avec la méthode `isChange` si l'utilisateur a changé la valeur d'un
attribut ou non.

    [php]
    namespace Facturation;
    
    class Facture extends \Dcp\Family\Document {
    
        public postStore() {
            if (($err = parrent::postStore()) != '') {
                return $err;
            }
            
            /*
             * Régénérer le PDF seulement si quelque chose
             * a été changé sur la facture.
             */
            if ($this->isChanged()) {
                return $this->generate_PDF();
            }
            return '';
        }
    
    }

## Notes {#core-ref:f6c185d9-7978-499e-b3bf-4cf30d737929}

Le statut de modification est remis à `false` après le déclenchement des
méthodes `Doc::postInsert` et `Doc::postUpdate`.

## Voir aussi {#core-ref:3b95c9ea-9013-42b4-bb12-988cd527c5fa}

- [`Doc::setValue`][Doc::setValue]
- [`Doc::clearValue`][Doc::clearValue]

<!-- links -->
[Doc::setValue]: #core-ref:febc397f-e629-4d47-955d-27cab8f4ed2f
[Doc::clearValue]: #core-ref:30b0592f-f0cd-498f-bc5f-301891c297e0
