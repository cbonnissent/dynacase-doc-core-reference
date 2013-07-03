# ApiUsage::setDefinitionText() {#core-ref:a3c5f987-ad71-405b-8b77-4fe1e130817a}

<div class="short-description">
Ajoute un texte de description du script d'API dans le message d'usage.
</div>

## Description {#core-ref:eaa0cb66-1932-4178-b1e2-260c5223e019}

    [php]
    void setDefinitionText ( string $text )

### Avertissements {#core-ref:1b5987d2-df9c-4aec-b268-534f419ece71}

N/A

## Liste des paramètres {#core-ref:ad961828-c5af-48d8-bd07-d8aa225bff1a}

(string) `text`
:   Le texte (simple ligne) de description du script.

## Valeur de retour {#core-ref:145455d7-5a22-460c-bc03-ba7913aeb8c2}

La méthode ne retourne pas de valeur.

## Erreurs / Exceptions {#core-ref:1b17bf35-579f-4d48-a0d2-551baa2b85b8}

N/A

## Historique {#core-ref:3a32d719-4bbb-43b0-b732-ded2fa0a73c7}

*   Remplace la méthode `setText()` qui est dépréciée depuis la version 3.2.5.

## Exemples {#core-ref:6dee61aa-ed4a-4a2a-9128-cd69bbb9cefc}

    [php]
    $usage = new ApiUsage();
    $usage->setDefinitionText("Script de test de la classe ApiUsage");
    $usage->verify();

&nbsp;

    $ ./wsh.php --api=test --help
    Script de test de la classe ApiUsage
    Usage :
       Options:
            --userid=<user system id or login name to execute function - default is (admin)>, default is '1'
            --help (Show usage) 

## Notes {#core-ref:1f45ad0a-97dd-42e0-93f1-482de8e6c309}

N/A

## Voir aussi {#core-ref:55a17a86-4996-4d93-83ee-f1af685b4c25}

*   [`apiUsage::verify()`][apiUsage_verify]

<!-- links -->
[apiUsage_verify]: #core-ref:26496476-30f7-4e64-979a-fb019d762b7b
