# SearchDoc::onlyCount() {#core-ref:2d43be1a-1991-42dd-a25d-5c3bb0b393fa}

<div class="short-description">
Cette méthode permet de ne faire que le décompte des documents.
</div>
<!--
<div class="applicability">
Obsolète depuis #.#.#
</div>
-->

## Description {#core-ref:6016b83d-e4fc-4e6e-87dd-ab7eeee3dc7a}

    [php]
    int onlyCount ()

Cette méthode permet d'avoir uniquement le nombre de documents trouvés par la 
requête sans pour autant récupérer ces documents de la base de données.

### Avertissements {#core-ref:a42d9ab4-4e62-4519-aed3-cd93624cbc49}

Le fonctionnement de la méthode est différent suivant si la méthode
[`SearchDoc::search`][search] a été ou pas exécuté :

* *si search n'a pas été exécuté* alors le onlyCount prend en compte tous les 
  addFilter,
* *si search a été exécuté* alors le onlyCount ne prend pas en compte les 
  addFilter qui ont été fait après le search.

## Liste des paramètres {#core-ref:14ff45a3-1478-4e9d-a024-3aee916fb23a}

N/A

## Valeur de retour {#core-ref:98890fb4-34d7-4743-9035-eb88bc026f1c}

`int`
:   Le nombre de documents trouvés par le searchDoc.

## Erreurs / Exceptions {#core-ref:14835f07-019e-4fc0-ae07-33510d648027}

N/A

## Historique {#core-ref:b2d103c2-4aba-46b6-bfd7-1e933aab9a87}

N/A

## Exemples {#core-ref:d5c199d8-e3d2-4a9a-8b5a-0b76f0741155}

Exemple de searchDoc :

    [php]
    function testOnlyCount(Action & $action)
    {
        header('Content-Type: text/plain');
        
        $searchDoc = new searchDoc();
        var_export($searchDoc->onlyCount());
        print "\n";
        var_export($searchDoc->getSearchInfo());
        print "\n";
        print "\n";
        $searchDoc->addFilter("title = 'toto'");
        var_export($searchDoc->onlyCount());
        print "\n";
        var_export($searchDoc->getSearchInfo());
        print "\n";
        print "\n";
        $searchDoc = new searchDoc();
        $searchDoc->search();
        var_export($searchDoc->onlyCount());
        print "\n";
        var_export($searchDoc->getSearchInfo());
        print "\n";
        print "\n";
        $searchDoc->addFilter("title = 'toto'");
        var_export($searchDoc->onlyCount());
        print "\n";
        var_export($searchDoc->getSearchInfo());
        print "\n";
        print "\n";
        
    }

    1493
    array (
      'query' => 'select count(docread.id) from  docread  where   (docread.archiveid is null) and (docread.doctype != \'Z\') and (docread.doctype != \'T\') and (docread.locked != -1)',
      'delay' => '0.003s',
    )
    
    0
    array (
      'query' => 'select count(docread.id) from  docread  where   (docread.archiveid is null) and (docread.doctype != \'Z\') and (docread.doctype != \'T\') and (docread.locked != -1) and (title = \'toto\')',
      'delay' => '0.001s',
    )
    
    1493
    array (
      'count' => 1493,
      'query' => 'select docread.id, owner, title, revision, version, initid, fromid, doctype, locked, allocated, archiveid, icon, lmodify, profid, usefor, cdate, adate, revdate, comment, classname, state, wid, postitid, domainid, lockdomainid, cvid, name, dprofid, atags, prelid, confidential, ldapdn, values, svalues, attrids  from  docread  where   (docread.archiveid is null) and (docread.doctype != \'Z\') and (docread.doctype != \'T\') and (docread.locked != -1) ORDER BY title LIMIT ALL OFFSET 0;',
      'error' => '',
      'delay' => '0.073s',
    )
    
    1493
    array (
      'count' => 1493,
      'query' => 'select docread.id, owner, title, revision, version, initid, fromid, doctype, locked, allocated, archiveid, icon, lmodify, profid, usefor, cdate, adate, revdate, comment, classname, state, wid, postitid, domainid, lockdomainid, cvid, name, dprofid, atags, prelid, confidential, ldapdn, values, svalues, attrids  from  docread  where   (docread.archiveid is null) and (docread.doctype != \'Z\') and (docread.doctype != \'T\') and (docread.locked != -1) ORDER BY title LIMIT ALL OFFSET 0;',
      'error' => '',
      'delay' => '0.073s',
    )

## Notes {#core-ref:ee038431-ef60-41c1-b52f-f958a3923b44}

N/A

## Voir aussi {#core-ref:a2d49a00-ca37-4120-8ada-f0a80a3791bd}

N/A

<!-- links -->

[search]:       #core-ref:6f5cc024-66e4-429e-9071-67d4523a8e08