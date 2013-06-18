# appadmin {#core-ref:675f4a02-692e-429b-a786-063246f40fca}

## Description {#core-ref:af1a02a2-b0bf-4395-8441-29d67797fa12}

Le script `appadmin` permet d'installer, ou de mettre à jour, la définition d'une
application Dynacase.

Voir aussi :

* [Forcer la mise à jour des paramètres][forcer_la_mise_a_jour_des_parametres].

## Usage {#core-ref:383abab7-b599-4e41-b54a-a6750deba028}

**`appname` (obligatoire)**
:   Le nom de l'application.

`method` (default `init`)
:   Sélectionne l'action à effectuer sur l'application. Les valeurs possibles
    sont :
    
    `init`
    :   Initialise (installe) l'application.
    
    `update`
    :   Met à jour la définition de l'application.
    
    `reinit`
    :   Re-initialise l'application (dans le cas ou elle a déjà été initialisée
    	avec la méthode `init`).
    
    `delete`
    :   Supprime la définition de l'application.

## Limite d'usage {#core-ref:3daf30b2-4f40-4aeb-a45d-db130c6b8db5}

N/A

<!-- links -->
[forcer_la_mise_a_jour_des_parametres]: #core-ref:4bd9e0d5-dfaf-41e8-acbf-92f8d6bbcd44