# Doc::postUndelete() {#core-ref:7d851f54-d167-4ecd-bbec-d3670023cc36}

<div class="short-description" markdown="1">  

[Hameçon][hook] (ou hook) utilisé par la méthode [`Doc::undelete()`][undelete].
Cette méthode est appelée **après** la restauration du document.

</div>


## Description {#core-ref:ba6b3566-9619-49a1-8efe-1f561544c643}

    [php]
    string postUndelete (  )

Cette méthode permet de réaliser un post-traitement après restauration du
document.

### Avertissements {#core-ref:6526b23a-4fc0-4c34-ac61-aa95ba977e2d}

Le document est de nouveau [*vivant*][isalive].

## Liste des paramètres {#core-ref:c077341d-7f30-469d-9e21-d514414f590b}

Aucun.

## Valeur de retour {#core-ref:714a242c-46ac-4284-a123-705c984b1461}

Message d'information. Ce message est afficher à l'utilisateur lorsqu'il réalise
une restauration depuis l'interface web. Ce message est aussi enregistré dans
l'historique du document.

## Erreurs / Exceptions {#core-ref:d5a18b21-db6c-4af2-80c2-433ec54ebdb2}

Aucune.

## Historique {#core-ref:88ad90ad-ac6e-474c-919f-f349b00ecd45}

Anciennement `postRevive()`.

## Exemples {#core-ref:e7d4c2c1-ea90-4a64-bb77-cc696f08173f}

Cet exemple, mémorise l'auteur de la restauration si l'attribut
`sp_protectionlevel` vaut "low".

   [php]
    namespace My;
    use \Dcp\AttributeIdentifiers\MyFamily as MyAttributes;
    
    class MyFamily extends Dcp\Family\Document
    {
        public function postUndelete() {
            
            if ($this->getAttributeValue(MyAttributes::sp_protectionlevel) == "low")) {
                $this->setAttributeValue(MyAttributes::sp_restoreby, $this->getUserId());
                $this->store();
                return "Low restauration";
            }
            return '';
        }
    }

## Notes {#core-ref:91001cfb-1f0d-4c67-99ed-b71d72dcc451}

Aucune.

## Voir aussi {#core-ref:0519c237-6596-486c-aa1e-be4794c97839}

*   [`Doc::preUndelete()][docpreundelete].
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
[docpreundelete]:   #core-ref:6ec8e3bc-90d2-4577-9152-a1a1f9341751  "Hameçon Doc::preUndelete()"
[docpostundelete]:  #core-ref:7d851f54-d167-4ecd-bbec-d3670023cc36  "Hameçon Doc::postUndelete()"
[undelete]:         #core-ref:e48b02c7-c684-4f71-a731-ac92064d13ae
[isalive]:          #core-ref:b791d14e-800a-4b3b-bee7-41e271a8087e
[hook]:             http://fr.wikipedia.org/wiki/Hook_(informatique) "Définition de Hook sur wikipedia"