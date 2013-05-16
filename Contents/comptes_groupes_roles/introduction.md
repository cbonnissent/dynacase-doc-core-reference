# Utilisateurs, groupes et rôles {#core-ref:2bd98eec-5b03-4af0-b9d6-1bbf78fe9733}
 
## Présentation des comptes

Le terme _"compte"_ regroupe les termes _utilisateur_, _groupe_ et _rôle_. 

Les comptes possèdent deux aspects. Un aspect **_système_** et un aspect **_document_**. L'aspect _système_ traite de toutes les manipulations internes de comptes comme l'affectation de rôle, de groupe. C'est cet aspect _système_ qui est utilisé pour tout ce qui concerne le [profilage de document](#core-ref:ce576351-dbe6-45d1-8097-f9573502b651) et les [accessibilités des actions](#core-ref:a98b72ea-c063-4907-abc4-e5171ab55e59). Cet aspect _système_ sera traité dans le chapitre <span class="fixme" data-assignedto="MCO">Ajouter le lien vers le chapitre de la classe Account</span>

Ce chapitre concerne l'aspect _document_ des comptes. Cet aspect sert principalement d'interface pour manipuler le côté _système_ des comptes.

La gestion des utilisateurs peut être faite avec le _centre d'administration_. L'application _gestion des utilisateurs_ permet de gérer les rôles, groupes et utilisateurs.

### Vocabulaire

`Utilisateur`
: Un document `utilisateur` regroupe les informations permettant à une personne de se connecter sur l'interface web de Dynacase. Par extension, un `utilisateur` est une personne qui peut se connecter à Dynacase. La famille décrivant les utilisateurs est **`IUSER`**.

`Groupe`
: Un document `groupe d'utilisateurs` est un container qui permet de contenir un ensemble d'utilisateurs ou de groupe d'utilisateurs. Une arborescence de groupes peut alors être constituée à l'aide de ces groupes. Un utilisateur ou un groupe d'utilisateurs peut appartenir à plusieurs groupes. La seule contrainte est que le graphe des groupes ne doit pas contenir de cycle. Le groupe A ne peut pas appartenir au groupe B si B appartient déjà au groupe A. La famille décrivant les groupes d'utilisateurs est **`IGROUP`**.
    
    **Note** : Il existe aussi la famille *"groupe"* (`GROUP`) qui est la famille mère de *"groupe d'utilisateur"*. Cette famille de plus haut niveau permet de regrouper aussi des documents qui ne sont pas forcément des utilisateurs mais des contacts. Dans ce chapitre, le terme `groupe` désignera les groupes d'utilisateurs.
    
`Rôle`
: Un document _"rôle"_ identifie une fonction dans l'organisation. Ce rôle sera utilisé pour définir les droits. Un utilisateur peut avoir plusieurs rôles. Les rôles n'ont pas de hiérarchie. La famille décrivant les rôles est **`ROLE`**.

