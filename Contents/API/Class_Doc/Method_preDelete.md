# Doc::preDelete()  {#core-ref:dca7b2bd-fc69-4f6f-ab12-fb0de91dce8c}
<div class="short-description" markdown="1">  

[Hameçon][hook] (ou hook) utilisé par la méthode [`Doc::Delete()`][Delete].
Cette méthode est appelée **avant** la restauration du document.

</div>

## Description  {#core-ref:9def804c-db36-4b0f-9716-e13250bcbad7}

    [php]
    string preDelete (  )

<span class="fixme template">long description</span>

### Avertissements  {#core-ref:2484712c-92c6-4bf7-8d73-363b29b97619}

Cette méthode est appelée après les contrôles de profils pour suppression du
document.

## Liste des paramètres  {#core-ref:b8b3bc55-1d3e-4c92-bfd6-239cc5e00f6b}
Aucun.

## Valeur de retour  {#core-ref:9361b852-00c9-483b-b499-d7f622105574}

Message d'erreur. Si la méthode retourne une chaîne de caractères non vide, elle
est considérée comme un message d'erreur et la suppression est abandonnée.

## Erreurs / Exceptions  {#core-ref:686c2851-7b59-4d02-9918-cda77424ee89}

Aucune.

## Historique  {#core-ref:d3534099-83cb-4740-b67c-2b4e3106f3a3}

Anciennement `preRevive()`.

## Exemples  {#core-ref:59ad28b2-3de0-4d5e-b429-0e898e6807cc}

Cet exemple, interdit la suppression si l'attribut `sp_protectionlevel` vaut
"top secret".

   [php]
    namespace My;
    use \Dcp\AttributeIdentifiers\MyFamily as MyAttributes;
    
    class MyFamily extends Dcp\Family\Document
    {
        public function preDelete() {
            
            if ($this->getAttributeValue(MyAttributes::sp_protectionlevel) == "top secret")) {}
                return "Protected document"; // blocage de la suppression
            }
            return '';
        }
    }

## Notes  {#core-ref:e39c2d99-a702-4991-8a73-56315a3b7d94}

Même le compte "admin" ne peut pas outrepasser les conditions de suppression de
cette méthode.

## Voir aussi  {#core-ref:b023c517-fa58-4f19-ac4e-7c0df4af3e49}

*   [`Doc::postDelete()][docpostDelete].
*   [`Doc::Delete()][Delete].

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
[docpostDelete]:   #core-ref:8db8e5e0-b15e-4cfe-a891-66850df15b1e "Hameçon Doc::postDelete()"
[docpreDelete]:    #core-ref:dca7b2bd-fc69-4f6f-ab12-fb0de91dce8c "Hameçon Doc::preDelete()"
[Delete]:         #core-ref:e48b02c7-c684-4f71-a731-ac92064d13ae
[hook]:             http://fr.wikipedia.org/wiki/Hook_(informatique) "Définition de Hook sur wikipedia"