# SearchDoc::reset() {#core-ref:39efa6f3-4d70-452c-b14b-891adca3a56d}

<div class="short-description">
Cette méthode permet de réinitialiser un objet SearchDoc.
</div>
<!--
<div class="applicability">
Obsolète depuis #.#.#
</div>
-->

## Description {#core-ref:d7d3100d-8d43-4dc6-b875-ca6c0232a08f}

    [php]
    void reset( )

Cette méthode réinitialise les paramètres de la recherche initialisés par la 
méthode [`SearchDoc::search`][search]. Elle permet donc d'exécuter une nouvelle
fois la méthode [`SearchDoc::search`][search], cela permet par exemple d'ajouter
un nouveau [filtre][filtre] et de rafraîchir le décompte du nombre de documents
trouvés.

### Avertissements {#core-ref:78deabc6-1b72-4aa6-9638-1891faf0a97a}

L'utilisation de `SearchDoc::reset` durant une itération réinitialise le 
pointeur et donc fait reprendre l'itération à 0.

## Liste des paramètres {#core-ref:dab0e2fd-8e0f-4f78-b3dd-134f704b5401}

N/A

## Valeur de retour {#core-ref:5ac5a279-5919-4984-b1a4-85f5da8956d0}

void

## Erreurs / Exceptions {#core-ref:a30114f4-4ef4-4c4d-b0ab-f48f9a3a7ce7}

N/A

## Historique {#core-ref:1e2fbc1d-6efb-474f-bfc8-a66572873b28}

N/A

## Exemples {#core-ref:cb2c79ea-10c5-49fc-b85a-2978d9d8ad24}

Test du reset :

    [php]
    function testResetEffect(Action & $action)
    {
        header('Content-Type: text/plain');
        
        $searchDoc = new searchDoc();
        $searchDoc->setObjectReturn();
        
        $searchDoc->search();
        
        print "Initial count \n";
        var_export($searchDoc->count());
        print "\n";
        var_export($searchDoc->getSearchInfo());
        print "\n";
        
        print "Add a filter \n";
        $searchDoc->addFilter("title = 'Rotor'");
        
        print "Count without reset \n";
        var_export($searchDoc->count());
        print "\n";
        var_export($searchDoc->getSearchInfo());
        print "\n";
        
        $searchDoc->reset();
        $searchDoc->search();
        
        print "Count with reset \n";
        var_export($searchDoc->count());
        print "\n";
        var_export($searchDoc->getSearchInfo());
    }

Résultat :

    Initial count 
    1469
    array (
      'count' => 1469,
      'query' => 'select docread.id, owner, title, revision, version, initid, fromid, doctype, locked, allocated, archiveid, icon, lmodify, profid, usefor, cdate, adate, revdate, comment, classname, state, wid, postitid, domainid, lockdomainid, cvid, name, dprofid, atags, prelid, confidential, ldapdn, values, svalues, attrids  from  docread  where   (docread.archiveid is null) and (docread.doctype != \'Z\') and (docread.doctype != \'T\') and (docread.locked != -1) ORDER BY title LIMIT ALL OFFSET 0;',
      'error' => '',
      'delay' => '0.046s',
    )
    Add a filter 
    Count without reset 
    1469
    array (
      'count' => 1469,
      'query' => 'select docread.id, owner, title, revision, version, initid, fromid, doctype, locked, allocated, archiveid, icon, lmodify, profid, usefor, cdate, adate, revdate, comment, classname, state, wid, postitid, domainid, lockdomainid, cvid, name, dprofid, atags, prelid, confidential, ldapdn, values, svalues, attrids  from  docread  where   (docread.archiveid is null) and (docread.doctype != \'Z\') and (docread.doctype != \'T\') and (docread.locked != -1) ORDER BY title LIMIT ALL OFFSET 0;',
      'error' => '',
      'delay' => '0.046s',
    )
    Count with reset 
    1
    array (
      'count' => 1,
      'query' => 'select docread.id, owner, title, revision, version, initid, fromid, doctype, locked, allocated, archiveid, icon, lmodify, profid, usefor, cdate, adate, revdate, comment, classname, state, wid, postitid, domainid, lockdomainid, cvid, name, dprofid, atags, prelid, confidential, ldapdn, values, svalues, attrids  from  docread  where   (docread.archiveid is null) and (docread.doctype != \'Z\') and (docread.doctype != \'T\') and (docread.locked != -1) and (title = \'Rotor\') ORDER BY title LIMIT ALL OFFSET 0;',
      'error' => '',
      'delay' => '0.003s',
    )


## Notes {#core-ref:e482e5d7-ec03-4dd8-bf19-7492c022e26b}

N/A

## Voir aussi {#core-ref:e27a6223-d80b-43a5-bf79-51e4753c6dd4}

N/A

<!-- links -->

[filtre]:               #core-ref:ec525c92-ab30-4861-aba1-7c2678df130a
[search]:               #core-ref:6f5cc024-66e4-429e-9071-67d4523a8e08