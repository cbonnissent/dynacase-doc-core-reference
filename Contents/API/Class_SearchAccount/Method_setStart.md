# SearchAccount::setStart() {#core-ref:06f99854-52b7-4c75-9b8d-b0383fb31ebe}

<div class="short-description">
Cette méthode permet d'indiquer que les n premiers résultats ne sont pas 
retournés.
</div>
<!--
<div class="applicability">
Obsolète depuis #.#.#
</div>
-->

## Description {#core-ref:fd85c92f-73c4-4518-8dc1-150b6f3131e8}

    [php]
    void setStart ( int $start )

Les éléments retourné commence après avoir passé n résultats. Le n est défini
par le paramètre de la fonction.

### Avertissements {#core-ref:b6145782-58c7-4248-8d48-d6f88e59c739}

Aucun

## Liste des paramètres {#core-ref:95e3cabd-0487-49aa-916f-7e2826098605}

(int) `start`
:   Le start doit être une valeur numérique supérieure ou égale à 0 
(si c'est un double, il est converti en entier).

## Valeur de retour {#core-ref:d403c7ec-2cee-4f92-a5ed-33b9aba08f72}

`void`

## Erreurs / Exceptions {#core-ref:ac1966a5-23fc-4fb6-84e6-70bafdcdb542}

Si le start n'est pas valide alors une exception `Dcp\Sacc\Exception` est levée.

## Historique {#core-ref:14005281-10a4-42e6-a8f2-7b1122469851}

Aucun

## Exemples {#core-ref:75530da4-0e1e-4208-b119-133ccf852802}


    [php]
    function setStart(Action & $action)
    {
        header('Content-Type: text/plain');
        
        print "Without slice \n";
        $searchAccount = new SearchAccount();
        $accountList = $searchAccount->search();
        $i = 0;
        foreach ($accountList as $account) {
            printf("Login : %s \n", $account->login);
            $i++;
            if ($i == 3) {
                break;
            }
        }
        print "\n";
        print "\n";
        print "With a start of 2 (get the third element)\n";
        $searchAccount = new SearchAccount();
        $searchAccount->setStart(2);
        $accountList = $searchAccount->search();
        foreach ($accountList as $account) {
            printf("Login : %s", $account->login);
            break;
        }
    }

Résultat :

    Without slice 
    Login : admin 
    Login : all 
    Login : anonymous 
    
    With a start of 2 (get the third element)
    Login : anonymous

## Notes {#core-ref:83aaab7a-54c0-4e1b-90ba-e05daa566d64}

Cette fonction peut-être utilisée avec [setSlice][setSlice] pour faire un 
tourne page.

## Voir aussi {#core-ref:a9e114ab-70c1-458f-ba8b-0dc83430b11a}

* [addFilter][addFilter],
* [setSlice][setSlice],
* [setOrder][setOrder].

<!-- links -->

[addFilter]:        #core-ref:e785ea85-d398-4b6f-8a14-0224f0a9e69f
[setSlice]:         #core-ref:c176d2c5-3ca5-4380-8644-9f084f094403
[setStart]:         #core-ref:06f99854-52b7-4c75-9b8d-b0383fb31ebe
[setOrder]:         #core-ref:bc7439f0-71d5-448a-84bd-2dd7200969bd
[documentList]:     #core-ref:23c71c28-dbce-4d34-819a-50d5bc4a38c3
[accountList]:      #core-ref:b48372db-c2a9-481a-a502-174f972484a3
