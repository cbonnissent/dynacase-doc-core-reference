# Importations de comptes

L'importation de groupes, d'utilisateurs et de rôles est effectuée à l'aide d'un fichier d'importation `CSV` (texte séparé par des point-virgules) ou `ODS` comme pour les [importations de documents](#core-ref:2fb3284a-2424-44b2-93ae-41dc3969e093) en général. 

## Importation d'utilisateurs


La création de compte utilisateur nécessite les 6 informations suivantes :

- le nom `us_lname`
- le prénom `us_fname`
- le login `us_login`
- le mot de passe `us_passwd1` et `us_passwd2`. Les deux mots de passe doivent être identiques.
- le mail `us_extmail` facultatif, mais nécessaire pour récupérer son mot de passe oublié.

<table>
  <thead>
    <tr><th>#</th><th>IUSER</th><th >Identifiant</th><th >Groupe</th><th>login</th><th>prénom</th><th>nom</th><th>mot de passe</th><th>confirmation</th><th>adresse mail</th></tr>
    <tr><th>ORDER</th><th>IUSER</th><th /><th /><th>us_login</th><th>us_fname</th><th>us_lname</th><th>us_passwd1</th><th>us_passwd2</th><th>us_extmail</th></tr>
  </thead>
  <tbody>
    <tr><td>DOC</td><td>IUSER</td><td>&nbsp;</td><td>&nbsp;</td><td>robert.martin</td><td>Robert</td><td>Martin</td><td>secret</td><td>secret</td><td>roby@somewhere.net</td></tr>
    <tr><td>DOC</td><td>IUSER</td><td>&nbsp;</td><td>&nbsp;</td><td>isabelle.dujardin</td><td>Isabelle</td><td>Dujardin</td><td>secret</td><td>secret</td><td>isa@somewhere.net</td></tr>
  </tbody>
  </table>
  
## Importation de groupes
La création de groupes nécessite les 2 informations suivantes :

- le nom `grp_name`
- la référence `us_login`

<table>
  <thead>
    <tr><th>#</th><th>IGROUP</th><th >Identifiant</th><th >Groupe</th><th>nom</th><th>référence</th></tr>
    <tr><th>ORDER</th><th>IGROUP</th><th /><th /><th>grp_name</th><th>us_login</th></tr>
  </thead>
  <tbody>
    <tr><td>DOC</td><td>IGROUP</td><td>&nbsp;</td><td>&nbsp;</td><td>Laboratoire recherche</td><td>labord</td></tr>
    <tr><td>DOC</td><td>IGROUP</td><td>&nbsp;</td><td>&nbsp;</td><td>Comité d'entreprise</td><td>ce</td></tr>
  </tbody>
  </table>

## Importations de rôles
La création de groupes nécessite les 2 informations suivantes :

- le nom `role_name`
- la référence `role_login`

<table>
  <thead>
    <tr><th>#</th><th>ROLE</th><th >Identifiant</th><th >Groupe</th><th>nom</th><th>référence</th></tr>
    <tr><th>ORDER</th><th>ROLE</th><th /><th /><th>role_name</th><th>role_login</th></tr>
  </thead>
  <tbody>
    <tr><td>DOC</td><td>ROLE</td><td>&nbsp;</td><td>&nbsp;</td><td>Concepteurs</td><td>designers</td></tr>
    <tr><td>DOC</td><td>ROLE</td><td>&nbsp;</td><td>&nbsp;</td><td>Conducteurs</td><td>drivers</td></tr>
  </tbody>
  </table>

**Note** : Le rôle ne peut pas être inséré dans un groupe.

## Affectation de groupes par importation

L'affectation de groupes se fait en indiquant l'identifiant du groupe dans la colonne n°2 ("Identifiant") du fichier.

Il est nécessaire d'ajouter des identifiants documentaires (_nom logique_) aux groupes afin de les utiliser dans le colonne _"Identifiant"_.

Dans l'exemple suivant, l'utilisateur "Robert Martin" sera inséré dans le groupe "Laboratoire de recherche" et l'utilisatrice "Isabelle Dujardin sera dans les groupes "Laboratoire de recherche" et "Comité d'entreprise". Afin d'identifier un utilisateur, le login est suffisant. C'est pour cette raison que les autres informations ne sont pas répétées lors de l'affectation du deuxième groupe à "Isabelle Dujardin".

<table>
   <thead>
    <tr><th>#</th><th>IGROUP</th><th >Identifiant</th><th >Groupe</th><th>nom</th><th>référence</th><th colspan="4" /></tr>
    <tr><th>ORDER</th><th>IGROUP</th><th /><th /><th>grp_name</th><th>us_login</th><th colspan="4" /></tr>
  </thead>
  <tbody>
    <tr><td>DOC</td><td>IGROUP</td><td>GRP_LABORECHERCHE</td><td>&nbsp;</td><td>Laboratoire de recherche</td><td>labord</td><td colspan="4" /></tr>
    <tr><td>DOC</td><td>IGROUP</td><td>GRP_CE</td><td>&nbsp;</td><td>Comité d'entreprise</td><td>ce</td><td colspan="4" /></tr>
  </tbody>
   <thead>
    <tr><th>#</th><th>IUSER</th><th >Identifiant</th><th >Groupe</th><th>login</th><th>prénom</th><th>nom</th><th>mot de passe</th><th>confirmation</th><th>adresse mail</th></tr>
    <tr><th>ORDER</th><th>IUSER</th><th /><th /><th>us_login</th><th>us_fname</th><th>us_lname</th><th>us_passwd1</th><th>us_passwd2</th><th>us_extmail</th></tr>
  </thead>
  <tbody>
    <tr><td>DOC</td><td>IUSER</td><td>&nbsp;</td><td>GRP_LABORECHERCHE</td><td>robert.martin</td><td>Robert</td><td>Martin</td><td>secret</td><td>secret</td><td>roby@somewhere.net</td></tr>
    <tr><td>DOC</td><td>IUSER</td><td>&nbsp;</td><td>GRP_CE</td><td>isabelle.dujardin</td><td>Isabelle</td><td>Dujardin</td><td>secret</td><td>secret</td><td>isa@somewhere.net</td></tr>
    <tr><td>DOC</td><td>IUSER</td><td>&nbsp;</td><td>GRP_LABORECHERCHE</td><td>isabelle.dujardin</td><td></td><td></td><td></td><td></td><td></td></tr>
  </tbody>
  </table>
  
## Affectation de rôles par importation

L'affectation de rôle à un utilisateur est fait avec l'attribut `us_roles`. L'association de rôle à un groupe est fait avec l'attribut `grp_roles`. Ces deux attributs sont multivalués et ils peuvent contenir plusieurs références séparé par les deux caractères `\n`.

Dans l'exemple suivant, "Robert Martin" aura les rôles "Concepteurs" et "Conducteur" car il appartient au groupe "Laboratoire annexe" qui est un sous-groupe de "Laboratoire de recherche". "Isabelle Dujardin" aura les rôles "Concepteur" et "Conducteur" car elle appartient au groupe "Laboratoire de recherche" et "Chimiste" car ce rôle est explicitement indiqué dans l'attribut `us_roles`.
<table> 
  <thead>
    <tr><th>#</th><th>ROLE</th><th >Identifiant</th><th >Groupe</th><th>nom</th><th>référence</th><th colspan="4" /></tr>
    <tr><th>ORDER</th><th>ROLE</th><th /><th /><th>role_name</th><th>role_login</th><th colspan="4" /></tr>
  </thead>
  <tbody>
    <tr><td>DOC</td><td>ROLE</td><td>ROLE_DESIGN</td><td></td><td>Concepteurs</td><td>designers</td><td colspan="4" /></tr>
    <tr><td>DOC</td><td>ROLE</td><td>ROLE_DRIVE</td><td></td><td>Conducteurs</td><td>drivers</td><td colspan="4" /></tr>
    <tr><td>DOC</td><td>ROLE</td><td>ROLE_CHEMIST</td><td></td><td>Chimiste</td><td>chemist</td><td colspan="4" /></tr>
  </tbody>
   <thead>
    <tr><th>#</th><th>IGROUP</th><th >Identifiant</th><th >Groupe</th><th>nom</th><th>référence</th><th>roles</th><th colspan="3" /></tr>
    <tr><th>ORDER</th><th>IGROUP</th><th /><th /><th>grp_name</th><th>us_login</th><th>grp_roles</th><th colspan="4" /></tr>
  </thead>
  <tbody>
    <tr><td>DOC</td><td>IGROUP</td>
        <td>GRP_LABORECHERCHE</td><td>&nbsp;</td>
        <td>Laboratoire de recherche</td><td>labord</td>
        <td>ROLE_DESIGN\nROLE_DRIVE</td><td colspan="4" /></tr>
    <tr><td>DOC</td><td>IGROUP</td>
        <td>GRP_CE</td><td>&nbsp;</td><td>Comité d'entreprise</td><td>ce</td>
        <td>ROLE_DESIGN</td><td colspan="4" /></tr>
    <tr><td>DOC</td><td>IGROUP</td>
        <td>GRP_LABOANX</td><td>GRP_LABORECHERCHE</td><td>Recherches annexes</td><td>anx</td>
        <td></td><td colspan="4" /></tr>
  </tbody>
  </table>
  <table>
   <thead>
    <tr><th>#</th><th>IUSER</th><th >Identifiant</th><th >Groupe</th><th>login</th><th>prénom</th><th>nom</th><th>mot de passe</th><th>confirmation</th><th>adresse mail</th><th>rôles</th></tr>
    <tr><th>ORDER</th><th>IUSER</th><th /><th /><th>us_login</th><th>us_fname</th><th>us_lname</th><th>us_passwd1</th><th>us_passwd2</th><th>us_extmail</th><th>us_roles</th></tr>
  </thead>
  <tbody>
    <tr><td>DOC</td><td>IUSER</td><td>&nbsp;</td><td>GRP_LABOANX</td><td>robert.martin</td><td>Robert</td><td>Martin</td><td>secret</td><td>secret</td><td>roby@somewhere.net</td></tr>
    <tr><td>DOC</td><td>IUSER</td><td>&nbsp;</td><td>GRP_CE</td><td>isabelle.dujardin</td><td>Isabelle</td><td>Dujardin</td><td>secret</td><td>secret</td><td>isa@somewhere.net</td><td>ROLE_CHEMIST</td></tr>
    <tr><td>DOC</td><td>IUSER</td><td>&nbsp;</td><td>GRP_LABORECHERCHE</td><td>isabelle.dujardin</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
  </tbody>
  </table>
