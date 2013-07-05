# ApiUsage::verify() {#core-ref:26496476-30f7-4e64-979a-fb019d762b7b}

<div class="short-description">
Lance la validation des paramètres précédemment définis.
</div>

## Description {#core-ref:46ca347d-2ee7-4d92-a676-a3f8933ec365}

    [php]
    void verify ( bool $useException = false )

Lance la validation des paramètres précédemment définis et génère une erreur si
les paramètres ne sont pas conformes.

### Avertissements {#core-ref:e910d72c-4b4f-4e0e-9619-16e723e8a967}

Aucun.

## Liste des paramètres {#core-ref:1f2394ec-d961-451e-915f-835c5f949ef8}

(bool) `useException`
:   Active (`true`) ou désactive (`false`) la remontée d'erreur par exception
    lors de l'échec de la validation des paramètres.

## Valeur de retour {#core-ref:56cc7195-0225-472f-84da-56cf7b413419}

Aucune.

## Erreurs / Exceptions {#core-ref:9b71f137-0b3f-49de-81c8-df2843ebb952}

Par défaut, l'erreur est remontée via un appel à
[`Action::exitError`][action_exiterror].

Si le mode de [remontée d'erreur par exception][apiUsage_setStrictMode] est
actif, alors une exception `\Dcp\ApiUsage\Exception` est levée.

## Historique {#core-ref:e4e8edd4-2943-4984-b5cb-f8b44babd9a5}

Aucun.

## Exemples {#core-ref:9c713ec6-f02f-4673-b919-ccdad9673bd4}

    [php]
    $usage = new ApiUsage();
    try {
        $usage->verify(true);
    } catch(\Dcp\ApiUsage\Exception $e) {
        printf("Bad parameters!\n");
    }
    printf("Done.");

&nbsp;

    $ ./wsh.php --api=test --foo=bar
    Bad parameters!
    Done.

## Notes {#core-ref:8a4a4f47-3e80-41a3-a4c6-6b033571919d}

Aucune.

## Voir aussi {#core-ref:5ed83ba7-4fa0-463f-8365-b34e2513d1fd}

Aucun.

<!-- links -->
[action_exiterror]: #core-ref:d6845aa2-facc-41b5-82d1-4681fce55783
[apiUsage_setStrictMode]: #core-ref:d7b41169-85c7-4075-ae1f-a3a2d7ea4ff5