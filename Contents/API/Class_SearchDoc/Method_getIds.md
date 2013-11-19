# SearchDoc::getIds() {#core-ref:00b7692c-81a4-4e71-a245-d8844925843d}

<div class="short-description">
Cette méthode permet de récupérer un array contenant la liste des 
id des documents trouvés.
</div>
<!--
<div class="applicability">
Obsolète depuis #.#.#
</div>
-->

## Description {#core-ref:b73f99a7-4219-40e7-becc-51001c56ebe5}

    [php]
    Array getIds ()

### Avertissements {#core-ref:4c26d383-dd9e-4284-bf28-ae7892f15968}

Cette méthode ne peut être exécutée uniquement après la méthode [`SearchDoc::search`][search].

## Liste des paramètres {#core-ref:c4f36b75-1acf-4fec-82b6-f5b4427aec4b}

N/A

## Valeur de retour {#core-ref:4c3ca1ba-fd66-49bd-8ada-50eee9f6670c}

`Array`
:   Un array contenant la liste des id des documents trouvés.

## Erreurs / Exceptions {#core-ref:c632f50d-eebe-4e3d-8c07-937cf43ba43a}

N/A

## Historique {#core-ref:30b275ee-d182-4e31-8838-8b2690b2356e}

N/A

## Exemples {#core-ref:d9c31498-81b9-4201-92df-e7187ecae104}

N/A

## Notes {#core-ref:994821cf-d6a2-42b9-8738-ce85ce7513ea}

N/A

## Voir aussi {#core-ref:94065bbd-e261-4088-b74b-dfad9b256418}

    [php]
    function getIds(Action & $action)
    {
        header('Content-Type: text/plain');
        
        $searchDoc = new SearchDoc();
        $searchDoc->setObjectReturn(true);
        
        $searchDoc->search();
        
        $err = $searchDoc->getError();
        if ($err !== "") {
            throw new Exception("Error Processing Search ".$err, 1);
        }
        
        var_export($searchDoc->getIds());
    
    }

<!-- links -->

[phpArray]:     http://us1.php.net/manual/en/book.array.php "PHP Array"
[SearchDoc]:         #core-ref:a5216d5c-4e0f-4e3c-9553-7cbfda6b3255