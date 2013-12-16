# SearchAccount::setSlice() {#core-ref:c176d2c5-3ca5-4380-8644-9f084f094403}

<div markdown="1" class="short-description">
Cette méthode permet de définir le nombre maximum d'éléments retournés par la
recherche.
</div>

## Description {#core-ref:0c0374e0-f56d-4e34-9f50-33cefdca9743}

    [php]
    void setSlice ( string|int $slice )

Cette fonction permet de définir la nombre maximum d'éléments retournés.  Sa
valeur par défaut est `all` ce qui correspond à un retour de tous les éléments.

### Avertissements {#core-ref:94f83907-f527-430c-8aed-1a17b5b232ad}

Aucun

## Liste des paramètres {#core-ref:b96c42c4-c1ce-490a-9331-021a83e35651}

(string|int) `slice`
:   Le slice doit être une valeur numérique supérieure ou égale à 0 
(si c'est un double, il est converti en entier) ou la chaîne de caractères `all`.

## Valeur de retour {#core-ref:892aa1a7-09d4-4b9f-aaba-90c478ee0a68}

`void`

## Erreurs / Exceptions {#core-ref:4d58d704-3fe7-4c0d-b8b3-406fa6b1d180}

Si le slice n'est pas valide alors une exception `Dcp\Sacc\Exception` est levée.

## Historique {#core-ref:767cab12-7e52-4bdc-b303-bcaae6995e54}

Aucun

## Exemples {#core-ref:99ac861f-3a0e-4808-a1c1-9781ececd1ca}

    [php]
    function setSlice(Action & $action)
    {
        header('Content-Type: text/plain');
        
        print "Without slice \n";
        $searchAccount = new SearchAccount();
        $accountList = $searchAccount->search();
        printf("count : %d", count($accountList));
        print "\n";
        print "\n";
        print "With a slice of 2 \n";
        $searchAccount = new SearchAccount();
        $searchAccount->setSlice(2);
        $accountList = $searchAccount->search();
        printf("count : %d", count($accountList));
    }

Résultat :

    Without slice 
    count : 14
    
    With a slice of 2 
    count : 2


## Notes {#core-ref:1e9c81c2-71ff-45a3-8e13-b19653db4a8c}

Aucune

## Voir aussi {#core-ref:09b1dce2-3db8-4d49-bcad-b435ee6a0e11}


* [addFilter][addFilter],
* [setStart][setStart],
* [setOrder][setOrder].

<!-- links -->

[addFilter]:        #core-ref:e785ea85-d398-4b6f-8a14-0224f0a9e69f
[setStart]:         #core-ref:06f99854-52b7-4c75-9b8d-b0383fb31ebe
[setOrder]:         #core-ref:bc7439f0-71d5-448a-84bd-2dd7200969bd
[documentList]:     #core-ref:23c71c28-dbce-4d34-819a-50d5bc4a38c3
[accountList]:      #core-ref:b48372db-c2a9-481a-a502-174f972484a3
