# Doc::getDate() {#core-ref:a51b877a-f0e5-4ab7-bbd0-2a05c797aea1}

<div class="short-description" markdown="1">

La méthode `getDate` permet d'obtenir la date du jour au format texte.

</div>

## Description {#core-ref:42425d59-f515-4c63-b009-512a35bfb992}

    [php]
    string getDate ( int $daydelta  = 0,
                     int $dayhour   = "",
                     int $daymin    = "",
                    bool $getlocale = false )

La méthode `getDate` permet d'obtenir une date du jour compensée par un certain
nombre de jours, d'heures ou de minutes.

La date retournée est au format texte international ou au format de la locale de
l'utilisateur courant.

La valeur ainsi obtenue est utilisable pour affecter la valeur d'un attribut de
type [`date`][type_date] ou [`timestamp`][type_timestamp] avec la méthode
[`Doc::setAttributeValue`][Doc::setAttributeValue].

### Avertissements {#core-ref:094a5b82-4067-43c3-b2f2-57ae129bae1d}

Aucun.

## Liste des paramètres {#core-ref:67d2e750-c70c-4bad-8977-35378e7d8cf9}

(int) `daydelta`
:   `daydelta` permet d'appliquer une compensation de la date en nombre de
    jours.
    
    Si `daydelta` est < 0, alors la date retournée est la date courante moins
    le nombre de jours demandés.
    
    Si `daydelta` est > 0, alors la date retournée est la date courante plus
    le nombre de jours demandés.
    
    Par défaut, `daydelta` est égal à 0 et retourne donc la date courante.

(int) `dayhour`
:   `dayhour` permet d'appliquer une compensation en nombre d'heures.
    
    Si `dayhour` est différent de la chaîne vide, alors une compensation
    exprimée en nombre d'heures est appliquée.
    
    Par défaut `dayhour` est égal à la chaîne vide.

(int) `daymin`
:   `daymin` permet d'appliquer une compensation en nombre de minutes.
    
    Si `daymin` est différent de la chaîne vide, alors une compensation exprimée
    en nombre de minutes est appliquée.
    
    Par défaut `daymin` est égal à la chaîne vide.

(boo) `getlocale`
:   `getlocale` permet de spécifier si la doit être retournée localisée en
    fonction de la locale de l'utilisateur courant.
    
    Par défaut `getlocale` est égal à `false` et la date retournée est au
    format international.

## Valeur de retour {#core-ref:f40f8393-ae7a-407b-97bd-1c9108a0f0ca}

La date est retournée en texte au format international ou localisé.

Si `getlocale` est égal à `false`, alors la date est retournée au format
international `Y-m-d` ou `Y-m-d H:i` s'il y a eu ajout d'heures ou de minutes.

Si `getlocale` est égal à `true`, alors la date est retournée au format
défini par la locale de l'utilisateur courant.

## Erreurs / Exceptions {#core-ref:ba5e2b70-e8a1-4709-90fa-730886dd5f33}

Aucune.

## Historique {#core-ref:c242d38a-2fd4-4abc-8282-ee1620b732e3}

Aucun.

## Exemples {#core-ref:b5cb6e69-a150-4e53-b1a0-14867dc7d214}

- Exemple #1

Obtenir la date d'hier, d'aujourd'hui et de demain :

    [php]
    /*
     * Date d'hier : -1 jour
     */
    var_dump($doc->getDate(-1));
    
    /*
     * Date du jour
     */
    var_dump($doc->getDate());    
    
    /*
     * Date de demain : +1 jour
     */
    var_dump($doc->getDate(1));

Résultat :

    string(10) "2013-12-24"
    string(10) "2013-12-25"
    string(10) "2013-12-26"

- Exemple #2

Obtenir la date d'après demain (+2 jours) localisée (un utilisateur utilisant la
locale `fr_FR`) :

    [php]
    var_dump($doc->getDate(2, "", "", true));

Résultat :

    [php]
    string(10) "25/12/2013"

- Exemple #3

Compensation en heures et minutes :

    [php]
    /*
     * Aujourd'hui (25/12/2013 14:15) + 10 h 40 min
     */
    var_dump($doc->getDate("", 10, 40, true));

Résultat :

    string(16) "26/12/2013 00:55"

- Exemple #4

Affecter la date du jour à un attribut `date_facturation` de type `date` :

    [php]
    $doc->setAttributeValue(
        \Dcp\AttributeIdentifiers\Facture::date_facturation,
        $doc->getDate()
    );
    $doc->store();

## Notes {#core-ref:3d64b83b-ef2e-4197-8126-f13952458dbb}

Les compensations `daydelta`, `dayhour` et `daymin`sont cumulatives.

## Voir aussi {#core-ref:d2967c55-ebfe-4fab-9dba-19e3eca2d0f9}

- [`Doc::setAttributeValue`][Doc::setAttributeValue]
- PHP [`date`][php_date]

<!-- links -->
[type_date]: #core-ref:7ed5e5fe-2b68-489b-b720-58b3f465f20b
[type_timestamp]: #core-ref:202b3080-ec86-47a6-8fe4-20e4cd5daa25
[Doc::setAttributeValue]: #core-ref:1e766800-b2e1-462b-9793-b0261ede8677
[php_date]: http://docs.php.net/manual/fr/function.date.php
