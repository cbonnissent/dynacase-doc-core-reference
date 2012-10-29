# Propriétés des documents

Les propriétés suivantes sont disponibles pour les documents :


adate
:   Date de dernier accès au document.

allocated
:   <span class="fixme">description</span>

archiveid
:   id de l'archive dans laquelle est contenue ce document.  
    <span class="fixme">Peut-il y avoir une valeur par document de la même lignée ?</span>

atags
:   balises applicatives (Tags positionnés sur le document)  
    <span class="fixme">Ça sert à quoi ?</span>

cdate
:   date de création de la révision.  
    Pour obtenir la date de création de la lignée documentaire, il faut récupérer celle de la révision 0.

classname
:   Classe du document  
    Utilisé seulement pour les cycles de vie.<span class="fixme">Dans ce cas, pourquoi est-ce sur Doc et pas uniquement sur WDoc ?</span>

comment
:   commentaire de révision.
    **Obsolète** (voir Objet DocHisto).<span class="fixme">À supprimer ?</span>

confidential
:   Indique si le document est confidentiel.  
    Dans ce cas, confidential vaut 1.

cvid
:   identifiant du document contrôle de vue associé à ce document.

doctype
:   Type de document :<span class="fixme">Introduire des constantes ?</span>
    
    *   *F* : Normal<span class="fixme">F pour… ?</span>,
    *   *D* : Dossier (D pour Dir),
    *   *S* : Recherche (S pour Search),
    *   *P* : Profil,
    *   *T* : Temporaire,
    *   *Z* : Zombie,
    *   *W* : Cycle de vie (W pour Workflow),
    *   *C* : Famille (C pour Class)
    
    <span class="fixme">À quoi ça sert ?</span>

domainid
:   <span class="fixme">À quoi ça sert ?</span>

dprofid
:   identifiant du profil dynamique associé à ce document.
    <span class="fixme">Je n'ai pas compris la description « Si le document à un profid alors le profid est égale à l'id »</span>

forumid
:   <span class="fixme">À supprimer ?</span>

fromid
:   id de la famille d'appartenance.  
    Pour une famille, fromid référence la famille mère.

icon
:   référence au fichier d'icone.  
    Chemin du fichier<span class="fixme">ou juste le nom?</span>, ou référence d'un fichier du vault.

id
:   identifiant unique du document.  
    Il est calculé automatiquement par la base de données, et n'est valable qu'au sein d'une unique base de données.

initid
:   id du premier document de la lignée documentaire.  
    Il est notamment utile pour les recherches.

ldapdn
:   chemin LDAP dans le cas d'une copie sur un serveur LDAP<span class="fixme">plus de détails sont nécessaires</span>

lmodify
:   Y = Le document a été modifié depuis la dernière révision. L = Révision N-1. N = Document révisé mais non modifié
    <span class="fixme">à réexpliquer avec la notion de lignée documentaire (ce n'est pas clair actuellement)</span>

lockdomainid
:   <span class="fixme">À quoi ça sert ?</span>

locked
:   Indique si le document est vérouillé :
    
    *   Chiffre négatif : Identifiant de l'utilisateur ayant verrouillé le document automatiquement.  
        (Ce verrou est posé lorsqu'un utilisateur clique sur le bouton de modification d'un document, et est supprimé automatiquement lors de la fin de l'édition, à la fermeture du navigateur <span class="fixme">C'est vrai?</span>et par un script lancé toute les nuits).
    *   Chiffre positif : Identifiant de l'utilisateur ayant verrouillé le document verrouillé manuellement.
    *   0 = Pas de verrou.
    *   -1 = Document révisé (figé).

name
:   Nom logique du document.  
    Utilisable au même titre qu'un id, il permet d'avoir une valeur stable entre plusieurs bases de données.

owner
:   Identifiant système de l'utilisateur ayant créé le document.<span class="fixme">valable par révision?</span>

postitid
:   identifiant du document post-it associé (famille *NOTE*)

prelid
:   identifiant du document (dossier) de relation primaire<span class="fixme">ça veut dire quoi ?</span> (généralement le dossier parent)<span class="fixme">et sinon?</span>

profid
:   Identifiant du profil de document.
    
    *   Chiffre négatif : Profil non activé.
    *   Chiffre positif : profil actif
        *   Identique à l'id du document : contrôle dédié.
        *   Vide : Pas de profil.

revdate
:   Date de révision.  
    Pour un document non révisé, date de dernière modification.

revision
:   numéro d'ordre du document dans sa lignée documentaire.

state
:   état du document ou référence à un identifiant de document *état libre*

title
:   Titre du document

usefor
:   type d'utilisation (obsolète)<span class="fixme">À supprimer ?</span>

version
:   libellé de la version : vide par défaut<span class="fixme">À supprimer ?</span>

wid
:   identifiant du document cycle de vie associé à ce document.

Les valeurs par défaut de la plupart de ces attributs peuvent être définies dans la famille au moyen des clés suivantes :

CPROFID
:   Valeur par défaut de la propriété *profid*.  
    Lors de l'import, les vérifications suivantes sont effectuées :
    
    *   Si la famille hérité de dossier, le document référencé doit être de la famille profil de dossier,
    *   Si la famille hérite de recherche, le document référencé doit être de la famille profil de recherche,
    *   Sinon le document référencé doit être de la famille profil de document.
    
    Si la valeur est vide le profil de document par défaut est enlevé.

CVID
:   Valeur par défaut de la propriété *cvid*.  
    Si la valeur est vide le contrôle de vue par défaut est enlevé.

DFLDID
:   identifiant du dossier principal permettant de constituer une arborescence spécifique à la famille .  
    Ce dossier est nécessaire pour manipuler les documents d'une famille depuis  l'application "ONEFAM".  
    Il peut être égal au 'auto', ce qui a pour effet de créer un dossier principal automatiquement.  
    Si cette propriété est déjà renseignée, la nouvelle valeur ne sera pas prise en compte.
    <span class="fixme">Si la valeur est vide, est-ce que ça vide la propriété?</span>

ICON
:   nom du fichier image définissant l'icône de la famille.  
    Cette icône doit être une image de taille 48×48 pixels.  
    Si une icône est déjà présente pour cette famille, elle ne sera pas modifiée.

METHOD
:   Indique le nom du fichier contenant les méthodes supplémentaires de la famille.
    Cette propriété peut être utilisé sur plusieurs lignes, avec la sémantique suivante :
    
    *   Lorsque le nom est préfixé par *+*, son contenu est concaténé directement dans la classe générée ;
    *   Lorsque le nom est préfixé par *, le fichier n'est pas intégré directement dans la famille, mais une classe intermédiaire est générée. Cela permet notamment de surcharger les méthodes ultérieurement.
    
    Si la valeur est vide les méthodes associées seront enlevées.

PROFID
:   identifiant du document profil de famille pour cette famille.
    Lors de l'import, les vérifications suivantes sont effectuées :
    
    *   Ce document doit être de la famille 'profil de famille'.
    
    Si la valeur est vide le profil de famille est enlevé.

SCHAR
:   Indique les modalités de révision des documents de cette famille :<span class="fixme">n'est-ce pas aussi une propriété de document?</span>
    
    *   *R* : Révision automatique à chaque modification,
    *   *S* : document non révisable 
    
    Si la valeur est vide la caractéristique spéciale par défaut est enlevée.

TAG
:   Initialise les valeurs de la propriété *atags*  
    Chaque utilisation de la balise TAG ajoutera une valeur à la propriété *atags*  
    Les tags applicatifs ne peuvent être supprimés par cette cette directive.

TYPE
:   valeur par défaut de la propriété *type*  
    Si la valeur est vide, le type inféré est *C*.

USEFOR
:   Caractère désignant une utilisation spéciale. Seulement pour les documents systèmes : 
    
    *   *W* : pour les cycles de vie 
    *   *G* : pour les intercalaires de chemise 
    *   *P* : pour les profils 
    
    Si la valeur est vide l'utilisation spéciale par défaut est enlevée.

WID
:   Valeur par défaut de la propriété *wid*.  
    Si la valeur est vide le cycle par défaut est enlevé.
