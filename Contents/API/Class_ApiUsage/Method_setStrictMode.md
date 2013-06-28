# ApiUsage::setStrictMode() {#core-ref:d7b41169-85c7-4075-ae1f-a3a2d7ea4ff5}

<div class="short-description">
Active, ou désactive, le mode de validation strict des paramètres.
</div>

## Description {#core-ref:b9198925-5e68-44ad-8567-d8ce4fd33de6}

    [php]
    void setStrictMode ( [bool $strict = true] )

Lorsque le mode de validation strict est activé, la présence d'arguments
inconnus met en échec la validation des paramètres.

Par défaut, le mode de validation strict est actif.

### Avertissements {#core-ref:8400e184-7708-4de9-8fe2-e0ae36d861ea}

N/A

## Liste des paramètres {#core-ref:f240c37a-9d22-4ab2-ba30-616d84f2e742}

(bool) `strict`
:   Active ou désactive le mode de validation strict.

## Valeur de retour {#core-ref:accb2d55-37c0-4878-924c-4704716c2623}

N/A

## Erreurs / Exceptions {#core-ref:3ec7ce11-731f-43aa-8300-412b9a054dac}

N/A

## Historique {#core-ref:c05d18d3-924b-4f09-a7f7-42fc1d398e28}

*   Remplace la méthode `strict()` qui est dépréciée depuis la version 3.2.5.

## Exemples {#core-ref:1e39cdeb-3ea2-4674-9610-8d977a7ca53a}

    [php]
    $usage = new ApiUsage();
    $usage->verify();

&nbsp;

    $ ./wsh.php --api=test --foo=bar
    Erreur : {CORE0001} argument 'foo' is not defined
    
    
    Usage :
       Options:
            --userid=<user system id or login name to execute function - default is (admin)>, default is '1'
            --help (Show usage) 

Une erreur est remontée concernant le paramètre `foo` inconnu.

    [php]
    $usage = new ApiUsage();
    $usage->setStrictMode(false);
    $usage->verify();

&nbsp;

    $ ./wsh.php --api=test --foo=bar

Aucune erreur n'est remonté concernant le paramètre `foo` inconnu.

## Notes {#core-ref:a0db0f86-0482-43db-b42a-193aac8b23e2}

N/A

## Voir aussi {#core-ref:44e0585e-e6ea-40a5-9226-639848fd84d7}

*   [`apiUsage::verify()`][apiUsage_verify]

<!-- links -->
[apiUsage_verify]: #core-ref:26496476-30f7-4e64-979a-fb019d762b7b