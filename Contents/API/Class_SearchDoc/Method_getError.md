# SearchDoc::getError() {#core-ref:e57302ed-319e-4d63-b817-7a22d0ead3f2}

<div class="short-description">
Cette méthode permet d'avoir un retour d'erreur si jamais l'exécution de la 
recherche a rencontré une erreur (préparation de la requête impossible, etc.).
</div>
<!--
<div class="applicability">
Obsolète depuis #.#.#
</div>
-->

## Description {#core-ref:388b9625-d339-40c2-bd52-22c6ee6b3bdc}

    [php]
    string getError()

### Avertissements {#core-ref:b74e3a9f-ba3c-4420-bd0d-8de5ebd05118}

N/A

## Liste des paramètres {#core-ref:3b1ab24d-f9dd-433e-b634-e0ed8b2a2209}

N/A

## Valeur de retour {#core-ref:538b5198-260f-4661-8f9b-ba59250d5bb6}

`String`
:   Une chaîne de caractères apportant des informations sur l'erreur.

## Erreurs / Exceptions {#core-ref:d788588c-8011-4f4c-b90f-078fb579197d}

N/A

## Historique {#core-ref:665bd091-81ac-4df3-9011-c85f40b10a4d}

N/A

## Exemples {#core-ref:8f0111a1-b37a-4517-a1b4-62b482265bf9}

Utilisation de la méthode getError pour renvoyer une exception si jamais la 
recherche a échoué :

    [php]
    function searchAnUnknownFam(Action & $action)
    {
        header('Content-Type: text/plain');
        
        $searchDoc = new SearchDoc("", "UNKOWN FAMILY");
        $searchDoc->setObjectReturn(true);
        
        $searchDoc->search();
        
        $err = $searchDoc->getError();
        if ($err !== "") {
            throw new Exception("Error Processing Search ".$err, 1);
        }
    
    }

**Note** : Si la famille `UNKOWN FAMILY` n'existe pas une exception est
déclenchée.


## Notes {#core-ref:a36789c7-a746-4bf6-a4cc-5cddce574c6f}

N/A

## Voir aussi {#core-ref:757fe23c-b6b1-42d4-971c-64aff4f2e3bf}

N/A
