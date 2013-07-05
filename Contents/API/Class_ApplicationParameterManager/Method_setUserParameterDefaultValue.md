# ApplicationParameterManager::setUserParameterDefaultValue() {#core-ref:c4de3edd-659f-4c49-bf5d-109ae318335f}

<div markdown="1" class="short-description">
La méthode `setUserParameterDefaultValue()` permet d'écrire la valeur principale
d'un paramètre utilisateur d'une application.
</div>

## Description {#core-ref:ed76df88-cefc-4235-80e7-1da41bc2e01a}

    [php]
    void static setUserParameterDefaultValue ( mixed $application,
                                              string $parameterName,
                                              string $value )

### Avertissements {#core-ref:4cf0803f-4063-4583-8337-170a4f4c079e}

Aucun.

## Liste des paramètres {#core-ref:75b539d4-2c42-4e35-a1c5-0b7430f4e145}

(string|int|Application) `application`
:   Le nom, l'identifiant ou l'objet `Application` de l'application dont on
    souhaite écrire la valeur principale d'un de ses paramètres.

(string) `parameterName`
:   Le nom du paramètre dont on souhaite écrire la valeur principale.

(string) `value`
:   La valeur à inscrire comme valeur principale pour ce paramètre.

## Valeur de retour {#core-ref:05ab2454-b1e8-4f85-89f0-a2d02d6938aa}

La méthode ne retourne rien.

## Erreurs / Exceptions {#core-ref:e7677ae1-a20d-4fb8-be00-b344bd623ce2}

Si le paramètre n'existe pas ou est incorrect, alors une exception
(`\Dcp\ApplicationParameterManager\Exception`) est levée.

## Historique {#core-ref:6e4e42b9-0178-4f05-a5da-862f94a96d43}

Aucun.

## Exemples {#core-ref:034ebd31-8271-40a9-b428-d4199d2c441b}

    [php]
    /*
     * Change la langue par défaut à 'en_US' pour tous les utilisateurs qui
     * n'ont pas de valeur personnalisée.
     */
    ApplicationParameterManager::setUserParameterDefaultValue('CORE', 'CORE_LANG', 'en_US');

## Notes {#core-ref:be147b35-3820-4aa9-8acb-e70b9f792332}

*   L'argument `application` peut aussi être la constante
    `ApplicationParameterManager::CURRENT_APPLICATION` (pour l'application
    *courante*) ou `ApplicationParameterManager::GLOBAL_PARAMETER` pour adresser
    des *paramètres globaux*.

*   Cette méthode est équivalente à un appel à la méthode
    [`setCommonParameterValue()`][setCommonParameterValue].

## Voir aussi {#core-ref:2a7d3b46-dc84-4959-833e-56e43c87e394}

Aucun.

<!-- links -->
[setCommonParameterValue]: #core-ref:2a259dc7-8fb2-4658-86c7-4375d97d941a