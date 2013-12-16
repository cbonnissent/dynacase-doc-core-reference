# Dir::postInsertMultipleDocuments() {#core-ref:e3cd509f-8678-4dec-a0cf-33aa39674cfe}

<div class="short-description" markdown="1">

La méthode `postInsertMultipleDocuments` est appelée par la méthode
[`insertDocument`][Dir::insertMultipleDocuments] après l'insertion de documents
dans le Dossier (si [`noprepost`][Dir::insertMultipleDocuments_noprepost] est
égal à `false`).

</div>

## Description {#core-ref:27fbbbf8-1eef-4902-9eb9-0829841fb9bf}

    [php]
    string postInsertMultipleDocuments ( int[]|string[] $tdocids )

### Avertissements {#core-ref:c2f06e4b-36f9-4cee-9cf1-81242682d736}

Aucun.

## Liste des paramètres {#core-ref:ee4630f4-1202-43db-9e98-4bd9c67aa80c}

(int[]|string[]) `tdocids`
:   Liste d'identifiants (identifiant numérique ou nom logique) des documents
    qui ont été insérés dans le dossier.

## Valeur de retour {#core-ref:66df50b9-4af6-4b8b-aab3-5bbe0bfbea8e}

La méthode retourne une chaîne vide s'il n'y a pas d'erreurs, ou une chaîne non-
vide contenant le message d'erreur dans le cas contraire.

## Erreurs / Exceptions {#core-ref:354e4d5c-44ea-480b-aeb5-cacac26235ee}

Aucune.

## Historique {#core-ref:b86aeb52-142d-4d67-81bd-be15803bd91b}

### Release 3.2.5 {#core-ref:abb661e5-fd04-49da-adb2-9cffceeb9de8}

La méthode `postInsertMultipleDocuments` remplace la méthode précédemment nommée
`postMInsertDoc`.

L'utilisation de `postMInsertDoc` est obsolète depuis la version 3.2.5 de
dynacase-core.

## Exemples {#core-ref:ec09e551-9929-4222-88fb-b1d08c539a4e}

La fonction d'archivage ne doit être déclenchée qu'une seule fois lors de
l'insertion de plusieurs documents. Par contre, cette fonction d'archivage doit
aussi être déclenché lors d'une insertion unitaire.

    [php]
    namespace Facturation;
    
    class ArchiveFacture extends \Dcp\Family\Dir {
    
        public function postInsertMultipleDocument($docIdList) {
            $err=parent::postInsertMultipleDocument($docIdList);
            if (empty($err)) {
                /*
                 * Faire une archive du lot des documents insérés
                 */
                $this->archiveDocuments($docIdList);
            }
            return $err;
        }
        
        public function postInsertDocument($docId, $multiple = false)  {
            $err=parent::postInsertDocument($docId, $multiple);
            if (empty($err) && ($multiple == false)) {
                /*
                 * Faire une archive du document inséré
                 */
                $this->archiveDocuments(array($docId));
            }
            return $err;
        }
        protected function archiveDocuments(array $docIds) {
            // Archivage d'une liste de document
        }
    }

## Notes {#core-ref:1eabe220-ae66-4adc-aef0-5ea34394e0a1}

Aucune.

## Voir aussi {#core-ref:8f8e119e-f4b7-4e54-b556-def999324ce7}

- [`Dir::insertMultipleDocument`][Dir::insertMultipleDocuments]
- [`Dir::preInsertDocument`][Dir::preInsertDocument]
- [`Dir::removeDocument`][Dir::removeDocument]

<!-- links -->
[Dir::preInsertDocument]: #core-ref:2f9580d7-cd06-4d09-8853-ed95f614d665
[Dir::insertDocument]: #core-ref:9575ff95-480a-4dfb-9cd0-b89f44c3fad7
[Dir::insertMultipleDocuments]: #core-ref:098cf44e-568d-4dd2-8dd0-e2f104bc8615
[Dir::removeDocument]: #core-ref:d337e186-8066-49e2-92a0-26aa518cbf41
[Dir::insertMultipleDocuments_noprepost]: #core-ref:511b14bf-eb70-4b67-9205-e75cc110696a
