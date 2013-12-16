# Dir::preInsertMultipleDocuments() {#core-ref:f2b05730-8eca-43de-a9f4-6075c7f19d66}

<div class="short-description" markdown="1">

La méthode `preInsertMultipleDocuments` est appelée par la méthode
[`insertMultipleDocuments`][Dir::insertMultipleDocuments] avant l'insertion des
documents dans le Dossier (si
[`noprepost`][Dir::insertMultipleDocuments_noprepost] est égal à `false`).

</div>

## Description {#core-ref:a9b7e63a-4f5a-430e-a348-56efdefd8981}

    [php]
    string preInsertMultipleDocuments ( string[]|int[] $tdocids )

### Avertissements {#core-ref:769a48ac-db08-463a-9d2f-a796a13cc769}

Aucun.

## Liste des paramètres {#core-ref:ccbfa33f-7efe-42ff-a147-8c6723d5ba76}

(string[]|int[] `tdocids`
:   Liste d'identifiants (identifiant numérique ou nom logique) des documents
    qui vont être insérés dans le dossier.

## Valeur de retour {#core-ref:f5516a18-133f-4dc2-a2d2-52224dbae701}

La méthode retourne une chaîne vide s'il n'y a pas d'erreurs, ou une chaîne non-
vide contenant le message d'erreur dans le cas contraire.

## Erreurs / Exceptions {#core-ref:c8ad0ece-be0b-496b-be9e-89c260536230}

Si la méthode `preInsertMultipleDocuments` retourne une chaîne non-vide, alors
l'insertion n'est pas faite, et la méthode
[`insertMultipleDocuments`][Dir::insertMultipleDocuments] retourne avec le
message retourné par `preInsertMultipleDocuments`.

## Historique {#core-ref:06c5cbd0-dcdd-4f34-88e8-2646c096e63a}

Aucun.

## Exemples {#core-ref:b16cb381-c686-40a2-af5c-d8dd6655b740}

    [php]
    
    namespace Facturation;
    
    class ArchiveFacture extends \Dcp\Family\Dir {
        public function preInsertMultipleDocument($rawDocList) {
            $err=parent::preInsertMultipleDocument($rawDocList);
            if (empty($err)) {
                if (count($rawDocList) > 10) {
                    return sprintf("Vous ne pouvez insérer que jusqu'à 10 documents à la fois.");
                }
            }
            return $err;
        }
    }

## Notes {#core-ref:c2242bf9-5f3c-4df9-af00-fe5c2b872d86}

Aucune.

## Voir aussi {#core-ref:29bff643-d661-4921-ae85-9efc94e37d5f}

- [`Dir::postInsertDocument`][Dir::postInsertDocument]
- [`Dir::insertDocument`][Dir::insertDocument]
- [`Dir::removeDocument`][Dir::removeDocument]

<!-- links -->
[Dir::postInsertDocument]: #core-ref:65ec2b4a-8878-4004-8e42-0de8c359a231
[Dir::insertDocument]: #core-ref:9575ff95-480a-4dfb-9cd0-b89f44c3fad7
[Dir::insertMultipleDocuments]: #core-ref:098cf44e-568d-4dd2-8dd0-e2f104bc8615
[Dir::removeDocument]: #core-ref:d337e186-8066-49e2-92a0-26aa518cbf41
[Dir::insertMultipleDocuments_noprepost]: #core-ref:511b14bf-eb70-4b67-9205-e75cc110696a
