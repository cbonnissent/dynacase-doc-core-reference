# SearchDoc::reset() {#core-ref:39efa6f3-4d70-452c-b14b-891adca3a56d}

<div class="short-description">
Cette méthode permet de réinitialiser les résultats d'un objet SearchDoc.
</div>


## Description {#core-ref:d7d3100d-8d43-4dc6-b875-ca6c0232a08f}

    [php]
    void reset( )

Cette méthode réinitialise les résultats de la recherche initialisés par la
méthode [`SearchDoc::search()`][search] et [`SearchDoc::onlyCount()`][onlyCount].

Elle permet d'ajouter un nouveau [filtre][filtre] afin de relancer une nouvelle
itération.

### Avertissements {#core-ref:78deabc6-1b72-4aa6-9638-1891faf0a97a}

L'utilisation de `SearchDoc::reset` durant une itération réinitialise le 
pointeur et fait reprendre l'itération à 0.

## Liste des paramètres {#core-ref:dab0e2fd-8e0f-4f78-b3dd-134f704b5401}

Aucun.

## Valeur de retour {#core-ref:5ac5a279-5919-4984-b1a4-85f5da8956d0}

void

## Erreurs / Exceptions {#core-ref:a30114f4-4ef4-4c4d-b0ab-f48f9a3a7ce7}

Aucune.

## Historique {#core-ref:1e2fbc1d-6efb-474f-bfc8-a66572873b28}

Aucun.

## Exemples {#core-ref:cb2c79ea-10c5-49fc-b85a-2978d9d8ad24}

    [php]
    $searchDoc = new searchDoc("", "ZOO_ANIMAL");
    $searchDoc->setObjectReturn();
    
    foreach ($searchDoc->getDocumentList() as $document) {
        printf("Title : %s \n\t date : %s \n", 
             $document->getTitle(),
             $document->getTextualAttrValue(\Dcp\AttributeIdentifiers\Zoo_Animal::an_date));
    }
    
    // on ajoute un filtre (date supérieure à l'année dernière)
    $searchDoc->addFilter("%s > '%s'", 
                            \Dcp\AttributeIdentifiers\Zoo_Animal::an_date,
                            date('Y-m-d',strtotime("-1 year"));
                            
    // on réinitialise pour forcer l'exécution de la recherche.
    $searchDoc->reset();
    
    foreach ($searchDoc->getDocumentList() as $document) {
        printf("Title : %s \n\t date : %s \n", 
             $document->getTitle(),
             $document->getTextualAttrValue(\Dcp\AttributeIdentifiers\Zoo_Animal::an_date));
    }


## Notes {#core-ref:e482e5d7-ec03-4dd8-bf19-7492c022e26b}

La méthode `searchDoc::rewind()` réinitialise aussi le pointeur de l'itération
mais ne refait pas la requête.

## Voir aussi {#core-ref:e27a6223-d80b-43a5-bf79-51e4753c6dd4}

Aucun.

<!-- links -->

[filtre]:               #core-ref:ec525c92-ab30-4861-aba1-7c2678df130a
[search]:               #core-ref:6f5cc024-66e4-429e-9071-67d4523a8e08
[onlycount]:            #core-ref:2d43be1a-1991-42dd-a25d-5c3bb0b393fa
