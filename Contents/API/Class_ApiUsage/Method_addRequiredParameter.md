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
:   Liste (`array`) des valeurs possibles pour le paramètre ou une
 [callable][callable definition] vérifiant une contrainte que l'on souhaite
  appliquer. Si un tableau de deux chaînes de caractères est passés en paramètre,
   il sera considéré comme un tableau de restriction, pas une callable. 

### La callable de restriction {#core-ref:f24b5a38-ba8f-4b13-bc4f-78e69a561467}

Le paramètre de restriction peut être une [callable][callable definition].
 Elle permet de vérifier une contrainte que l'on souhaite appliquer aux valeurs
  passées en argument du paramètre.

    [php]
    string function (   string|string[] $values
                                string  $argName
                              ApiUsage  $apiusage )
                              
Cette [callable][callable definition] reçoit trois arguments:

(string|string[]) `values`
: La ou les valeurs du paramètre

(string) `argName`
: Le nom du paramètre

(ApiUsage) `apiusage`
: L'objet courant de type ApiUsage contenant les informations des autres paramètres

Elle est appelée lors du [`apiUsage::verify()`][apiUsage_verify] et, si elle
 retourne une chaîne de caractères, celle-ci fera lieu d'erreur et sera affichée
  à l'utilisateur.

Dans le cas de la demande d'usage (le `--help`), la constante
 `ApiUsage::GET_USAGE` sera passée à la place des valeurs. Dans ce cas la chaîne
  retournée sera affichée dans l'usage après la description du paramètre.

## Valeur de retour {#core-ref:5963b16e-8706-4af4-87a8-30ba9e4f9bb3}

Retourne la valeur du paramètre.

Si une liste de valeurs possibles est spécifiée (`restriction`) et que la valeur
du paramètre n'est pas dans cette liste, alors la validation est mise en erreur.

## Erreurs / Exceptions {#core-ref:7021d6a5-9728-42d4-ae3c-84020db9f9b2}

Aucune.

## Historique {#core-ref:2a5333fe-083e-45ba-a849-2357c63850dd}

*   Remplace la méthode `addNeeded()` qui est dépréciée depuis la version 3.2.5.

## Exemples {#core-ref:d4014682-77e2-444c-9002-b22696c6177f}

    [php]
    $usage = new ApiUsage();
    $docid = $usage->addRequiredParameter("docid", "Document id");
    $format = $usage->addRequiredParameter("format", "Paper format", array("a4", "a3"));
    $usage->verify();
    
    printf("docid = '%s'\n", $docid);
    printf("format = '%s'\n", $format);

&nbsp;

    $ ./wsh.php --api=test
    Erreur : {CORE0001} argument 'docid' expected
    
    
    Usage :
            --docid=<Document id>
            --format=<Paper format> [a4|a3]
       Options:
            --userid=<user system id or login name to execute function - default is (admin)>, default is '1'
            --help (Show usage) 

L'usage est affiché car un paramètre requis n'est pas présent.

    $ ./wsh.php --api=test --docid=1234 --format=foo
    Erreur : {CORE0001} argument 'format' must be one of these values : a4, a3
    
    
    Usage :
            --docid=<Document id>
            --format=<Paper format> [a4|a3]
       Options:
            --userid=<user system id or login name to execute function - default is (admin)>, default is '1'
            --help (Show usage) 

L'usage est affiché car la valeur du paramètre `format` n'est pas une valeur
possible.

    $ ./wsh.php --api=test --docid=1234 --format=a4
    docid = '1234'
    format = 'a4'

Exemple avec une callable:

    [php]
    $usage = new ApiUsage();
    $numberpositive = $usage->addRequiredParameter("number", "A number", function($values, $argname, $apiusage) {
        if ($values === ApiUsage::GET_USAGE) return "Must be a positive number";
        if (is_array($values)) {
            foreach ($values as $value) {
                if ($value < 0) return sprintf("Error for parameter %s: value %s must be a positive number", $argname, $value);
            }
        } else if ($values < 0) return sprintf("Error for parameter %s: value %s must be a positive number", $argname, $values);
        return "";
        });
    $usage->verify();
    
    printf("number = '%s'\n", $numberpositive);

&nbsp;

    $ ./wsh.php --api=test
    Erreur : {CORE0001} argument 'number' expected
    
    
    Usage :
            --number=<A number>Must be a positive number
       Options:
            --userid=<user system id or login name to execute function - default is (admin)>, default is '1'
            --help (Show usage) 

L'usage est affiché car un paramètre requis n'est pas présent.

     $ ./wsh.php --api=test --number=-12
    Erreur : {CORE0001} Error checking argument number type: Error for parameter number: value -12 must be a positive number
    
    
    Usage :
            --number=<A number>Must be a positive number
       Options:
            --userid=<user system id or login name to execute function - default is (admin)>, default is '1'
            --help (Show usage) 
    
L'usage est affiché car la valeur du paramètre `number` n'est pas une valeur
acceptée par la callable.

    $ ./wsh.php --api=test --number=12
    number = '12'
    
## Notes {#core-ref:b73888b7-ba50-4fe4-9a16-031a81189a5d}

Aucune.

## Voir aussi {#core-ref:72d44ba0-b890-41e9-8a8b-8a706355f13a}

*   [`apiUsage::verify()`][apiUsage_verify]

<!-- links -->
[apiUsage_verify]: #core-ref:26496476-30f7-4e64-979a-fb019d762b7b
[callable definition]: http://www.php.net/manual/fr/language.types.callable.php
