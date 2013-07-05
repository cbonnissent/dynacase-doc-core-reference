# ApiUsage::addOptionalParameter() {#core-ref:180f3da7-1707-4175-9f6a-694b621fe940}

<div class="short-description">
Ajoute un paramètre optionnel.
</div>

## Description {#core-ref:3a2e4ef7-6858-4898-9231-7aa21243bd4f}

    [php]
    string addOptionalParameter ( string $argName,
                                  string $argDefinition,
                                   array $restriction = null,
                                  string $default = null )

La présence du paramètre est vérifiée, et sa valeur retournée.

### Avertissements {#core-ref:f4060e83-7f0f-4343-a632-e6b4c83ff420}

N/A

## Liste des paramètres {#core-ref:21cae0e9-f1e7-4429-b093-66cd2907a672}

(string) `argName`
:   Le nom du paramètre.

(string) `argDefinition`
:   Un texte (simple ligne) de description du paramètre.

(array) `restriction`
:   Liste des valeurs possibles pour le paramètre.

(string) `default`
:   Valeur retournée par défaut si le paramètre n'est pas présent.

## Valeur de retour {#core-ref:6aa039a9-c319-48a3-b1ef-669ce05ecb41}

Si le paramètre est présent, alors la valeur du paramètre est retournée.

Si le paramètre n'est pas présent et qu'une valeur par défaut est fournie, alors
c'est la valeur par défaut qui est retournée, sinon `null` est retourné.

Si une liste de valeurs possibles est spécifiée (`restriction`) et que la valeur
du paramètre n'est pas dans cette liste, alors la validation est mise en erreur.

## Erreurs / Exceptions {#core-ref:53038906-7c38-41dd-bccc-60074bda9fde}

N/A

## Historique {#core-ref:fd418292-fa9e-4055-a40e-c4a5d1dec962}

*   Remplace la méthode `addOption()` qui est dépréciée depuis la version 3.2.5.

## Exemples {#core-ref:daec6b1a-477d-4bb8-a976-ac6549ac223e}

    [php]
    $usage = new ApiUsage();
    $format = $usage->addOptionalParameter('format', 'Paper format', array('a3', 'a4'), 'a4');
    $usage->verify();
    printf("format = '%s'\n", $format);

&nbsp;

    $ ./wsh.php --api=test --help
    
    Usage :
       Options:
            --userid=<user system id or login name to execute function - default is (admin)>, default is '1'
            --format=<Paper format> [a3|a4], default is 'a4'
            --help (Show usage)

&nbsp;

    $ ./wsh.php --api=test
    format = 'a4'

&nbsp;

    $ ./wsh.php --api=test --format=a3
    format = 'a3'

## Notes {#core-ref:59a32bc0-4a6c-4440-a28a-feda4723230b}

N/A

## Voir aussi {#core-ref:fde88885-316c-426b-8f52-6734fe6e9c00}

*   [`apiUsage::verify()`][apiUsage_verify]

<!-- links -->
[apiUsage_verify]: #core-ref:26496476-30f7-4e64-979a-fb019d762b7b
