# Vérification des droits pour télécharger un fichier d'un document {#core-ref:f9316b0e-3404-4521-8850-d9d2a9f85357}

L'accès au téléchargement d'un fichier se fait avec l'action
[`FDL:EXPORTFILE`][exportfile].

Le [fichier physique enregistré][dbvault] dans le coffre n'est pas accessible
directement. L'accès aux répertoires des coffres est contrôlé par le serveur web
qui interdit leur accès (fichier `.htaccess`).

Certains fichiers peuvent être en accès libre. Cela concerne notamment les
icônes personnalisées des familles, dossiers et recherches.


![Contrôle du téléchargement d'un fichier](advanced/controldownloadfile.png)

<!-- links -->
[profilrules]:  #core-ref:fc37efd3-6254-4bc8-8f8d-7f867c852b67 "Propagation de profilage"
[accountintro]: #core-ref:2bd98eec-5b03-4af0-b9d6-1bbf78fe9733 "Utilisateurs, groupes et rôles" 
[actionacl]:    #core-ref:a98b72ea-c063-4907-abc4-e5171ab55e59 "Les droits applicatifs"
[acldoc]:       #core-ref:a99dcc5f-f42f-4574-bbfa-d7bb0573c95d "Paramétrage des droits documentaires"
[execreq]:      #core-ref:009929b6-8ffa-4306-add7-14cbdb41e6b4
[viewdocreq]:   #core-ref:76241972-720a-464f-a43b-04c9884b8101
[classdoc]:     #core-ref:1d557fb4-4eca-4ab8-a334-974fe563ddd2
[docctrl]:      #core-ref:96f8ce9d-7bfb-4027-8106-10cbe8ee6a1a
[opendoc]:      #core-ref:f9e68fa7-01b7-4903-9718-744271d63112
[exportfile]:   #core-ref:0fc93676-888f-497e-b9bc-28cdbead52df
[dbvault]:      #core-ref:7c41b8d8-5ace-489c-886f-a6500c717423