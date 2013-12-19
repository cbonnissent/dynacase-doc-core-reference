# Doc::getTitle() {#core-ref:84011cc8-2aec-4f39-81f0-c7ae803e4913}

<div class="short-description" markdown="1">

La méthode `docTitle` permet de récupérer le titre d'un document.

</div>

## Description {#core-ref:894fc641-b229-41d4-9750-6a65dc8e5340}

    [php]
    string getTitle (  mixed $id     = -1,
                      string $def    = "",
                        bool $latest = false )

La méthode `getTitle` permet de récupérer le titre du document courant, d'un
document donné en spécifiant son identifiant (numérique ou logique) ou d'un
ensemble de document en spécifiant leur identifiants (numérique ou logique).

### Avertissements {#core-ref:9daf91eb-69e2-41d2-8ddf-5cef871b6192}

Aucun.

## Liste des paramètres {#core-ref:06ebdfbb-aa69-4600-991a-4b0d0585d260}

(mixed) `id`
:   `id` permet de spécifier le ou les documents dont on souhaite obtenir le
    titre.
    
    Si `id` est égal à -1, alors le titre du document courant est retourné.
    
    Si `id` est l'identifiant numérique ou le nom logique d'un document, alors
    le titre du document correspondant est retourné.
    
    Si `id` est une chaîne de caractère contenant le caractère `\n` ou la
    séquence `<BR>`, alors `id` est traité comme étant une liste d'identifiants
    de documents (format issue de
    [`Doc::arrayToRawValue`][Doc::arrayToRawValue]), et le résultat retourné est
    la concaténation avec le caractère de séparation `\n` des titres des
    documents correspondant à ces identifiants.
    
    La valeur par défaut de `id` est -1.

(string) `def`
:   `def` permet de spécifier la valeur par défaut qui sera retournée si le
    document demandé n'existe pas.
    
    Par défaut, la valeur par défaut est une chaîne vide.

(bool) `latest`
:   `latest` permet de spécifier si l'on souhaite obtenir le titre de la
    dernière révision du document.
    
    Par défaut, `latest` est égal à `false` et donc c'est le titre du document
    référencé par l'identifiant qui est retourné (et non la dernière révision).

## Valeur de retour {#core-ref:24beaa50-e2f7-4446-abe2-b8d8d0bcd6af}

La méthode retourne une chaîne de caractère contenant le titre du document
demandé, ou les titres des documents demandés.

## Erreurs / Exceptions {#core-ref:2475c045-eea0-471a-a195-b01c63eaa9e7}

Aucune.

## Historique {#core-ref:44e2010b-c0ed-4ee8-ab4c-e34aa24601f2}

Aucun.

## Exemples {#core-ref:baa1c2e5-f943-4542-98e4-44a6877dd26f}

- Exemple #1

    [php]
    var_dump($doc->getTitle());

Résultat :

    [php]
    string(22) "Titre document courant"

- Exemple #2

    [php]
    var_dump($doc->getTitle(1234));

Résultat :

    [php]
    string(19) "Titre document 1234"

- Exemple #3

    [php]
    var_dump($doc->getTitle($doc->arrayToRawValue(array(1234, 2345, 3456))));

Résultat :

    [php]
    string(59) "Titre document 1234
    Titre document 2345
    Titre document 3456"

## Notes {#core-ref:ab299f5d-dc32-45df-a4fa-6ba2511c08f5}

Si le document, dont on souhaite obtenir le titre, est
[confidentiel][confidential], alors la titre retourné est
"`document confidentiel`".

## Voir aussi {#core-ref:19570f98-4665-4503-9c1e-6b584173981d}

- [`Doc::arrayToRawValue`][Doc::arrayToRawValue]

<!-- links -->
[Doc::arrayToRawValue]: #core-ref:717f6ca6-a46c-4acd-a7fb-29ff6460aa15
[confidential]: #core-ref:ba033340-2117-46f4-9efc-19c8609a8f28