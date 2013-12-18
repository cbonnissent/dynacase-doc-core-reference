# Doc::preImport() {#core-ref:adb6ba8b-15c4-42d3-97dc-1da16c2112ae}

<div class="short-description" markdown="1">  

[Hameçon][hook] (ou hook) utilisé par la méthode
[`ImportSingleDocument::import()`][apiimportsingledoc]. Cette méthode est
appelée **avant** l'enregistrement en base de données d'un document lors d'une
[importation][importdoc].

Cette méthode n'est pas utilisée pour les importations de familles de document.

</div>

## Description {#core-ref:97cc161b-63f3-4930-9cb8-508fc8398e8f}

    [php]
    string preImport ( array $extra = array() )

Cette méthode permet d'ajouter une condition spécifique d'importation ou de
réaliser un pré-traitement avant [l'enregistrement][importhooks].

Au moment de l'appel, le document contient les nouvelles valeurs indiquées dans
le fichiers d'importation mais elles ne sont pas encore enregistrées en base de
données.


### Avertissements {#core-ref:9b422b8c-7731-4316-b7f5-d2dd8f12e76b}

Cette méthode est appelée qu'il s'agisse d'une création ou d'une mise à jour.
Dans le cas d'une création, le document n'a pas encore d'identificateur. 

La méthode [`Doc::store()`][docstore] **ne doit pas** être appelée depuis cette
méthode de manière explicite pour enregistrer les éventuelles modifications.
Dans le cas d'une création, cela provoquerait une création prématurée en base de
données.

## Liste des paramètres {#core-ref:ebcb68f2-421a-410e-8057-dde9127be45d}

(array) `extra`

:   Contient les [valeurs supplémentaires][extra] indiquées dans le fichier
    d'importation. Ces paramètres supplémentaires peuvent servir à réaliser le pré-
    traitement.

## Valeur de retour {#core-ref:9ef16274-9122-4cbb-afac-3f7cba294aad}

Message d'erreur. Si la méthode retourne une chaîne de caractères non vide, elle
est considérée comme un message d'erreur et l'importation du document est
abandonnée.

## Erreurs / Exceptions {#core-ref:ebf5f110-10eb-4d3b-80fd-98ce855397f3}

Aucune.

## Historique {#core-ref:51f2bd99-8d72-4818-9b95-b1191eee309c}

Aucun.

## Exemples {#core-ref:360569e4-e3c2-4ca1-99c7-e0f19e43a723}

Soit la ligne d'importation suivante :

| ORDER | ZOO_SPECIES | *spec id*  | *folder id* | sp_latinname | extra:status | extra:special |
| ----- | ----------- | ---------- | ----------- | ------------ | ------------ | ------------- |
| DOC   | ZOO_SPECIES | MY_MAMMUTH | -           | Mammuthus    | disappeared  | protected     |

Dans cette exemple, le document *Mammuthus* de la famille *ZOO_SPECIES* aura
comme paramètre passé à `preImport`   : 

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
        public function preImport(array $extra=array()) {
            // ajout d'une condition d'importation
            if ($this->getRawValue(MyAttributes::sp_latinname) == '') {
                return _("Latin name must not be empty");
            }
            
            // modification d'attribut en fonction des extra
            if (isset($extra["status"]) && $extra["status"]=="alive") {
                $this->clearValue(MyAttributes::sp_deathdate);
            }
            if (isset($extra["special"]) && $extra["special"]=="protected") {
                $this->setAttributeValue(MyAttributes::sp_protectionlevel, "2");
            }
            return '';
        }
    }

## Notes {#core-ref:de65fb84-14ac-4b69-b52d-e64ef7a3eadb}

Dans le cas d'une modification de document, la méthode
[`Doc::getOldRawValue()`][oldvalue] peut être utilisée pour avoir la valeur
originelle d'un attribut.

## Voir aussi {#core-ref:e94e29f5-a6a9-4ca2-9b8c-f46f10aa2801}

*   [`Doc::store()`][docstore],
*   [`Doc::preCreated()`][docprecreated],
*   [`Doc::postImport()`][docpostimport].

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
[hook]:             http://fr.wikipedia.org/wiki/Hook_(informatique) "Définition de Hook sur wikipedia"