# SearchDoc::excludeConfidential() {#core-ref:17be152c-0844-40d5-bfc5-a9aa2f2695fc}

<div class="short-description" markdown="1">

Cette méthode permet d'exclure les documents marqués comme
[confidentiel][confidential].

</div>


## Description {#core-ref:4798fa87-48ef-4a33-97f7-c7d94c0213a5}

    [php]
    bool excludeConfidential ( bool $exclude = true )

Il est possible de marquer des documents comme confidentiels ceux-ci sont alors
trouvés dans les recherches mais ne sont pas consultables si l'utilisateur n'en
a pas le droit. Cette méthode permet d'exclure ces documents si l'utilisateur
n'a pas le droit [`confidential`][docacl] sur les documents recherchés.

### Avertissements {#core-ref:ebdc7e22-1f94-4b93-b3b2-9efbd65e4247}

Si la recherche est faite avec l'utilisateur "admin" cette méthode est
sans effet car "admin" a tous les droits.

Par défaut, la méthode [`::search()`][search] retourne les documents
confidentiels, même ceux auxquels l'utilisateur n'a pas le droit `confidential`.

## Liste des paramètres {#core-ref:2d01bcf2-35ba-4faa-a90d-89c2ebaf318c}

(bool) `exclude` (valeur par défaut : `true`)
:   Si la valeur est à `true` alors les documents confidentiels sont exclus, 
    si la valeur est à `false` ils sont inclus. Un objet `searchDoc` les inclus
    par défaut.

## Valeur de retour {#core-ref:4e29d1b2-0ca1-46c0-a5dc-f0ad378d4130}

void

## Erreurs / Exceptions {#core-ref:a4c949dc-629f-4f4d-a858-7fc24b8bd31b}

Aucun.

## Historique {#core-ref:991ead7d-149b-4ff0-9cd5-29de4fc03ad4}

Aucun.

## Exemples {#core-ref:e132ede4-6a51-43c6-a862-3e269fa89283}

### Recherche de tous les documents accessibles {#core-ref:09dbad94-9a03-4ac0-bc1e-3d170e1f603c}

Cette exemple retourne les documents accessibles :

*   les document non confidentiels
*   les document confidentiels où l'utilisateur possède les privilèges suffisants.

&nbsp;

    [php]
    $searchDoc = new SearchDoc('', '');
    $searchDoc->setObjectReturn();
    $searchDoc->excludeConfidential(true);
    $searchDoc->search();
    
    $s=$searchDoc->getSearchInfo();
    print_r($s);

Résultat :

    Array
    (
        [count] => 1631
<!--beware there is no tab here for sql syntax-->

    [sql]
        [query] => select docread.id, owner, title, confidential, ...  from  docread  
                   where    (docread.archiveid is null) 
                        and (docread.doctype != 'Z') 
                        and (docread.doctype != 'T') 
                        and (docread.locked != -1) 
                        and (confidential is null or hasaprivilege('{2,11}', profid,1024)) 
                        and (views && '{2,0,11}') 
                   ORDER BY title LIMIT ALL OFFSET 0;

        [error] => 
        [error] => 
        [delay] => 0.042s
    )



### Recherche de tous les documents visibles y compris les confidentiels {#core-ref:2aa99f52-1486-44b0-897f-e4032b45e48f}

    [php]
    $searchDoc = new SearchDoc('', '');
    $searchDoc->setObjectReturn();
    $searchDoc->excludeConfidential(false);
    $searchDoc->search();
    
    $searchInfo=$searchDoc->getSearchInfo();
    print_r($searchInfo);
    $documentList=searchDoc->getDocumentList();
    foreach ($documentList as $doc) {
          if ($doc->isConfidential()) {
            printf("Confidential : %d) %s\n", $doc->id, $doc->getTitle());
          }
    }

Résultat :

    Array
    (
        [count] => 1634
<!--beware there is no tab here for sql syntax-->

    [sql]
        [query] => select docread.id, owner, title, confidential, ...  from  docread  
                   where    (docread.archiveid is null) 
                        and (docread.doctype != 'Z') 
                        and (docread.doctype != 'T') 
                        and (docread.locked != -1) 
                        and (views && '{2,0,11}') 
                    ORDER BY title LIMIT ALL OFFSET 0;

        [error] => 
        [delay] => 0.041s
    )

    Confidential : 1421) document confidentiel
    Confidential : 1419) document confidentiel
    Confidential : 1420) document confidentiel



### Recherche de tous les documents confidentiels {#core-ref:fe9fe058-80bc-4caf-a32a-e3c62c7d4c85}

    [php]
    $searchDoc = new SearchDoc('', '');
    $searchDoc->setObjectReturn();
    $searchDoc->addFilter("confidential > 0");
    $searchDoc->search();
    
    print_r($searchDoc->getSearchInfo());

Résultat :

    Array
    (
        [count] => 3
<!--beware there is no tab here for sql syntax-->

    [sql]
        [query] => select docread.id, owner, title, confidential, ...  from  docread  
                   where    (docread.archiveid is null) 
                        and (docread.doctype != 'Z') 
                        and (docread.doctype != 'T') 
                        and (docread.locked != -1) 
                        and (confidential > 0) 
                        and (views && '{2,0,11}') 
                  ORDER BY title LIMIT ALL OFFSET 0;

        [error] => 
        [error] => 
        [delay] => 0.006s
    )

## Notes {#core-ref:8c27a9a8-9c7c-4906-bc95-52b009c5519e}

La méthode [`Doc::getTitle()`][gettitle] retourne "Document confidentiel"
lorsque l'utilisateur courant n'a pas les privilèges suffisants pour accéder au
document.

## Voir aussi {#core-ref:ac916fed-9757-4c6f-b908-0277656b37eb}

Le chapitre de sécurité avancé sur la [recherche des confidentiels][advancedConfidential].

<!-- links -->

[advancedConfidential]:         #core-ref:5da495b6-7e9f-4063-a254-3689bb786389
[docacl]:                       #core-ref:a99dcc5f-f42f-4574-bbfa-d7bb0573c95d
[search]:                       #core-ref:6f5cc024-66e4-429e-9071-67d4523a8e08
[gettitle]:                     #core-ref:84011cc8-2aec-4f39-81f0-c7ae803e4913
[confidential]:                 #core-ref:ba033340-2117-46f4-9efc-19c8609a8f28