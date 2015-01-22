# Transactions et savePoint  {#core-ref:32e0a8cb-0e8b-4f77-a62d-a45da16d39a8}

Des [transactions][transactionSQL] et des points de sauvegarde de base de donnés
peuvent être utilisés afin de [confirmer][commitSQL] ou de
[revenir][RollbackSQL] à un point de sauvegarde. 


Ces transactions n'ont aucun
effet sur l'objet mémoire manipulé.


Les méthodes `DbObj::savePoint()`, `DbObj::rollbackPoint()` et
`DbObj::commitPoint()` permettent de gérer les transactions et les points de
retours.

Ces méthodes utilisent, les fonctions [`savepoint`][savepoint],
[`rollback to savepoint`][rollback], [`release savepoint`][release] de Postgresql.

La méthode `savePoint()` ouvre automatiquement une transaction  (`BEGIN`), si
celle-ci n'est pas encore ouverte. Les méthodes `rollbackPoint()` et
`commitPoint()` ferment la transaction si le point de sauvegarde est le premier
des points posés.

Les points de sauvegarde ne sont pas liés à un objet mais impactent **toutes les
requêtes** utilisant la même ressource de connexion à la base. Dynacase n'ouvre
qu'une seule ressource de connexion, par conséquent toutes les requêtes
utilisant l'api sont impactées ([Doc::store()][docstore],
[simpleQuery][simplequery], DbObj::modify(), ...).

Lorqu'un premier *savePoint* est déclaré, il faut **obligatoirement** avoir un
`commitPoint` ou un `rollbackPoint` du premier point. Dans le cas contraire
toutes les modifications sur la base de données, depuis le premier point de
sauvegarde, sont abandonnées.


Les méthodes de point de sauvegarde sont accessibles depuis tout objet héritant
de `DbObj` notamment les classes [Doc][doc] et [Action][action].


## savePoint() {#core-ref:ec130ebd-ad78-40ea-9fa3-3b9ec076caa1}


    string savePoint(string $point)


Cette méthode ouvre une transaction ([`BEGIN`][begin]) si une transaction n'est
pas déjà en cours. 

Elle ajoute un point de sauvegarde avec l'identifiant donné en paramètre.

Elle retourne une erreur (erreur donnée par postgresSql) si le point de
sauvegarde n'a pas pu être posé.

Note : Comme indiqué dans la [documentation de postgresql][savepoint], si le
même nom est utilisé, l'index du point de sauvegarde est déplacé.


## commitPoint() {#core-ref:0bc23a2a-0266-4323-8b72-07276f118c3a}

    string commitPoint(string $point)

Cette méthode [libère][release] le point de sauvegarde de l'identifiant donné en
paramètre.

Si le point de sauvegarde est le premier point alors la transaction est
confirmée ([`COMMIT`][commit]);

Elle retourne une erreur si le point de sauvegarde n'a pas été posé au préalable.


## rollbackPoint() {#core-ref:6e33c983-90dd-42e1-8f9a-d249d504225b}


    string rollbackPoint(string $point)

Cette méthode [retourne][rollback] au point de sauvegarde de l'identifiant donné
en paramètre.

Si le point de sauvegarde est le premier point alors la transaction est
abandonnée (`ROLLBACK`);

Elle retourne une erreur si le point de sauvegarde n'a pas été posé au préalable.

**Attention** : les documents en mémoires et ceux dans le cache ne sont pas affectés par cette méthode.
Il est conseillé de les ré-initialiser et de vider le cache après utilisation de cette méthode via la 
méthode `clearCacheDoc`.

## lockPoint() Verrouillage de la transaction  {#core-ref:14fd71fa-1944-4016-80ab-6616e3423ce7}


    string lockPoint(   int $exclusiveLock , 
                     string $exclusiveLockPrefix = '')

<span class="flag from release inline">3.2.18</span> La méthode `lockPoint`
indique que la transaction devient exclusive. Un [verrou][pgadlock]
([pg_advisory_xact_lock][pgxactadlock]) est posé sur ce point et un autre
processus doit attendre sur ce même point que les données liées à la transaction
soient enregistrées sur la base de données. Les paramètres `exclusiveLock` et
`exclusiveLockPrefix` sont les conditions d'acquisition du verrou. Le paramètre
`exclusiveLock` identifie une ressource (forme numérique) et le paramètre
`exclusiveLockPrefix` indique un contexte (chaîne limitée à 4 caractères).

L'appel de cette méthode doit obligatoirement être fait dans une transaction
`savePoint`. Dans la cas contraire, une exception de type `Dcp\Db\Exception` est
levée.

Le verrou est enlevé lors de la fin de la transaction, c'est à dire lors du
commit ou du rollback du premier point.

Ce verrou joue le rôle d'un [sémaphore][semaphore], il bloque l'accès concurrent
à une même portion de code.

Exemple :

    [php]
    $document=new_doc("", 1234);
    $action->savePoint("myUpdate", $document->initid, "MyUp");
    $action->lockPoint($document->initid, "MyUp");
    // Un seul processus peut exécuter cette partie pour ce document
    $document->setValue("my_reference", 234);
    $document->myRecomputeCriticalRelation();
    
    $action->commitPoint("myUpdate");
    // Le verrou est relaché s'il s'agit du commit du premier save point



## setMasterLock() {#core-ref:ab9d412c-75fc-4ee3-89a8-9e87ad673eef}

    string setMasterLock($useLock)

<span class="flag from release inline">3.2.18</span> Le but de cette méthode est
d'éviter un nombre important de verrou applicatif. Chaque verrou consomme
environ 200 octets de mémoire partagée et la limite
[`max_locks_per_transaction`][pglockconfig] indiqués par postgresql impose que
le nombre de verrous soit maîtrisé.

La méthode setMasterLock pose un verrou maître (pg_advisory_lock) et non un
"pg_advisory_xact_lock" comme pour le `lockPoint`. Ce verrou inhibe la pose des
verrous activés par l'appel à la méthode `lockPoint` pour le processus ayant
posé le verrou maître. Tous les verrous posés par la méthode `lockPoint` des
autres processus sont bloqués (en attente de la libération du verrou maître). Le
verrou maître doit être débloqué par l'appel à la méthode setMasterLock avec en
paramètre "false".

Exemple de code possible:

    [php]
    $action->setMasterLock(true); // Activation du verrou - ou attente s'il est posé par un autre processus
    for ($i=0;$i<10000;$i++) {
     $action->lockPoint($i,"TST"); // pas de pose réelle de lock pour le processus ayant acquis le verrou maître
             // Mais blocage pour les autres processus qui demande un verrou
    }
    $action->setMasterLock(false); // Désactivation du verrou


Dynacase Core n'utilise pas ce verrou dans son code.

## Exemples {#core-ref:7e7d0d8e-a723-4e19-9cb2-03edca023b93}

### Annulation d'une requête intermédiaire {#core-ref:28da1c12-6066-4019-ae37-d9dfb7329e5e}


    [php]
    include_once("FDL/Class.Doc.php");
    $document = new_doc("",8160); // Doc dérive de DbObj
    $document->savePoint("One");
    $document->setValue("us_lname","Test one");
    $document->store();  // modification en base doc n°8160 à comme nom "Test One"
    
    $document->savePoint("Two");
    $document->setValue("us_lname","Test two");
    $document->store();// modification en base doc n°8160 à comme nom "Test Two"
    $document->rollbackPoint("Two"); // annulation de toutes les requêtes depuis le point "Two"
    
    $document->commitPoint("One"); // acquittement des requêtes depuis le point "One"
    // le document en BdD a maintenant comme nom "Test One"
    // ATTENTION : le document conserve en mémoire sa dernière valeur "Test two".

### Avec plusieurs documents {#core-ref:3b5dbe4c-0063-4131-a63f-b5f819b69b52}

    [php]
    include_once("FDL/Class.Doc.php");
    
    $document1 = new_doc("",8160); // Doc dérive de DbObj
    $document1->savePoint("One");
    $document1->setValue("first_title","Test one");
    $document1->store();  // modification en base doc n°8160 à comme nom "Test One"
    
    $document2 = new_doc("",6829); 
    $document2->savePoint("two");
    $document2->setValue("second_title","Test two");
    $document2->store();// modification en base doc n°6829 à comme nom "Test Two"
    
    $document3 = new_doc("",9345); 
    $document3->setValue("third_title","Test three");
    $document3->store();// modification en base doc n°9345 à comme nom "Test three"
    
    $document1->rollbackPoint("Two"); // annulation de toutes les requêtes depuis le point "Two"
    $document1->commitPoint("One"); // acquittement des requêtes depuis le point "One"
    
    // le document1 en BdD a maintenant comme nom "Test One"
    // les document2 et document3 n'ont pas été modifiés

Note : Comme indiqué précédemment, ces méthodes ne sont pas liées à l'objet. Le
même exemple peut être écrit en utilisant l'action courante ce qui rend moins
ambiguë la portée de cette méthode.

    [php]
    include_once("FDL/Class.Doc.php");
    
    $action->savePoint("One"); // Premier point
    $document1 = new_doc("",8160); // Doc dérive de DbObj
    $document1->setValue("first_title","Test one");
    $document1->store();  // modification en base doc n°8160 à comme nom "Test One"
    
    $action->savePoint("Two");// Second point
    $document2 = new_doc("",6829); 
    $document2->setValue("second_title","Test two");
    $document2->store();// modification en base doc n°6829 à comme nom "Test Two"
    
    $document3 = new_doc("",9345); 
    $document3->setValue("third_title","Test three");
    $document3->store();// modification en base doc n°9345 à comme nom "Test three"
    
    $action->rollbackPoint("Two"); // annulation de toutes les requêtes depuis le point "Two"
    $action->commitPoint("One"); // acquittement des requêtes depuis le point "One"
    
    // le document1 en BD a maintenant comme nom "Test One"
    // les document2 et document3 n'ont pas été modifiés



### Confirmation du point d'entrée initial {#core-ref:9ad8e5bf-de48-4019-b68e-fbcac33a0869}

Néanmoins, il n'est pas obligatoire d'appliquer un *commit* ou un *rollback* sur
tous les points, mais il est obligatoire de le faire au moins sur le premier.

    [php]
    $document->savePoint("One");
    $document->setValue("us_lname","Test one");
    $document->store();
    
    $document->savePoint("Two");
    $document->setValue("us_lname","Test two");
    $document->store();
    
    $document->savePoint("Three");
    $document->setValue("us_lname","Test three");
    $document->store();
    $document->rollbackPoint("Two"); // on retourne au point Two, le point Three est effacé
    
    $document->commitPoint("One"); // on confirme le point One, le point Two est effacé


le document a maintenant comme nom "Test One" 

## Avertissements {#core-ref:827fe5e2-8101-4386-89c7-02d8ae2aadfb}

### Importation de documents {#core-ref:966aa1ba-3358-43bb-aad0-35ca449801c9}

Ce mécanisme est utilisé lors de l'importation de documents afin d'annuler
l'ensemble de l'importation lorsqu'une erreur est détectée.  Les [hameçons (hooks)
utilisés][hookimport] lors de l'importation sont donc exécutés dans une transaction.

### Modification de profil dynamique {#core-ref:857d8b9b-c22f-4f78-a3f4-5cd52aa2c8ae}

Lorqu'un profil dynamique est modifié, tous les documents liés à ce profil ont
leurs permissions recalculées.

Chacun calcul de permission est effectuée dans une transaction avec un verrou
afin d'interdire la modification simultanée de permission pour un même document.

Si ce calcul de permission est fait dans une transaction déjà mise en place, la
table [`docperm`][docperm] est verrouillée et les locks unitaires des
permissions ne sont pas activés afin d'éviter de dépasser le nombre maximum de
verrous imposé par postgresql. Dans ce cas précis, toutes les demandes de
modification de permission sont mises en attente le temps de la transaction.

### Interblocage {#core-ref:2d9e78e6-14a9-4d17-bb48-f22f2c89e9d3}

L'utilisation des verrous peut engendrer des problèmes d'[interblocage][mutext]
(deadlock). Il est nécessaire d'être familier avec le système de sémaphores afin
de minimiser le risque d'interblocage. Si toutefois un interblocage survient, une
des deux connexions *Postgresql* est tuée par le serveur de base de données.

Exemple minimaliste de 2 programmes lancés en parallèle pouvant aboutir à un
interblocage.

Programme 1 :

    [php]
    $document1 = new_doc("",8160); 
    $document->savePoint("One");
    $document->lockPoint(32,"my");
    $document->setValue("my_title","Test one"); // ICI POSSIBLE SECTION INTERBLOQUE
    $document->store();
    $document->lockPoint(45,"my"); // Bloqué par processus 2
    $document->commitPoint("One");


Programme 2 :

    [php]
    $document1 = new_doc("",8162);
    $document->savePoint("Two");
    $document->lockPoint(45,"my");
    $document->setValue("my_title","Test two"); // ICI POSSIBLE SECTION INTERBLOQUE
    $document->store();
    $document->lockPoint(32,"my"); // Bloqué par processus 1
    $document->commitPoint("Two");




## Points de sauvegarde utilisée par le système {#core-ref:c9df3e8e-b9f0-4664-a95e-4bef50b98502}

Les points de sauvegarde des méthodes ci-dessus sont libérés à la fin de la
méthode elle-même.

|               Méthode               |                                      Contexte d'utilisation                                     |      Composition de la clef      |  Composition du verrou  |
| ----------------------------------- | ----------------------------------------------------------------------------------------------- | -------------------------------- | ----------------------- |
| Doc::convert()                      | Conversion d'un document d'une famille vers une autre famille                                   | `"dcp:convert" + Doc::id`        | Pas de verrou           |
| Doc::revise()                       | Révision de document / Changement d'état                                                        | `"dcp:revise" + Doc::id`         | Pas de verrou           |
| Doc::updateVaultIndex()             | Enregistrement de nouveaux fichiers dans le document                                            | `uniqid("dcp:updateVaultIndex")` | `Doc::initid`, `"UPVI"` |
| DocCtrl::computeDProfil()           | Enregistrement d'un document ayant un profil dynamique                                          | `uniqid("dcp:docperm")`          | `Doc::initid`, `"PERM"` |
| DocRel::initRelations()             | Enregistrement d'un document ayant des relations modifiées                                      | `uniqid("dcp:initrelation")`     | `Doc::initid`, `"IREL"` |
| UpdateAttribute::beginTransaction() | Mise à jour par lot d'attribut de document avec option de transaction                           | `"dcp:updateattr"`               | Pas de verrou           |
| ImportDocuments::importDocuments    | Importation d'une liste de document en mode strict (annulation si une erreur détectée)          | `"dcp:importDocument"`           | Pas de verrou           |
| DetailSearch::isValidPgRegex        | Vérification des critères de recherche lors de l'enregistrement d'une recherche ou d'un rapport | `"dcp:isValidPgRegex"`           | Pas de verrou           |


<!-- links -->

[transactionSQL]:       https://fr.wikipedia.org/wiki/Transaction_(base_de_donn%C3%A9es) "Wikipedia : Transaction"
[commitSQL]:            https://fr.wikipedia.org/wiki/Commit "Wikipedia : Commit"
[RollbackSQL]:          https://fr.wikipedia.org/wiki/Rollback_(base_de_donn%C3%A9es) "Wikipedia : Rollback"
[savepoint]:            http://www.postgresql.org/docs/9.3/static/sql-savepoint.html "Postgresql : Savepoint"
[simplequery]:          #core-ref:db34809e-c566-4a80-8b72-dc185c9de9e2
[docstore]:             #core-ref:b8540d13-ece6-4e9e-9b72-6a56bca9da12
[action]:               #core-ref:29553eba-bcea-4baf-bef8-103c3a3510fa
[doc]:                  #core-ref:1d557fb4-4eca-4ab8-a334-974fe563ddd2
[begin]:                http://www.postgresql.org/docs/9.3/static/sql-begin.html "Postgresql : Begin"
[rollback]:             http://www.postgresql.org/docs/9.3/static/sql-rollback-to.html "Postgresql : Rollback to"
[release]:              http://www.postgresql.org/docs/9.3/static/sql-release-savepoint.html "Postgresql : Release savepoint"
[hookimport]:           #core-ref:d3b06745-35c5-447c-9b88-01181736c21e
[commit]:               http://www.postgresql.org/docs/9.3/static/sql-commit.html "Postgresql : Commit"
[pgadlock]:             http://www.postgresql.org/docs/9.3/static/explicit-locking.html#ADVISORY-LOCKS "Postgresql Advisory locks"
[pgxactadlock]:         http://www.postgresql.org/docs/9.3/static/functions-admin.html#FUNCTIONS-ADVISORY-LOCKS-TABLE "Postgresql Transaction Advisory locks"
[mutext]:               http://fr.wikipedia.org/wiki/Exclusion_mutuelle "Wikipédia : Exclusion mutuelle"
[pglockconfig]:         http://www.postgresql.org/docs/9.3/static/runtime-config-locks.html "Postgresql : Configuration des verrous"
[docperm]:              #core-ref:5cf15b7a-e8c8-4ec8-a3b8-2e676b6be349
[semaphore]:            http://fr.wikipedia.org/wiki/S%C3%A9maphore_%28informatique%29 "Wikipédia : Sémaphore"