# Doc::preUndelete() {#core-ref:6ec8e3bc-90d2-4577-9152-a1a1f9341751}

<div class="short-description" markdown="1">  

[Hameçon][hook] (ou hook) utilisé par la méthode [`Doc::undelete()`][undelete].
Cette méthode est appelée **avant** la restauration du document.

</div>

## Description {#core-ref:cf3bda67-b0a0-47b0-9cf9-82459fef6a6a}

    [php]
    string preUndelete (  )

Cette méthode permet de contrôler la restauration d'un document.

### Avertissements {#core-ref:ebf5e219-0b93-4262-a6ee-ff75c53e0395}

Cette méthode est appelée après les contrôles de profils pour suppression du
document.

Le document est encore en statut supprimé (`locked=-1` et `doctype=Z`).

## Liste des paramètres {#core-ref:90240a4b-e9c1-437d-8172-e9255cf42d9a}

Aucun.

## Valeur de retour {#core-ref:60b99e4a-16c6-408b-a244-2143d213d54e}

Message d'erreur. Si la méthode retourne une chaîne de caractères non vide, elle
est considérée comme un message d'erreur et la restauration est abandonnée.

Ce message est retourné par la méthode [`Doc::undelete()`][undelete] si elle
est non vide.

## Erreurs / Exceptions {#core-ref:8f515cf9-0e47-4727-9c16-8dbd7d556a96}

Aucune.

## Historique {#core-ref:71502365-6754-4660-93b4-6e50057ae4d4}

Anciennement `preRevive()`.

## Exemples {#core-ref:1927011f-7d37-408e-9b93-e24547bcf9f4}

Cet exemple, interdit la suppression si l'attribut `sp_protectionlevel` vaut
"archived".

   [php]
    namespace My;
    use \Dcp\AttributeIdentifiers\MyFamily as MyAttributes;
    
    class MyFamily extends Dcp\Family\Document
    {
        public function preUndelete() {
            
            if ($this->getAttributeValue(MyAttributes::sp_protectionlevel) == "archived")) {}
                return "Archive document"; // blocage de la restauration
            }
            return '';
        }
    }

## Notes {#core-ref:295955ea-1751-415d-8ff8-48957f18ebda}

Même le compte "admin" ne peut pas outrepasser les conditions de restauration de
cette méthode.

Le menu de restauration n'est pas accessible si cette méthode retourne un
message d'erreur.

## Voir aussi {#core-ref:9eba98be-3c0b-41c8-bdcb-6f22707c190b}

*   [`Doc::postUndelete()][docpostundelete].
*   [`Doc::undelete()][undelete].

<!-- links -->
[docstore]:         #core-ref:b8540d13-ece6-4e9e-9b72-6a56bca9da12
[docpostcreated]:   #core-ref:b8f80e6b-a374-4bf4-bc76-47290cd69c45 "Hameçon Doc::postCreated()"
[docpoststore]:     #core-ref:99520a31-0aef-4bc6-b20a-114737059d17 "Hameçon Doc::postStore()"
[docprestore]:      #core-ref:3517da95-82fe-4adb-8bc4-ef49ca55edb0 "Hameçon Doc::preStore()"
[docprecreated]:    #core-ref:e85aa9d4-5e62-4a60-9d1c-f60433301747 "Hameçon Doc::preCreated()"
[docprerefresh]:    #core-ref:580d6be1-6b6a-439b-abd7-34b26cfaf2e5 "Hameçon Doc::preRefresh()"
[docpostrefresh]:   #core-ref:9352c534-3691-41e3-b293-599db8e9a4fd "Hameçon Doc::postRefresh()"
[docpreimport]:     #core-ref:adb6ba8b-15c4-42d3-97dc-1da16c2112ae "Hameçon Doc::preImport()"
[docpostimport]:    #core-ref:9de7e922-150a-416b-b846-b6e195bf0921 "Hameçon Doc::postImport()"
[docpreundelete]:   #core-ref:6ec8e3bc-90d2-4577-9152-a1a1f9341751 "Hameçon Doc::preUndelete()"
[docpostundelete]:  #core-ref:7d851f54-d167-4ecd-bbec-d3670023cc36 "Hameçon Doc::postUndelete()"
[undelete]:         #core-ref:e48b02c7-c684-4f71-a731-ac92064d13ae
[hook]:             http://fr.wikipedia.org/wiki/Hook_(informatique) "Définition de Hook sur wikipedia"