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

Exemple :

    [php]
    $document=new_doc("", 1234);
    $document->savePoint("myUpdate", $document->initid, "MyUp");
    $document->lockPoint($document->initid, "MyUp");
    // Un seul processus peut exécuter cette partie pour ce document
    $document->setValue("my_reference", 234);
    $document->myRecomputeCriticalRelation();
    
    $document->commitPoint("myUpdate");
    // Le verrou est relaché s'il s'agit du commit du premier save point


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

### Importation de documents

Ce mécanisme est utilisé lors de l'importation de documents afin d'annuler
l'ensemble de l'importation lorsqu'une erreur est détectée.  Les [hameçons (hooks)
utilisés][hookimport] lors de l'importation sont donc exécutés dans une transaction.

### Interblocage

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




## Points de sauvegarde utilisée par le système

Les points de sauvegarde des méthodes ci-dessus sont libérés à la fin de la
méthode elle-même.

|               Méthode               |                                      Contexte d'utilisation                                     |    Composition de la clef    |  Composition du verrou  |
| ----------------------------------- | ----------------------------------------------------------------------------------------------- | ---------------------------- | ----------------------- |
| Doc::convert()                      | Conversion d'un document d'une famille vers une autre famille                                   | `"convert" + Doc::id`        | Pas de verrou           |
| Doc::revise()                       | Révision de document / Changement d'état                                                        | `"revise" + Doc::id`         | Pas de verrou           |
| Doc::updateVaultIndex()             | Enregistrement de nouveaux fichiers dans le document                                            | `uniqid("updateVaultIndex")` | `Doc::initid`, `"UPVI"` |
| DocCtrl::computeDProfil()           | Enregistrement d'un document ayant un profil dynamique                                          | `uniqid("docperm")`          | `Doc::initid`, `"PERM"` |
| DocRel::initRelations()             | Enregistrement d'un document ayant des relations modifiées                                      | `uniqid("initrelation")`     | `Doc::initid`, `"IREL"` |
| UpdateAttribute::beginTransaction() | Mise à jour par lot d'attribut de document avec option de transaction                           | `"UPDATEATTR"`               | Pas de verrou           |
| ImportDocuments::importDocuments    | Importation d'une liste de document en mode strict (annulation si une erreur détectée)          | `"importDocument"`           | Pas de verrou           |
| DetailSearch::isValidPgRegex        | Vérification des critères de recherche lors de l'enregistrement d'une recherche ou d'un rapport | `"isValidPgRegex"`           | Pas de verrou           |


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