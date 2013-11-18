# Doc::postImport() {#core-ref:9de7e922-150a-416b-b846-b6e195bf0921}

<div class="short-description" markdown="1">  

[Hameçon][hook] (ou hook) utilisé par la méthode
[`ImportSingleDocument::import()`][apiimportsingledoc]. Cette méthode est
appelée **après** l'enregistrement en base de données d'un document lors d'une
[importation][importdoc].

Cette méthode n'est pas utilisée pour les importations de familles de document.

</div>

## Description {#core-ref:4726952a-0b1c-421c-a16b-4ac833dce5c2}

    [php]
    string postImport ( array $extra = array() )

Cette méthode permet de réaliser un post-traitement après
[l'enregistrement][importhooks].

### Avertissements {#core-ref:ecb673b7-84f9-4b6d-bc8e-0f755c184d26}

Cette méthode est appelée qu'il s'agisse d'une création ou d'une mise à jour.

La méthode [`Doc::store()`][docstore] doit être appelée depuis cette
méthode si des [attributs][docattr] ont été modifiées par cette méthode.

## Liste des paramètres {#core-ref:dd89aaae-3187-421e-9f6e-3dd30587d005}

(array) `extra`

:   Contient les [valeurs supplémentaires][extra] indiquées dans le fichier
    d'importation. Ces paramètres supplémentaires peuvent servir à réaliser le 
    post-traitement.

## Valeur de retour {#core-ref:ee5900b8-a66d-4969-a78d-50a27aef327a}

Message d'information. Ce message est indiqué dans le [rapport
d'importation][wshimport].

## Erreurs / Exceptions {#core-ref:b4058f21-c511-4c2d-888d-24aeb40753e9}

Aucunes.

## Historique {#core-ref:66f44d87-6ef9-4de6-aefc-ab5147324c60}

Aucun.

## Exemples {#core-ref:4c6a9f8f-75e1-4b82-ba5b-a96d50c75836}

Soit la ligne d'importation suivante :

| ORDER | ZOO_SPECIES | *spec id*  | *folder id* | sp_latinname | extra:status | extra:special |
| ----- | ----------- | ---------- | ----------- | ------------ | ------------ | ------------- |
| DOC   | ZOO_SPECIES | MY_MAMMUTH | -           | Mammuthus    | disappeared  | protected     |

Dans cette exemple, le document *Mammuthus* de la famille *ZOO_SPECIES* aura
comme paramètre passé à `postImport`   : 

    [php]
    array(
        'status' => 'disappeared',
        'special' => 'protected'
    );

&nbsp;

    [php]
    namespace My;
    use \Dcp\AttributeIdentifiers\MyFamily as MyAttributes;
    
    class MyFamily extends Dcp\Family\Document
    {
        public function postImport(array $extra=array()) {
            
            if (isset($extra["special"]) && $extra["special"]=="protected") {
                $this->setAttributeValue(MyAttributes::sp_protectionlevel, "2");
                return $this->store(); // l'enregistrement en base doit être effectué 
                                       // pour prendre en compte la modification
            }
            return '';
        }
    }

## Notes {#core-ref:e60ec6a4-efbb-417a-82a4-25dedbae6efc}

Il est possible d'utiliser des attributs de classes (privées ou publiques) pour
partager des informations entre [`preImport()`][docpreimport] et `postImport()`.

## Voir aussi {#core-ref:22f46d21-3e04-428a-81af-16149aff60c0}

*   [Doc::store][docstore]
*   [Doc::preImport][docpreimport]
*   [Doc::postCreated][docpostcreated]

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
[apiimportsingledoc]: http://docs.anakeen.com/dynacase/3.2/dynacase-core-api-reference/classimport_single_document.html#a89aa7a25729be327254e34bc541dad03 "Api importSingleDocument::import()"
[importdoc]:          #core-ref:2fb3284a-2424-44b2-93ae-41dc3969e093
[importhooks]:        #core-ref:d3b06745-35c5-447c-9b88-01181736c21e
[extra]:              #core-ref:15088f40-de05-4600-86bb-82422af01dce
[oldvalue]:           #core-ref:dccf7c64-8f4f-4c4a-8d0d-79b21b924848
[wshimport]:          #core-ref:1c97f553-dcba-454e-96a0-8059230065b3
[docattr]:            #core-ref:4e167170-33ed-11e2-8134-a7f43955d6f3