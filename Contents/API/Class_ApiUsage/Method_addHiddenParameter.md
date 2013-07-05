# ApiUsage::addHiddenParameter() {#core-ref:9684dde3-1afe-4102-9c8f-6ae628c57dd1}

<div class="short-description">
Ajoute un paramètre sans que celui-ci ne soit visible dans le texte d'usage.
</div>

## Description {#core-ref:b0f11a22-5295-4a04-89c8-46d4ee30b0d4}

    [php]
    string addHiddenParameter ( string $argNAme, string $argDefinition = "" )

La présence du paramètre est vérifiée, et sa valeur retournée.

Un paramètre `hidden` n'est pas requis, et il est traité comme un paramètre
optionnel ([`ApiUsage::addOptionalParameter`][apiusage_addoptionalparameter]).

### Avertissements {#core-ref:f76934b5-edef-4c55-8aa1-2d02ce8e54e8}

N/A

## Liste des paramètres {#core-ref:27a9f9cb-fbf9-4a52-8d9b-bc9324b73571}

(string) `argName`
:   Le nom du paramètre.

(string) `argDefinition`
:   Un texte (simple ligne) de description du paramètre.

## Valeur de retour {#core-ref:076e9841-590e-473d-bb91-99e6ae8e20b0}

Retourne la valeur du paramètre ou `null` si le paramètre n'est pas présent.

## Erreurs / Exceptions {#core-ref:5181befb-980e-4e47-ac8b-961e50b86cf0}

N/A

## Historique {#core-ref:c57688b0-3f63-4415-b0b2-9be1aeb3a8f3}

*   Remplace la méthode `addHidden()` qui est dépréciée depuis la version 3.2.5.

## Exemples {#core-ref:c2257e2f-338d-4380-bc60-14b99e5a05f2}

    [php]
    $usage = new ApiUsage();
    $hidden = $usage->addHiddenParameter("hidden", "Hidden option");
    $usage->verify();
    
    printf("hidden = '%s'\n", $hidden);

&nbsp;

    [bash]
    $ ./wsh.php --api=test --help 
    
    Usage :
       Options:
            --userid=<user system id or login name to execute function - default is (admin)>, default is '1'
            --help (Show usage)

L'utilisation du paramètre `--hidden` n'apparaît pas dans le texte d'usage.

    [bash]
    $ ./wsh.php --api=test --hidden=foo
    hidden = 'foo'

## Notes {#core-ref:fbcf7c4d-8e3d-4f3d-b4b5-9c9071e869c5}

N/A

## Voir aussi {#core-ref:3750f504-379d-481c-a5a8-97acd969ef58}

*   [`ApiUsage::addOptionalParameter`][apiusage_addoptionalparameter]
*   [`apiUsage::verify()`][apiUsage_verify]

<!-- links -->
[apiUsage_verify]: #core-ref:26496476-30f7-4e64-979a-fb019d762b7b
[apiusage_addoptionalparameter]: #core-ref:180f3da7-1707-4175-9f6a-694b621fe940