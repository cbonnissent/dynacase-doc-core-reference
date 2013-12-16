# SearchDoc::getIds() {#core-ref:00b7692c-81a4-4e71-a245-d8844925843d}

<div class="short-description">
Cette méthode permet de récupérer un array contenant la liste des 
id des documents trouvés.
</div>


## Description {#core-ref:b73f99a7-4219-40e7-becc-51001c56ebe5}

    [php]
    array getIds ()

### Avertissements {#core-ref:4c26d383-dd9e-4284-bf28-ae7892f15968}

Cette méthode ne peut être exécutée uniquement qu'après la méthode
[`SearchDoc::search`][SearchDoc].

## Liste des paramètres {#core-ref:c4f36b75-1acf-4fec-82b6-f5b4427aec4b}

Aucun.

## Valeur de retour {#core-ref:4c3ca1ba-fd66-49bd-8ada-50eee9f6670c}

`array`
:   Un array contenant la liste des identifiants des documents trouvés.  
    Ce sont les `id` des documents et non les `initid` qui sont retournés.

## Erreurs / Exceptions {#core-ref:c632f50d-eebe-4e3d-8c07-937cf43ba43a}

Aucune.

## Historique {#core-ref:30b275ee-d182-4e31-8838-8b2690b2356e}

Aucun.

## Exemples {#core-ref:d9c31498-81b9-4201-92df-e7187ecae104}

Recherche des identifiant ds 5 premiers dossiers créés.

    [php]
    $s=new SearchDoc("","DIR");
    $s->setObjectReturn(true);
    $s->setSlice(5);
    $s->setOrder('initid');
    $s->search();
    
    $ids=$s->getIds();
    print_r($s->getIds());
    $documentList=$s->getDocumentList();
    foreach ($documentList as $docid=>$doc) {
      printf("%d) %s\n", 
         $docid,
         $doc->getTitle());
    }

Résultat :

    Array
    (
        [0] => 9
        [1] => 1006
        [2] => 1010
        [3] => 1011
        [4] => 1046
    )
    9) Racine
    1006) Comptes
    1010) Utilisateurs
    1011) Administrateurs
    1046) FLD_ZOO_CLASSE


## Notes {#core-ref:994821cf-d6a2-42b9-8738-ce85ce7513ea}

Aucun.

## Voir aussi {#core-ref:94065bbd-e261-4088-b74b-dfad9b256418}

*   [`SearchDoc::returnsOnly()`][returnsonly].

<!-- links -->

[phpArray]:     http://www.php.net/manual/fr/book.array.php "PHP Array"
[SearchDoc]:    #core-ref:6f5cc024-66e4-429e-9071-67d4523a8e08
[returnsonly]:  #core-ref:6429b289-8fec-4c7e-8906-5f367c5bf59d