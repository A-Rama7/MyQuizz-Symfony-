DROP DATABASE IF EXISTS `quiz`;
CREATE DATABASE IF NOT EXISTS `quiz`;
USE `quiz`;

CREATE TABLE `topic`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255)
);

INSERT INTO `topic`(`id`,`name`) VALUES
    (1, "Harry-Potter"),
    (2, "Sigles Français"),
    (3, "Définitions de mots"),
    (4, "Les spécialités culinaires"),
    (5, "Séries TV : les simpson - partie 1"),
    (6, "Séries TV : les simpson - partie 2"),
    (7, "Séries TV : Stargate SG1"),
    (8, "Séries TV : NCIS"),
    (9, "Jeux de société"),
    (10, "Programmation"),
    (11, "Sigles informatiques");

CREATE TABLE `question`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `id_topic` INT,
    `text` VARCHAR (255)
);

INSERT INTO `question`(`id`, `id_topic`, `text`) VALUES
    (1, 1 , "Dans la partie déchec, Harry Potter prend la place de :"),
    (2, 1 , "Quel est le mot de passe du bureau de Dumbledore ?"),
    (3, 1 , "Quel chiffre est écrit à l'avant du Poudlard Express ?"),
    (4, 1 , "Avec qui Harry est-il interdit de jouer à vie au Quidditch par Ombrage ?"),
    (5, 1 , "Sur quelle(s) main(s) Harry s'écrit-il je ne dois pas dire de mensonge pendant ses retenues avec Ombrage ?"),
    (6, 1 , "Everard et Dilys sont :"),
    (7, 1 , "Quel est le prénom du professeur Gobe-Planche ?"),
    (8, 1 , "Quel est le nom de jeune fille de Molly Weasley ?"),
    (9, 1 , "Lequel de ces Mangemorts n'était pas présent lors de l'invasion au ministère ?"),
    (10, 1 , "En quelle année sont morts les parents de Harry Potter ?"),
    (11, 2 , "Que signifie AOC ?"),
    (12, 2 , "Que signifie CROUS ?"),
    (13, 2 , "Que signifie FAI ?"),
    (14, 2 , "Que signifie l'INSEE ?"),
    (15, 2 , "Que signifie ADN ?"),
    (16, 2 , "Que signifie SAMU ?"),
    (17, 2 , "Que signifie SFR ?"),
    (18, 2 , "Que signifie FNAC ?"),
    (19, 2 , "Que signifie RATP ?"),
    (20, 2 , "Que signifie SMIC ?"),
    (21, 3 , "Que signifie le verbe Enrêner ?"),
    (22, 3 , "Qu'est-ce qu'un protocole ?"),
    (23, 3 , "Que fait une langue qui est protractile ?"),
    (24, 3 , "Qu'est ce qu'un Campanile ?"),
    (25, 3 , "Que signifie le mot « gentilé » ?"),
    (26, 3 , "Qu'est ce qu'un Pugilat ?"),
    (27, 3 , "Parmi ces définitions, laquelle n'est pas une torpille ?"),
    (28, 3 , "Qu'est ce que la déontologie ?"),
    (29, 3 , "Qu'est ce qu'un carcan ?"),
    (30, 3 , "Que signifie le terme univoque ?"),
    (31, 4 , "Quelle est la spécialité de Reims ?"),
    (32, 4 , "Parmi ces spécialités, laquelle ne fait pas partie du patrimoine gastronomique de la ville de Troyes ?"),
    (33, 4 , "Dans quelle département trouve-t-on les lentilles du Puy ?"),
    (34, 4 , "Dans quel département trouve-t-on la Teurgoule ?"),
    (35, 4 , "Quel fromage ne trouve-t-on pas en Normandie ?"),
    (36, 4 , "Parmi ces spécialités, laquelle ne vient pas de la région PACA ?"),
    (37, 4 , "Quelle est la spécialité de Tours ?"),
    (38, 4 , "Parmi ces biscuits lesquelles ne vient pas de Bretagne ?"),
    (39, 4 , "Quelle est le nom de cette recette: Lamproie à la ?"),
    (40, 4 , "Le Kouglof est une spécialité de :"),
    (41, 5 , "Comment s'appelle le père d'Homer Simpson ?"),
    (42, 5 , "Quel est le nom du dessin animé gore préféré de Bart et Lisa Simpson ?"),
    (43, 5 , "De quel instrument joue Lisa Simpson ?"),(44, 5 , "Comment s'appelle le meilleur ami de Bart ?"),
    (45, 5 , "Quelle est la profession de Wiggum ?"),
    (46, 5 , "Qui en veut à la vie de Bart Simpson ?"),
    (47, 5 , "Qui est Smithers ?"),
    (48, 5 , "Quelle est la nationalité de Willy ?"),
    (49, 5 , "Quelle est la nourriture préférée d'Homer ?"),
    (50, 5 , "Dans quelle ville habitent les Simpson ?"),
    (51, 6 , "Qui est le créateur des Simpson ?"),
    (52, 6 , "Quel est le nom de jeune fille de Marge Simpson ?"),
    (53, 6 , "Que faisait le chien des Simpson avant qu'ils l'adoptent ?"),
    (54, 6 , "Où Maud Flanders trouva t-elle la mort ?"),
    (55, 6 , "Quelle réplique prononce très souvent Homer Simpson ?"),
    (56, 6 , "Comment s'appelle la bière préférée des habitat de Springfield ?"),
    (57, 6 , "Comment s'appelle la mère d'Homer ?"),
    (58, 6 , "Comment s'appelle la ville voisine et ennemie de Springfrield ?"),
    (59, 6 , "Quelle est l'une des particularités de Moe ?"),
    (60, 7 , "Où se trouve la base de commandement du SGC ?"),
    (61, 7 , "Comment s'appelle les crabes métalliques qui se reproduisent rapidement en se nourrissant de métal ?"),
    (62, 7 , "Combien a y-t-il de saisons dans Stargate SG1 ?"),
    (63, 7 , "Dans l'épisode « L'histoire sans fin » que font Jack et Teal'c d'assez particulier ?"),
    (64, 7 , "Qui est le commandant suprême de la flotte Asgard ?"),
    (65, 7 , "De qui Jolinar était-elle la compagne ?"),
    (66, 7 , "Quel mot désigne les habitants de la planète Terre ?"),
    (67, 7 , "De qui Sha'are devient-elle l'hôte ?"),
    (68, 7 , "L'alliance des quatre races est composée des Anciens, Des Asgards, des Furlings et.."),
    (69, 7 , "Comment meurt Daniel Jackson avant de faire son Ascension et d'être ensuite remplacé par Jonas Quinn ?"),
    (70, 8 , "Quels sont les prénoms de Gibbs ?"),
    (71, 8 , "Comment est morte Kate à la fin de la deuxième saison ?"),
    (72, 8 , "Quelle est la boisson préférée d'Abby ?"),
    (73, 8 , "Qui est en réalité Jeanne Benoit, la petite amie de Tony dans la Saison 4 ?"),
    (74, 8 , "De quelle grave maladie Tony DiNozzo est infectée dans la saison 2 ?"),
    (75, 8 , "A part les filles, quelle est la grande passion de Tony DiNozzo ?"),
    (76, 8 , "Ziva David est un ancien officier du  ?"),
    (77, 8 , "Lorsque Gibbs décide de démissionner à la fin de la Saison 3, quel personnage devient le chef de l'équipe ?"),
    (78, 8 , "Avec quel agent Palmer a-t-il eu une liaison ?"),
    (79, 8 , "Comment Jenny Shepard trouve-t-elle la mort au court de la saison 5 ?"),
    (80, 9 , "Lequel de ces navires ne se retrouvent pas dans le « Toucher-couler » ?"),
    (81, 9 , "Laquelle de ces couleurs n'existe pas au Trivial poursuite traditionnel ?"),
    (82, 9 , "Laquelle de ces lettres vaut 10 points au scrabble ?"),
    (83, 9 , "Quelle est la rue qui coute le moins cher au Monopoly français ?"),
    (84, 9 , "Dans le monopoly d'origine combien gagnait-on en passant par la case départ ?"),
    (85, 9 , "Parmi ces pays, lequel n'est pas présent sur le plateau du jeu « Risk » ?"),
    (86, 9 , "Combien y a-t-il de flèches au Backgammon ?"),
    (87, 9 , "Lequel de ces déplacement n'existe pas aux échecs ?"),
    (88, 9 , "Au jeu du Cluedo qui est professeur ?"),
    (89, 9 , "Comment appelle-t-on le groupe de cartes au 1000 bornes qui comprend : As du volant, camion-citerne, increvable, prioritaire...."),
    (90, 10 , "Lequel de ces langages ne peut pas être exécuté côté serveur ?"),
    (91, 10 , "Lequel de ces langages a la vitesse d'éxécution la plus rapide ?"),
    (92, 10 , "Quel est l'animal qui représente habituellement le langage PHP ?"),
    (93, 10 , "Lequel de ces systèmes d'exploitation est sous environnement UNIX ?"),
    (94, 10 , "Lequel de ces langages est reconnu pour sa grande portabilité et sa flexibilité ?"),
    (95, 10 , "Laquelle de ces propositions n'est pas un langage de programmation ?"),
    (96, 10 , "Quelle commande permet de planifier l'éxécution de tâches sous UNIX ?"),
    (97, 10 , "Quel est le composant principal d'un ordinateur, sur lequel sont greffés les autres ?"),
    (98, 10 , "Quel port externe n'existe pas sur un ordinateur ?"),
    (99, 10 , "Quel nom d'attaque n'existe pas dans le domaine de la sécurité ?"),
    (100, 11 , "Que signifie HTTP ?"),
    (101, 11 , "Que signifie SSL ?"),
    (102, 11 , "Que signifie FTP ?"),
    (103, 11 , "Laquelle de ces propositions n'est pas un SGBDR ?"),
    (104, 11 , "Que signifie WWW ?"),
    (105, 11 , "Que signifie URI ?"),
    (106, 11 , "Que signifie IP ?"),
    (107, 11 , "Qu'est-ce que peut évoquer REMOTE_ADDR ?"),
    (108, 11 , "Laquelle de ces propositions n'est pas une IP correcte ?"),
    (109, 11 , "Laquelle de ces propositions n'est pas une MAC correcte ?");

CREATE TABLE `answer`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `id_question` INT(6),
    `text` VARCHAR (255),
    `answer_expected` BOOLEAN
);

INSERT INTO `answer`(`id_question`, `text`, `answer_expected`) VALUES
    (1, "Un fou", 1),
    (1, "Une tour", 0),
    (1, "Un pion", 0),
    (2, "Sorbet Citron", 1),
    (2, "Chocogrenouille", 0),
    (2, "Dragées Surprise", 0),
    (3, "5972", 1),
    (3, "4732", 0),
    (3, "6849", 0),
    (4, "George Weasley", 1),
    (4, "Fred Weasley", 0),
    (4, "Drago Malefoy", 0),
    (5, "La droite", 1),
    (5, "La gauche", 0),
    (5, "Les deux", 0),
    (6, "Deux directeurs de Poudlard", 1),
    (6, "Deux amants célèbres de Poudlard", 0),
    (6, "Deux préfets en chef", 0),
    (7, "Wilhelmina", 1),
    (7, "Libellia", 0),
    (7, "Carlotta", 0),
    (8, "Prewett", 1),
    (8, "Foist", 0),
    (8, "Jugson", 0),
    (9, "Rowle", 1),
    (9, "Crabbe", 0),
    (9, "Goyle", 0),
    (10, "1981", 1),
    (10, "1982", 0),
    (10, "1983", 0),
    (11, "Appellation d'Origine Contrôlée", 1),
    (11, "Aliment Original Contrôlé", 0),
    (11, "Association des Obligations des Consommateurs", 0),
    (12, "Centre Régional des Oeuvres Universitaires et Scolaires", 1),
    (12, "Centre de Restauration et d'Organisation Universitaire et Secondaire", 0),
    (12, "Comité Régional pour l'Organisation Universitaire et Scolaire", 0),
    (13, "Fournisseur d'Accès Internet", 1),
    (13, "Fournisseur d'Alimention et d'Informatique", 0),
    (13, "Fédération à l'Accès Informatique", 0),
    (14, "Institut National de la Statistique et des Études Économiques", 1),
    (14, "Institut National de Service pour l'Économie et l'Enseignement", 0),
    (14, "Institution Nationalisé pour les Statistiques des Établissements Économiques", 0),
    (15, "Acide Desoxyriboucléique", 1),
    (15, "Atome Desoxygénénucléique", 0),
    (15, "Aspérité Desoxygéné et Nucléanbique", 0),
    (16, "Service d'Aide Médicale Urgente", 1),
    (16, "Service d'Ambulance et de Médecine d'Urgence", 0),
    (16, "Service Auxiliaire Mutualisé d'Urgence", 0),
    (17, "Société Française de Radiotéléphone", 1),
    (17, "Société Francophone des Réseaux", 0),
    (17, "Société Financière et Radio-téléphonique", 0),
    (18, "Fédération Nationale d'Achat des Cadres", 1),
    (18, "Franchise Nationale d'Art et de Culture", 0),
    (18, "Firme Nationale d'Achat Culturel", 0),
    (19, "Régie autonome des transports parisiens", 1),
    (19, "Reseaux automatisé des transports parisiens", 0),
    (19, "Régie automatique des transports de Paris", 0),
    (20, "Salaire Minimum Interprofessionnel de Croissance", 1),
    (20, "Salaire Médian d'Intérêt Communautaire", 0),
    (20, "Salaire Moyen d'Insertion de Croissance", 0),
    (21, "Mettre des rênes", 1),
    (21, "Etre dépendent de quelque chose", 0),
    (21, "Etre à l'origine d'un fait", 0),
    (22, "Un ensemble de règles établies", 1),
    (22, "Le fait de savoir parler plusieurs langues", 0),
    (22, "Une série de chiffre", 0),
    (23, "Elle peut être étirée vers l'avant", 1),
    (23, "Elle peut se diviser en deux", 0),
    (23, "Elle peut s'enrouler sur elle même", 0),
    (24, "Un cloché", 1),
    (24, "Une maison de campagne", 0),
    (24, "Une forteresse", 0),
    (25, "C'est le nom des habitants d'un lieu", 1),
    (25, "C'est un synonyme du mot gentillesse", 0),
    (25, "C'est le nom du mouvement que l'on fait avec un tournevis", 0),
    (26, "Un combat au corps à corps", 1),
    (26, "Une demande d'audience", 0),
    (26, "Une sorte de dague", 0),
    (27, "Une espèce de calamar", 1),
    (27, "Un poisson qui ressemble à une raie", 0),
    (27, "Un engin automoteur sous-marin", 0),
    (28, "Le code de conduite d'une profession", 1),
    (28, "Une partie de la médecine qui étudie la peau", 0),
    (28, "L'étude des facultés psychiques des dauphins", 0),
    (29, "Une contrainte qui entrave la liberté", 1),
    (29, "Une sorte de montre", 0),
    (29, "Une pièce de tissu", 0),
    (30, "Qui n'a qu'un sens", 1),
    (30, "Qui a plusieurs sens", 0),
    (30, "Qui est sans contrainte", 0),
    (31, "Le biscuit rose", 1),
    (31, "Le trou rémois", 0),
    (31, "Le cidre rosé", 0),
    (32, "La pâte de fruit à la mirabelle", 1),
    (32, "Le chaource", 0),
    (32, "L'andouillette", 0),
    (33, "Haute Loire", 1),
    (33, "Allier", 0),
    (33, "Cantal", 0),
    (34, "Le Calvados", 1),
    (34, "Le cantal", 0),
    (34, "L'ardèche", 0),
    (35, "Saint Félicien", 1),
    (35, "Livarot", 0),
    (35, "Neufchâtel", 0),
    (36, "Le cassoulet", 1),
    (36, "La tapenade", 0),
    (36, "Les calissons", 0),
    (37, "Les rillons", 1),
    (37, "Le confis", 0),
    (37, "Le magret", 0),
    (38, "Les madeleines", 1),
    (38, "Les craquelins", 0),
    (38, "Les gavottes", 0),
    (39, "Bordelaise", 1),
    (39, "Toulousaine", 0),
    (39, "Marseillaise", 0),
    (40, "L'Alsace", 1),
    (40, "La lorraine", 0),
    (40, "La Franche comté", 0),
    (41, "Abraham", 1),
    (41, "Georges", 0),
    (41, "Francis", 0),
    (42, "Itchy et Scratchy show", 1),
    (42, "Les tronçonneuses folles", 0),
    (42, "Cat and dog", 0),
    (43, "Du saxophone", 1),
    (43, "De la trompette", 0),
    (43, "De la clarinette", 0),
    (44, "Milhouse", 1),
    (44, "Martin", 0),
    (44, "Ralph", 0),
    (45, "C'est le chef de la police", 1),
    (45, "Il est vendeur de BD", 0),
    (45, "C'est le vrai nom de l'homme Abeille", 0),
    (46, "Tahiti Bob", 1),
    (46, "Krusty le clown", 0),
    (46, "L'homme Abeille", 0),
    (47, "L'assistant du président de la centrale nucléaire", 1),
    (47, "Un collègue d'Homer Simpson", 0),
    (47, "Le président de la centrale nucléaire où travaille Homer", 0),
    (48, "Ecossais", 1),
    (48, "Canadien", 0),
    (48, "Australien", 0),
    (49, "Les donuts", 1),
    (49, "Les pizzas", 0),
    (49, "Les hamburgers", 0),
    (50, "Springfield", 1),
    (50, "Sheffield", 0),
    (50, "Shortfield", 0),
    (51, "Matt Groening", 1),
    (51, "Seth Mac Farlane", 0),
    (51, "Glenn Eichler", 0),
    (52, "Bouvier", 1),
    (52, "Polsen", 0),
    (52, "March", 0),
    (53, "De la course de lévriers", 1),
    (53, "C'était un chien d'aveugle", 0),
    (53, "Il était chien policer", 0),
    (54, "Dans les gradins d'un stade", 1),
    (54, "Elle disparaît en mer", 0),
    (54, "Dans la maison des Simpson", 0),
    (55, "Oh punaise!", 1),
    (55, "Oh mon dieu!", 0),
    (55, "Oh bravo!", 0),
    (56, "La Duff", 1),
    (56, "La Kronekein", 0),
    (56, "La Spiner", 0),
--    (57, "Elle a une addiction aux jeux d'argent", 1),
--    (57, "Elle se drogue secrètement", 0),
--    (57, "Elle boit souvent", 0),
    (57, "Mona", 1),
    (57, "Gina", 0),
    (57, "Dina", 0),
    (58, "Shelbyville", 1),
    (58, "Summerville", 0),
    (58, "Stringville", 0),
    (59, "Il a des tendances suicidaires", 1),
    (59, "Il est ventriloque", 0),
    (59, "Il vole dans les supermarchés", 0),
    (60, "Dans le Colorado", 1),
    (60, "Dans l'Arizona", 0),
    (60, "Dans l'Utah", 0),
    (61, "Les réplicateurs", 1),
    (61, "Les réplicants", 0),
    (61, "Les répliqueurs", 0),
    (62, "10 Saisons", 1),
    (62, "8 Saisons", 0),
    (62, "12 Saisons", 0),
    (63, "Ils font du golf avec la porte des étoiles", 1),
    (63, "Ils jouent au tennis dans les couloirs de la base", 0),
    (63, "Ils font du camping dans la base", 0),
    (64, "Thor", 1),
    (64, "Loki", 0),
    (64, "Penegal", 0),
    (65, "Martouf", 1),
    (65, "Selmak", 0),
    (65, "Malek", 0),
    (66, "Les Tau'ri", 1),
    (66, "Les Tok'ra", 0),
    (66, "Les Oris", 0),
    (67, "Amonet", 1),
    (67, "Amaterasu", 0),
    (67, "Hathor", 0),
    (68, "Des Nox", 1),
    (68, "Des Ori", 0),
    (68, "Des Unas", 0),
    (69, "Il absorbe une dose de radiation", 1),
    (69, "Il est tué par Apophis", 0),
    (69, "Il tombe dans un ravin", 0),
    (70, "Leroy Jethro", 1),
    (70, "Jack Lenny", 0),
    (70, "Lance Jimmy", 0),
    (71, "D'une balle dans la tête", 1),
    (71, "Lors d'une explosion", 0),
    (71, "En tombant d'un toit", 0),
    (72, "Un soda caféine", 1),
    (72, "Un diabolo menthe", 0),
    (72, "Un thé glacé", 0),
    (73, "La fille d'un trafiquant d'armes", 1),
    (73, "Une espionne russe", 0),
    (73, "Un agent double de la CIA", 0),
    (74, "La peste", 1),
    (74, "La tuberculose", 0),
    (74, "Le cholera", 0),
    (75, "Le cinéma", 1),
    (75, "Le base-ball", 0),
    (75, "Les voitures de courses", 0),
    (76, "Mossad", 1),
    (76, "KGB", 0),
    (76, "NSA", 0),
    (77, "Tony", 1),
    (77, "Ziva", 0),
    (77, "McGee", 0),
    (78, "Lee", 1),
    (78, "Ziva", 0),
    (78, "Kate", 0),
    (79, "Lors d'une fusillade", 1),
    (79, "Lors d'un accident de voiture", 0),
    (79, "Lors d'une explosion", 0),
    (80, "Un cuirassé", 1),
    (80, "Un sous-marin", 0),
    (80, "Un porte-avions", 0),
    (81, "Rouge", 1),
    (81, "Orange", 0),
    (81, "Vert", 0),
    (82, "K", 1),
    (82, "J", 0),
    (82, "Q", 0),
    (83, "Boulevard de Belleville", 1),
    (83, "Rue de Vaugirard", 0),
    (83, "Rue Lecourbe", 0),
    (84, "20 000 francs", 1),
    (84, "2 000 francs", 0),
    (84, "50 000 francs", 0),
    (85, "Russie", 1),
    (85, "Ukraine", 0),
    (85, "Chine", 0),
    (86, "24", 1),
    (86, "12", 0),
    (86, "32", 0),
    (87, "Le pool", 1),
    (87, "Le roque", 0),
    (87, "En passant", 0),
    (88, "Violet", 1),
    (88, "Olive", 0),
    (88, "Orange", 0),
    (89, "Les bottes", 1),
    (89, "Les parades", 0),
    (89, "Les attaques", 0),
    (90, "HTML", 1),
    (90, "JavaScript", 0),
    (90, "PHP", 0),
    (91, "C", 1),
    (91, "PHP", 0),
    (91, "Python", 0),
    (92, "Elephant", 1),
    (92, "Serpent", 0),
    (92, "Souris", 0),
    (93, "Debian", 1),
    (93, "Windows", 0),
    (93, "Java", 0),
    (94, "Java", 1),
    (94, "Python", 0),
    (94, "C++", 0),
    (95, "Saphir", 1),
    (95, "Ruby", 0),
    (95, "Perl", 0),
    (96, "crontab", 1),
    (96, "task", 0),
    (96, "run", 0),
    (97, "Carte mère", 1),
    (97, "Processeur", 0),
    (97, "Carte graphique", 0),
    (98, "VGE", 1),
    (98, "HDMI", 0),
    (98, "USB", 0),
    (99, "MS-DOS 95", 1),
    (99, "DDOS", 0),
    (99, "Bruteforce", 0),
    (100, "Hyper Text Transfer Protocol", 1),
    (100, "Host Type Text Protocol", 0),
    (100, "Host Trame Transfer Protocol", 0),
    (101, "Secure Socket Layer", 1),
    (101, "Socket Same Loundge", 0),
    (101, "Security Socket Law", 0),
    (102, "File Transfer Protocol", 1),
    (102, "Film Transfert Processus", 0),
    (102, "File Trame Pratical", 0),
    (103, "CSV", 1),
    (103, "MySQL", 0),
    (103, "MongoDB", 0),
    (104, "World Wide Web", 1),
    (104, "Word Wild Web", 0),
    (104, "Warp World Web", 0),
    (105, "Uniform Resource Identifier", 1),
    (105, "Ulimit Redirection Id", 0),
    (105, "Unity Range Information", 0),
    (106, "Internet Protocol", 1),
    (106, "Internic Procedural", 0),
    (106, "Internal Processus", 0),
    (107, "Une Adresse IP", 1),
    (107, "Une Adresse MAC", 0),
    (107, "Une Prise de contrôle", 0),
    (108, "128.256.0.1", 1),
    (108, "127.0.0.1", 0),
    (108, "255.255.0.0", 0),
    (109, "EX:3F:7E:E6:2D:58", 1),
    (109, "EA:9D:00:5B:CE:FF", 0),
    (109, "AA:BB:CC:DD:EE:FF", 0);

-- CREATE TABLE `user`(
--     `id` INT PRIMARY KEY AUTO_INCREMENT,
--     `name` VARCHAR(255),
--     `email` VARCHAR(255),
--     `password` VARCHAR(255),
--     `administrator` INT DEFAULT 0,
--     `last_connexion_date` DATETIME DEFAULT NOW()
-- );

CREATE TABLE `history_quiz`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `id_topic` INT,
    `id_user` INT,
    `date` DATETIME DEFAULT NOW()
);

CREATE TABLE `quiz`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `id_topic` INT,
    `id_user` INT,
    `id_question_1` INT,
    `id_question_2` INT,
    `id_question_3` INT,
    `id_question_4` INT,
    `id_question_5` INT,
    `id_question_6` INT,
    `id_question_7` INT,
    `id_question_8` INT,
    `id_question_9` INT,
    `id_question_10` INT,
    `date` DATETIME DEFAULT NOW()
);

