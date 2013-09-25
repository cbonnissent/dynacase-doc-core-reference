# ApiUsage::addRequiredParameter() {#core-ref:a6653d9c-b81c-42fc-90df-e365b60e37af}

<div class="short-description">
Ajoute un paramètre obligatoire.
</div>

## Description {#core-ref:d5e69362-3f26-4ae3-96d8-62624fdeddd6}

    [php]
    string addRequiredParameter ( string $argName,
                                  string $argDefinition = "",
                       string[]|callable $restriction = null )

La présence du paramètre est vérifiée, et sa valeur retournée.

### Avertissements {#core-ref:d64c4af7-74d5-46d4-a109-9aa4e8677e27}

Aucun.

## Liste des paramètres {#core-ref:4639d869-8ae0-4a45-848d-565feb492de6}

(string) `argName`
:   Le nom du paramètre.

(string) `argDefinition`
:   Un texte (simple ligne) de description du paramètre.

(string[]|callable) `restriction`
:   Liste des valeurs possibles pour le paramètre ou un
    [callable][callable_information] vérifiant une contrainte à appliquer à la
    valeur du paramètre.
    
    Si la restriction est un `array`, alors la valeur passée doit
    obligatoirement être scalaire, et sa valeur doit être parmi les valeurs du
    tableau.
    
    Pour une autre restriction, se reporter à la description du [callable de
    restriction][callable_information].

### Le callable de restriction {#core-ref:f24b5a38-ba8f-4b13-bc4f-78e69a561467}

Le paramètre de restriction peut être un [callable][callable_definition]. Il
permet de vérifier une contrainte que l'on souhaite appliquer aux valeurs
passées en argument du paramètre.

    [php]
    string function (   string|string[] $values
                                 string $argName
                               ApiUsage $apiusage )
                              
Ce [callable][callable_definition] reçoit trois arguments:

(string|string[]) `values`
:   La ou les valeurs du paramètre

(string) `argName`
:   Le nom du paramètre

(ApiUsage) `apiusage`
:   L'objet courant de type ApiUsage contenant les informations des autres
    paramètres

Il est déclenché lors de l'appel à [`apiUsage::verify()`][apiUsage_verify] et
doit retourner :

*   Une chaîne vide si la valeur est valide,
*   Un message d'erreur si la valeur n'est pas valide,
*   une chaîne d'usage si la valeur est la constante `ApiUsage::GET_USAGE`.

Les callables suivants sont disponibles pour les cas standard :

*   `ApiUsage::isScalar` : vérifie que la valeur est scalaire.  
    C'est la restriction appliquée par défaut.
*   `ApiUsage::isArray` : vérifie que la valeur est multiple.

## Valeur de retour {#core-ref:5963b16e-8706-4af4-87a8-30ba9e4f9bb3}

Retourne la valeur du paramètre.

Si la valeur n'est pas conforme à la restriction spécifiée au moyen du paramètre
`restriction`, alors la validation est mise en erreur.

## Erreurs / Exceptions {#core-ref:7021d6a5-9728-42d4-ae3c-84020db9f9b2}

Aucune.

## Historique {#core-ref:2a5333fe-083e-45ba-a849-2357c63850dd}

*   Remplace la méthode `addNeeded()` qui est dépréciée depuis la version 3.2.5.

## Exemples {#core-ref:d4014682-77e2-444c-9002-b22696c6177f}

### Restriction par un array {#core-ref:c22b69d6-520a-40fa-9864-568fa75b298a}

    [php]
    <?php
    
    $usage = new ApiUsage();
    $docid = $usage->addRequiredParameter("docid", "Document id");
    $format = $usage->addRequiredParameter("format", "Paper format", array("a4", "a3"));
    $usage->verify();
    
    printf("docid = '%s'\n", $docid);
    printf("format = '%s'\n", $format);

Omission d'un paramètre obligatoire :

    $ ./wsh.php --api=test
    Erreur : {CORE0001} argument 'docid' expected
    
    
    Usage :
            --docid=<Document id>
            --format=<Paper format> [a4|a3]
       Options:
            --userid=<user system id or login name to execute function - default is (admin)>, default is '1'
            --help (Show usage)

Passage d'une valeur ne respectant pas la restriction :

    $ ./wsh.php --api=test --docid=1234 --format=foo
    Erreur : {CORE0001} argument 'format' must be one of these values : a4, a3
    
    
    Usage :
            --docid=<Document id>
            --format=<Paper format> [a4|a3]
       Options:
            --userid=<user system id or login name to execute function - default is (admin)>, default is '1'
            --help (Show usage) 

Appel valide :

    $ ./wsh.php --api=test --docid=1234 --format=a4
    docid = '1234'
    format = 'a4'

### Restriction par un callable {#core-ref:f3c38186-509f-4ced-a3ec-9d5d2387fff5}

    [php]
    <?php
    
    $usage = new ApiUsage();
    $numberpositive = $usage->addRequiredParameter(
        "number",
        "A number",
        function($values, $argname, $apiusage) {
            if (ApiUsage::GET_USAGE === $values){
                return "A positive number";
            }
            if (is_array($values)) {
                $invalidValues = array_filter($values, function($var){return($var < 0);});
                if(count($invalidValues) > 0){
                    return sprintf("Following values are not positive : [%s]", implode("],[", $invalidValues));
                }
            } elseif ($values < 0){
                return sprintf("Following value is not positive : [%s]", $values);
            }
            return "";
        }
    );
    $usage->verify();
    
    printf("number = '%s'\n", $numberpositive);

Omission d'un paramètre obligatoire :

    $ ./wsh.php --api=test
    Erreur : {CORE0001} argument 'number' expected
    
    
    Usage :
            --number=<A number>A positive number
       Options:
            --userid=<user system id or login name to execute function - default is (admin)>, default is '1'
            --help (Show usage)

Passage d'une valeur ne respectant pas la restriction :

     $ ./wsh.php --api=test --number=-12
    Erreur : {CORE0001} Error checking argument number type: Following value is not positive : [-12]
    
    
    Usage :
            --number=<A number>A positive number
       Options:
            --userid=<user system id or login name to execute function - default is (admin)>, default is '1'
            --help (Show usage) 
    
Appel valide :

    $ ./wsh.php --api=test --number=12
    number = '12'
    
## Notes {#core-ref:b73888b7-ba50-4fe4-9a16-031a81189a5d}

Aucune.

## Voir aussi {#core-ref:72d44ba0-b890-41e9-8a8b-8a706355f13a}

*   [`apiUsage::verify()`][apiUsage_verify]

<!-- links -->
[apiUsage_verify]: #core-ref:26496476-30f7-4e64-979a-fb019d762b7b
[callable_definition]: http://www.php.net/manual/fr/language.types.callable.php
