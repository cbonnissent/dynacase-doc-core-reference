# Manipulation des classes DbObj {#core-ref:7a62bb83-17a0-478d-a853-bc359d0fb8fb}

Ce chapitre a pour but de montrer par l'utilisation les méthodes et fonctions
les plus courantes de manipulations des objets provenant des classes DbObj
(Database Object) telles que [DocHisto][dbhisto], DocLog, [Account][dbaccount].

La classe DbObj est la base du système de persistance de données de Dynacase. Cette
classe fourni des méthodes pour faire les opérations basiques de manipulations 
de données ([CRUD][wikiCRUD]).

## CREATE : Création d'un objet {#core-ref:28379dfc-7f6d-450f-b994-834d4fba7452}

La méthode `DbObj::add()` permet de créer une nouvelle entrée dans la table.

Exemple d'ajout d'une entrée dans la table [`dochisto`][dbhisto].
La table `dochisto` a comme `id_fields` l'attribut `id` uniquement.

    [php]
    $h = new DocHisto($this->dbaccess);
    
    $h->id = 1009
    $h->initid = 1009
    
    $h->comment = "Hello world";
    $h->date = date("d-m-Y H:i:s");
    $h->uname = sprintf("%s %s", $action->user->firstname, $action->user->lastname);
    $h->uid = $action->user->id;
    
    $h->level = DocHisto::INFO;
    $h->code = 'TESTING';
    
    $err = $h->add();

La méthode `DbObj::add()` retourne un message d'erreur en cas d'échec. Cette
méthode appelle les hameçons (hook) `DbObj::preInsert()` et
`DbObj::postInsert()`. La méthode `DbObj::preInsert()` abandonne la création si
elle retourne un message d'erreur.

## READ : Récupération d'un objet {#core-ref:1a5b341f-840a-4708-907f-a4424a467ffd}

Les objets sont identifiés par les champs référencés par l'attribut `id_fields`.
Le constructeur attend des valeurs référencées par cet attribut. Si cet attribut
est un tableau de plusieurs champs alors il faut indiquer l'ensemble des champs
référencés. Les références ne sont pas toujours des clefs uniques pour les
objets de la classe.

    [php]
    //premier histo du document n°1004
    $histo=new DocHisto("",1004);
    
    // premier log du document n°1004
    $log=new DocLog("",10);
    
    // permissions du document 1004 pour l'utilisateur 14 (identifiant système)
    $perm=new DocPerm("",array(1004,14));
    
    // caractéristiques de l'utilisateur n°1 (admin).
    $user=new Account("",1);

Pour savoir si l'objet a été récupéré depuis la base de données (si la référence
existe), il faut utiliser la méthode ::isAffected().

    [php]
    $user=new Account("",1);
    if ($user->isAffected()) {
      print_r($user->getValues()); // on affiche toutes les valeurs de l'objet
      print $user->login; // on affiche un des attributs de l'objet
    }

L'accès à un des attributs de l'objet se fait directement en utilisant le nom de
l'attribut.

## UPDATE : Mise à jour d'un d'un objet {#core-ref:1a5b341f-840a-4708-907f-a4424a467ffd}

La mise à jour d'un objet se fait à l'aide de la méthode `DbObj::modify()`. 
Avant d'effectuer cette méthode, il faut vérifier que l'objet récupéré existe
réellement à l'aide de la méthode `DbObj::isAffected()`

    [php]
    $user=new Account("",1);
    if ($user->isAffected()) {
      $user->firstName = "McClane";
      $user->modify();
    }

La méthode `DbObj::modify()` retourne un message d'erreur en cas d'échec. Cette
méthode appelle les hameçons (hook) `DbObj::preUpdate()` et
`DbObj::postUpdate()`. La méthode `DbObj::preUpdate()` abandonne la mise à jour
si elle retourne un message d'erreur.

## DELETE : Suppression d'un objet {#core-ref:31c5032e-2e5c-4bbc-bd21-33a3addbbe96}

La méthode `DbObj::delete()` permet de supprimer toutes les entrées
correspondant aux champs `id_fields`. Si les champs `id_fields` correspondent à
une clef unique, une seule entrée sera supprimée. 

Exemple d'ajout d'une entrée dans la table [`dochisto`][dbhisto].

    [php]
    $h = new DocHisto($this->dbaccess, 1009);
    
    if ($h->isAffected()) {
        // suppression de toutes les entrées dont "dochisto.id=1009"
        $err = $h->delete();
    }

La méthode `DbObj::delete()` retourne un message d'erreur en cas d'échec. Cette
méthode appelle les hameçons (hook) `DbObj::preDelete()` et
`DbObj::postDelete()`. La méthode `DbObj::preDelete()` abonne la suppression si
elle retourne un message d'erreur.

<!-- links -->

[dbaccount]:        #core-ref:6d5684f4-73e8-431c-8b2b-6224a9e6b074 "Table users"
[dbhisto]:          #core-ref:dc380a30-61b1-4a51-997b-6a3e8f5e1fed "Table dochisto"
[wikiCRUD]:         https://fr.wikipedia.org/wiki/CRUD "Wikipedia CRUD"