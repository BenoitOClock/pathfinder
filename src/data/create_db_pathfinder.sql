BEGIN;

DROP TABLE IF EXISTS "log_table", "user_table", "difficulty", "summit", "tag", "trek", "tag_has_trek" CASCADE;


-- Table: public.log

CREATE TABLE "log_table" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "url" TEXT NOT NULL,
    "time" TIME with time zone NOT NULL,
    "ip" TEXT NOT NULL,
    "created_at" TIMESTAMP with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP with time zone
);


-- Table: public.user

CREATE TABLE "user_table" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "pseudo" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role" TEXT DEFAULT 'user',
    "created_at" TIMESTAMP with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP with time zone
);

-- Table: public.difficulty

CREATE TABLE "difficulty" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT NOT NULL,
    "created_at" TIMESTAMP with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP with time zone
);


-- Table: public.summit

CREATE TABLE "summit" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT NOT NULL,
    "created_at" TIMESTAMP with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP with time zone
);


-- Table: public.tag

CREATE TABLE "tag" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT NOT NULL,
    "created_at" TIMESTAMP with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP with time zone
);

-- Table: public.trek

CREATE TABLE "trek" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT NOT NULL,
    "boucle" TEXT NOT NULL,
    "time_length" TEXT NOT NULL,
    "start_point" TEXT,
    "gps_coordonate" TEXT,
    "gpx" TEXT,
    "resume" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "distance" INTEGER NOT NULL,
    "denivele" INTEGER NOT NULL,
    "max_height" INTEGER NOT NULL,
    "min_height" INTEGER NOT NULL,
    "map" TEXT,
    "summit_id" INTEGER REFERENCES summit("id"),
    "difficulty_id" INTEGER REFERENCES difficulty("id"),
    "created_at" TIMESTAMP with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP with time zone
 );


-- Table: public.tag_has_trek
CREATE TABLE "tag_has_trek" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "tag_id" INTEGER NOT NULL REFERENCES tag("id") ON DELETE CASCADE,
    "trek_id" INTEGER NOT NULL REFERENCES trek("id") ON DELETE CASCADE,
    "created_at" TIMESTAMP with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP with time zone
);

-- ___________________________________________________________
-- ______________________ VALUES _____________________________
-- ___________________________________________________________





INSERT INTO "difficulty" ("name") VALUES
('Très facile'),
('Facile'),
('Modérée'),
('Difficile'),
('Très difficile');

INSERT INTO "summit" ("name") VALUES
('Massif des Aiguilles Rouges'),
('Massif des Aravis'),
('Massif des Bornes'),
('Massif des Bauges'),
('Massif du Chablais'),
('Massif des Fiz'),
('Massif du Giffre'),
('Massif du Mont Blanc'),
('Massif du Salève'),
('Massif des Voirons');

INSERT INTO "tag" ("name") VALUES
('Lac'),
('Neige'),
('Cascade'),
('Randonnée'),
('Trail'),
('Promenade'),
('Bivouac'),
('Défi fou'),
('Couché de soleil'),
('Familiale'),
('Très facile'),
('Facile'),
('Modérée'),
('Difficile'),
('Très difficile');

INSERT INTO "trek" ("name", "time_length", "distance", "denivele", "max_height", "min_height", "difficulty_id", "boucle", "summit_id", "start_point", "gps_coordonate", "gpx", "description", "resume", "map") VALUES
('L''Aiguillette des Houches', '3 heures et 20 minutes', 10300, 781, 2285, 1389, 3, 'En boucle', 1, 'Houches', '45.908071, 6.821835', 'https://www.visugpx.com/download.php?id=g1M87XvUXq', 'La randonnée de l''Aiguillette des Houches est une expérience incroyable pour tous les amateurs de nature et de montagne. Située dans le massif des Aiguilles Rouges en France, cette randonnée offre des vues spectaculaires sur les montagnes environnantes, les glaciers et les vallées environnantes.
Le départ de la randonnée se fait depuis le village des Houches, où les randonneurs peuvent prendre un téléphérique pour atteindre le col de Bellevue. De là, il faut suivre un sentier bien balisé qui mène à l''Aiguillette des Houches.
Le parcours est assez exigeant, avec une montée raide et parfois rocailleuse. Cependant, la beauté des paysages qui s''offrent aux randonneurs tout au long du chemin en vaut vraiment la peine. Les vues sur le glacier de Bionnassay, la chaîne des Fiz et la vallée de Chamonix sont particulièrement impressionnantes.
Une fois arrivés au sommet de l''Aiguillette des Houches, les randonneurs sont récompensés par une vue panoramique à couper le souffle sur les montagnes environnantes, y compris le Mont-Blanc. C''est également un endroit idéal pour une pause déjeuner et une séance de photos mémorable.', 'La randonnée vers l''Aiguillette des Houches offre un parcours original et accessible. Cette balade emprunte une partie du GR du Tour du Mont-Blanc et offre des vues panoramiques sur les sommets alpins. Entre nature sauvage et paysages grandioses, l''Aiguillette des Houches est une expérience inoubliable pour tous les amoureux de la montagne.', 'https://www.visugpx.com/g1M87XvUXq?iframe'),
('La Bourgeoise', '1 heure et 40 minutes', 6800, 300, 1759, 1642, 2, 'Aller-retour', 2, 'La Clusaz', '46.121308, 6.709261', 'https://www.visugpx.com/download.php?id=iLM5Ydwng5', 'La randonnée de la Bourgeoise est une magnifique randonnée située dans la région de Haute-Savoie en France. Elle est considérée comme une randonnée facile avec une distance de 7 km et un dénivelé positif de 300 mètres. Elle est donc accessible à la plupart des randonneurs, mais il est important de noter qu''il peut y avoir des parties un peu plus difficiles en fonction des conditions météorologiques.
La randonnée commence au niveau de la télécabine de Beauregard, où vous prenez le téléphérique pour monter à la station de ski de La Clusaz. De là, vous pouvez suivre les panneaux pour le sentier de la Bourgeoise. Le sentier est bien balisé, même en hiver, mais il est toujours recommandé de vérifier les conditions avant de partir.
Pendant la randonnée, vous traverserez des pâturages et des forêts, offrant une vue imprenable sur les montagnes environnantes. Vous verrez également des chalets traditionnels de montagne et des vaches paissant dans les champs. En hiver, la neige peut ajouter une dimension supplémentaire à la randonnée, créant un paysage hivernal magique.
Le point culminant de la randonnée est le sommet de la Bourgeoise, qui offre une vue panoramique sur les montagnes environnantes. C''est un endroit idéal pour faire une pause et profiter du paysage.', 'Venez découvrir la randonnée de La Bourgeoise en Haute-Savoie, une boucle offrant des vues spectaculaires sur les montagnes des Aravis, le Mont Blanc et le lac d''Annecy. Vous aurez l''occasion de traverser des forêts, des ruisseaux et des prairies, et de découvrir de charmants hameaux typiques de la région. Alors, mettez vos chaussures de randonnée et partez à la découverte de cette belle randonnée en Haute-Savoie !', 'https://www.visugpx.com/iLM5Ydwng5?iframe'),
('Le Signal des Voirons', '1 heure', 3000, 182, 1475, 1360, 2, 'Aller-retour', 10, 'Saint-Paul-en-Chablais', '46.226001, 6.358242', 'https://www.visugpx.com/download.php?id=YQnPViiAR4', 'La randonnée vers le Signal des Voirons commence au monastère situé dans la ville de Saint-Paul-en-Chablais. Ce monastère, fondé en 1295, est un joyau de l''architecture gothique savoyarde, qui abrite encore aujourd''hui une communauté de religieuses.
Le sentier de randonnée commence par une montée régulière à travers une forêt dense de sapins et de mélèzes, où les randonneurs peuvent apprécier la beauté de la nature alpine. En hiver, les sentiers sont couverts de neige et les randonneurs doivent se munir de raquettes à neige pour pouvoir avancer.
Après environ une heure de marche, les randonneurs atteignent le col des Moises, qui offre une vue spectaculaire sur le lac Léman et les Alpes suisses. C''est également un point de départ pour les skieurs de fond en hiver.
Le sentier continue ensuite à travers les alpages, où les randonneurs peuvent admirer les fleurs sauvages de la région en été et les champs de neige immaculée en hiver. Après environ deux heures de marche, les randonneurs atteignent enfin le sommet du Signal des Voirons, culminant à plus de 1400 mètres d''altitude. La vue panoramique sur les montagnes de la région est à couper le souffle, et les randonneurs peuvent profiter d''une vue dégagée sur les Alpes françaises et suisses.
Après avoir savouré la vue au sommet, les randonneurs peuvent redescendre en suivant le même sentier, en admirant les paysages magnifiques de la région et en profitant du calme de la nature alpine. La randonnée vers le Signal des Voirons est une expérience inoubliable pour les amoureux de la montagne, quel que soit la saison.', 'Vous cherchez une randonnée inoubliable à faire en Haute-Savoie ? Partez à la découverte du Signal des Voirons, un sommet culminant à plus de 1400 mètres d''altitude offrant une vue imprenable sur les montagnes de la région. En hiver, vous pourrez profiter de sentiers enneigés à travers la forêt, tandis qu''en été, les paysages verdoyants et la chaleur estivale vous permettront de découvrir des vues imprenables sur la région.', 'https://www.visugpx.com/YQnPViiAR4?iframe'),
('La Pointe d''Andey', '2 heures et 40 minutes', 3000, 350, 1845, 1510, 2, 'Aller-retour', 3, 'Brison', '46.033167, 6.427444', 'https://www.visugpx.com/download.php?id=3cel1ALjfM', 'Partez à l''aventure en empruntant le sentier de randonnée qui vous mènera depuis le plateau de Solaison jusqu''à la Pointe d''Andey en Haute-Savoie. Cette randonnée, d''une durée de 3 heures environ, vous offrira une expérience inoubliable au cœur des Alpes françaises.
Tout au long du parcours, vous serez envoûté par les panoramas à couper le souffle sur les montagnes environnantes. Le sentier vous guidera à travers des pentes escarpées vers le sommet, mais l''effort en vaudra la peine !
Au sommet de la Pointe d''Andey, vous serez récompensé par une vue imprenable sur les Alpes françaises. Vous pourrez admirer les sommets enneigés environnants. C''est une expérience inoubliable qui vous permettra de vous ressourcer en pleine nature.
Cette randonnée est donc une occasion unique d''admirer la beauté naturelle de la Haute-Savoie tout en se ressourçant en pleine nature.', 'Partez à la découverte de la beauté naturelle de la Pointe d''Andey en Haute-Savoie, que ce soit sous la neige ou dans les prairies verdoyantes. Admirez les panoramas à couper le souffle sur les montagnes environnantes tout en profitant de l''air frais de la montagne. Cette randonnée est l''occasion idéale de s''évader de la vie quotidienne et de se ressourcer en pleine nature. Rejoignez-nous pour une expérience inoubliable dans les Alpes françaises !', 'https://www.visugpx.com/3cel1ALjfM?iframe'),
('Le Plateau des Glières', '2 heures et 40 minutes', 8000, 230, 1465, 1385, 2, 'En boucle', 3, 'Thorens Glières', '45.963214, 6.326408', 'https://www.visugpx.com/download.php?id=qpnnECxijG', 'Situé en Haute-Savoie, le Plateau des Glières est une destination prisée pour les randonneurs et les amateurs de ski de fond. Mais saviez-vous que c''est aussi un lieu idéal pour une randonnée familiale hivernale ?
L''itinéraire menant au chalet des Auges, au sommet de la montagne éponyme, est parfait pour une sortie en famille. Avec un dénivelé faible et une distance raisonnable, cette randonnée peut être réalisée par des enfants dès l''âge de 6 ans. Le sentier est bien balisé et sécurisé, offrant ainsi une expérience de marche agréable et sans danger.
Une fois au sommet, le chalet des Auges vous attend pour vous offrir un moment de détente bien mérité. Doté d''une vue imprenable sur la chaine du Mont Blanc, le Chablais, le Bassin Lémanique et le Jura, le panorama depuis le chalet est tout simplement spectaculaire. Vous pourrez profiter d''un déjeuner ou d''une collation chaude, tout en admirant la beauté de la nature environnante.
Le Plateau des Glières est également connu pour son riche patrimoine historique. En effet, c''est ici qu''a eu lieu la fameuse bataille des Glières en 1944, où des résistants français ont affronté les troupes allemandes. Vous pourrez découvrir cet épisode de l''histoire de la France en visitant le musée de la Résistance et en suivant le sentier commémoratif.', 'Découvrez la beauté hivernale du Plateau des Glières en empruntant l''itinéraire court et facile menant au sommet de la montagne des Auges. Profitez d''un panorama époustouflant sur la chaine du Mont Blanc, le Chablais, le Bassin Lémanique et le Jura depuis le confort douillet du chalet. Cette randonnée accessible offre un moment de détente en pleine nature, loin du tumulte de la ville.', 'https://www.visugpx.com/qpnnECxijG?iframe'),
('Le Môle', '2 heures et 30 minutes', 9000, 800, 1820, 1123, 3, 'En boucle', 5, 'St Jean de Tholome', '46.099143, 6.438364', 'https://www.visugpx.com/download.php?id=FQ6nQR0QHP', 'La randonnée du Môle peut être démarrée depuis plusieurs points de départ, dont le parking de Beroud. 
Le sentier débute par une petite montée dans la forêt et rapidement vous atteindrez un plateau où vous pourrez admirer une vue magnifique sur le massif des Bornes et la chaîne du Mont-Blanc. Vous marcherez ensuite le long d''une crête en pente douce. Au fur et à mesure de l''ascension, vous traverserez des alpages pittoresques et des paysages à couper le souffle. Une fois arrivé au sommet du Môle, vous profiterez d''une vue panoramique à 360° sur les montagnes environnantes, ainsi que sur le lac Léman et la ville de Genève. 
Si vous êtes fatigué, vous pourrez faire une pause au Petit Môle.
La descente se fera en empruntant un autre sentier qui fait une boucle en passant par les alpages de la Roche. Vous pourrez ainsi découvrir des paysages différents et profiter de nouvelles vues panoramiques sur les montagnes environnantes. Le sentier descend ensuite dans la forêt pour rejoindre le point de départ, le parking de Beroud.
Prévoyez environ 3 heures pour cette randonnée de 9 km et 800 mètres de dénivelé positif.', 'Vous cherchez une randonnée emblématique pour découvrir la région de Haute-Savoie ? Le Môle est un grand classique facilement visible depuis Genève, offrant un panorama à 360° sur les massifs environnants, tels que les Bornes, le Giffre et le Chablais. Cette randonnée, accessible à tous les niveaux, est une expérience inoubliable à vivre en famille ou entre amis. Marchez à travers les forêts verdoyantes et les alpages pittoresques.', 'https://www.visugpx.com/FQ6nQR0QHP?iframe'),
('Arête de Taillefer', '1 heure et 50 minutes', 7000, 440, 761, 450, 2, 'En boucle', 4, 'Duingt', '45.827117, 6.202763', 'https://www.visugpx.com/download.php?id=AQtLuqYL01', 'La randonnée de l''arête de Taillefer, au départ de l''église de Duingt, est une boucle exigeante mais incroyablement gratifiante de 7 km, avec un dénivelé de 440 mètres et une durée moyenne de 2 heures.
Après avoir quitté l''église de Duingt, le sentier commence par une montée assez raide à travers les bois. À mesure que vous gagnez de l''altitude, la vue sur le lac d''Annecy devient de plus en plus impressionnante. Après environ 1,5 km de montée, vous atteindrez une petite prairie avec une vue panoramique spectaculaire sur le lac.
Le sentier continue ensuite à travers les bois avant d''arriver à une bifurcation qui vous mènera soit vers le sommet du Taillefer (2 285 mètres), soit vers l''arête de Taillefer.
La descente commence ensuite par un sentier raide et rocheux qui mène à un col. De là, le sentier continue à travers les alpages, offrant des vues spectaculaires sur les montagnes environnantes.', 'Partez à la découverte de l''arête de Taillefer et vivez une expérience de randonnée inoubliable à partir de l''église de Duingt. Dominant le lac d''Annecy, cette arête offre un panorama à couper le souffle sur les montagnes alpines environnantes. Vous traverserez des paysages spectaculaires, des crêtes abruptes et des falaises escarpées. L''itinéraire de cette randonnée est accessible à tous les randonneurs.', 'https://www.visugpx.com/AQtLuqYL01?iframe'),
('Mont Veyrier et Mont Baron', '2 heures et 50 minutes', 14200, 1000, 1392, 569, 4, 'En boucle', 3, 'Annecy-le-Vieux', '45° 54,493’, 006° 10,362’', 'https://www.visugpx.com/download.php?id=oURZMlTEcK', 'La randonnée commence à la base du Mont Veyrier, où un petit parking est disponible pour les randonneurs. Le début de la montée est assez doux, avec un sentier qui serpente à travers les arbres. Au fur et à mesure que vous vous élevez, vous pouvez déjà sentir l''air frais de la montagne vous remplir les poumons.
Après environ une heure de marche, vous arrivez à un belvédère où vous pouvez admirer une vue imprenable sur le lac d''Annecy et les montagnes environnantes. C''est l''endroit idéal pour faire une pause et prendre quelques photos avant de continuer.
Le sentier continue à travers les bois, avec des portions plus raides qui exigent un peu plus d''efforts physiques. Mais la beauté de la nature environnante, avec ses prairies verdoyantes et ses fleurs colorées, est une récompense suffisante pour vos efforts.
Après environ une heure et demi de marche, vous arrivez au sommet du Mont Veyrier, qui culmine à 1 292 mètres. La vue panoramique sur les montagnes environnantes et le lac d''Annecy est absolument spectaculaire, et vaut largement les quelques heures de randonnée. Profitez de ce moment pour vous reposer et pour reprendre des forces avant la descente.
La descente du Mont Veyrier est un peu plus raide, mais elle est toutefois assez facile à suivre grâce à des marques et des panneaux tout le long du chemin. Après environ 45 minutes de descente, vous arrivez à une intersection où vous pouvez choisir de continuer vers le Mont Baron ou de prendre un autre sentier pour revenir à la base du Mont Veyrier.
Si vous choisissez de continuer vers le Mont Baron, la montée est moins difficile que celle du Mont Veyrier. La vue est également moins impressionnante, mais tout de même très agréable. Après environ 45 minutes de marche, vous arrivez au sommet du Mont Baron qui culmine à 1 392 mètres. La vue sur le lac d''Annecy depuis cette hauteur est tout simplement magnifique.
Après avoir admiré la vue, vous pouvez redescendre en suivant le même chemin que vous avez emprunté pour arriver au sommet. La randonnée complète dure environ 4 heures, avec des portions plus ou moins difficiles, mais l''expérience est absolument inoubliable. La beauté de la nature et la vue sur le lac d''Annecy rendent cette randonnée un incontournable pour les amateurs de la montagne et de la randonnée.', 'Découvrez une randonnée exceptionnelle près d''Annecy en empruntant les sentiers du Mont Veyrier et du Mont Baron ! Offrant une vue panoramique sur le lac et les montagnes environnantes, cette excursion de 4 heures vous promet une expérience inoubliable en plein cœur de la nature. Que vous soyez un randonneur débutant ou expérimenté, cette balade est un incontournable pour les amoureux de la montagne et des paysages époustouflants.', 'https://www.visugpx.com/oURZMlTEcK?iframe'),
('Le Salève', '3 heures', 10800, 1141, 1480, 611, 4, 'En boucle', 9, 'Collonges-sous-Salève', '46.132082, 6.154530', 'https://www.visugpx.com/download.php?id=o8OKX3dNAb', 'Le départ de la randonnée se fait depuis "Le Coin", petit hameau situé au pied du massif du Salève. Après une première montée à travers les bois, on arrive sur le sentier du Salève qui monte en zigzaguant à travers les rochers et les arbres. Ce sentier est assez exigeant avec un dénivelé important.
Arrivé à la Grande Gorge, on peut observer l''impressionnante falaise qui la borde. On traverse ensuite une petite forêt avant d''arriver à la Mer de Rochers, un paysage lunaire de rochers érodés par le vent et la pluie.
La randonnée se poursuit en montant jusqu''au Pas de l''Echelle, un col situé à 1 380 mètres d''altitude, qui offre une vue panoramique sur la région. On peut y observer les sommets environnants, ainsi que la ville de Genève et le lac Léman.
Ensuite, le sentier descend jusqu''aux Grottes d''Orjobet, témoins de l''histoire géologique de la région. Ces cavités souterraines offrent une visite impressionnante, dans un univers de stalactites et de stalagmites.
Après la visite des grottes, le chemin continue en montant jusqu''à la crête des Voirons, à 1 480 mètres d''altitude. Cette montée est assez raide, mais la vue panoramique sur les montagnes environnantes est à couper le souffle.
Le chemin redescend ensuite vers le hameau de Monnetier-Mornex, en passant par la Combe aux Puaires, une petite vallée sauvage et verdoyante. La descente est raide et caillouteuse, mais le paysage est magnifique, avec des vues plongeantes sur les falaises et les vallées environnantes.
Enfin, la randonnée se termine par une petite promenade le long de la rivière, qui mène jusqu''au point de départ. Avec ses 11 km et 1150 mètres de dénivelé, cette randonnée est réservée aux randonneurs expérimentés et en bonne condition physique. Mais les paysages époustouflants, les vues panoramiques sur la région et la visite des grottes en valent largement la peine !', 'Partez à la découverte d''un véritable joyau naturel en Haute-Savoie : les grottes d''Orjobet, situées sur le massif du Salève. Cette randonnée de 11 km vous emmène à travers des paysages magnifiques, jusqu''à la découverte de ces impressionnantes cavités souterraines, témoins de l''histoire géologique de la région.', 'https://www.visugpx.com/o8OKX3dNAb?iframe'),
('Le Mont Forchat', '2 heures et 30 minutes', 15500, 710, 1520, 850, 3, 'Aller-retour', 5, 'Habère-Poche', '46.255633, 6.505342', 'https://www.visugpx.com/download.php?id=7zu39xS7HZ', 'La randonnée du Mont Forchat est une expérience inoubliable pour les amateurs de montagne et de nature, offrant des vues panoramiques spectaculaires sur les montagnes environnantes.
Le début du sentier se déroule en forêt, offrant une fraîcheur agréable pour démarrer l''ascension. Au fur et à mesure de l''ascension, le paysage se dégage pour laisser place à des prairies alpines et des vues imprenables sur les montagnes environnantes, telles que le Mont Blanc, les Dents du Midi ou encore les Aravis.
Arrivé au sommet du Mont Forchat, le panorama est grandiose. Les randonneurs peuvent admirer la vue sur la chaîne du Mont Blanc, le lac Léman, le plateau suisse, les Aravis et les Bauges.
La descente se fait par le même chemin que celui de l''aller, offrant une occasion supplémentaire d''admirer les paysages alpins.', 'Découvrez les merveilles de la nature en randonnant sur le Mont Forchat, situé à proximité d''Habère-Poche ! Cette randonnée est une véritable invitation à l''évasion, offrant des panoramas exceptionnels sur les massifs alpins environnants. Le parcours est varié et accessible à tous les niveaux, des plus novices aux plus expérimentés.', 'https://www.visugpx.com/7zu39xS7HZ?iframe'),
('La Montage de Sous Dine', '3 heures', 11000, 990, 1996, 992, 3, 'Aller-retour', 3, 'Thônes', '46.014324, 6.301193', 'https://www.visugpx.com/download.php?id=iwVuBO4qRS', 'La randonnée du Sous Dine est une belle promenade dans le massif des Bornes, situé en Haute-Savoie. Elle offre une vue imprenable sur les montagnes environnantes, y compris le massif du Mont Blanc.
Le départ se fait généralement depuis le hameau des Cheneviers, situé à environ 10 minutes en voiture de Thônes. Le sentier commence par une montée douce à travers les bois et les prairies, avec des vues sur les montagnes environnantes. Le sentier est bien balisé, avec des marques rouges et blanches pour vous guider tout au long de la randonnée.
Au bout d''environ 1h de marche, vous atteindrez un petit refuge appelé la "Chapelle de la Charmette", situé à environ 1100 mètres d''altitude. Il s''agit d''un endroit idéal pour faire une pause, avec une table de pique-nique et une belle vue sur la vallée.
Après la Chapelle de la Charmette, le sentier devient plus raide et rocailleux, avec quelques passages escarpés. Il faut être vigilant et bien équipé pour cette partie de la randonnée. Environ 45 minutes après la chapelle, vous atteindrez le sommet du Sous Dine, à une altitude de 1996 mètres.
Le sommet offre une vue panoramique sur les montagnes environnantes, y compris le massif du Mont Blanc, ainsi que sur le lac d''Annecy et la ville de Thônes. C''est un endroit idéal pour faire une pause et prendre des photos.
La descente se fait par le même sentier qu''à l''aller. Il faut compter environ 3 heures pour faire l''aller-retour depuis les Cheneviers.
Il est important de noter que la randonnée du Sous Dine est considérée comme une randonnée de difficulté moyenne à difficile en raison de la pente raide et des passages escarpés.', 'Partez à la découverte de la majestueuse montagne Sous Dine en Haute-Savoie lors d''une randonnée inoubliable ! Cette balade vous permettra de découvrir des paysages à couper le souffle, entre forêts verdoyantes et crêtes escarpées. Au sommet, vous serez récompensé par une vue panoramique à 360 degrés sur les massifs alentours, dont le Mont Blanc.', 'https://www.visugpx.com/iwVuBO4qRS?iframe'),
('Le Mont Ouzon', '3 heures et 15 minutes', 7500, 675, 1833, 1240, 3, 'Aller-retour', 5, 'Col du Corbier', '46.2286, 6.6866', 'https://www.visugpx.com/download.php?id=qWxbenCe05', 'La randonnée calcaire du Mont Ouzon dans le massif Chablais en Haute-Savoie offre une expérience de randonnée exceptionnelle en partant du Col du Corbier, situé à une altitude de 1240 mètres. Le départ de la randonnée est marqué par une vue imprenable sur les sommets alentours et les alpages du massif.
Le parcours commence par une marche en forêt de sapins et de mélèzes, offrant une ambiance paisible et relaxante. Le sentier serpente à travers les arbres et mène à une clairière où la vue s''ouvre sur les sommets environnants. Les premiers kilomètres sont faciles et permettent de se mettre en jambe.
Le sentier continue à travers les alpages verdoyants, parsemés de fleurs sauvages et d''herbes folles. Les moutons paissent tranquillement dans les prairies et l''air est rempli du son des cloches des vaches alentours. Le sentier se fait de plus en plus raide et rocheux au fur et à mesure de la montée.
La montée vers le sommet du Mont Ouzon, culminant à 1833 mètres d''altitude, se fait par une paroi rocheuse escarpée et abrupte. Cette partie de la randonnée demande une certaine agilité et une bonne condition physique. Cependant, une fois au sommet, la vue à 360 degrés sur les montagnes environnantes est tout simplement à couper le souffle.
Le retour s''effectue par le même sentier, offrant une vue différente sur le paysage et permettant de profiter de la beauté de la nature à nouveau. La randonnée complète fait environ 7,5 km avec une durée totale de 3 heures.
', 'Découvrez la beauté sauvage du massif Chablais avec la randonnée du Mont Ouzon en Haute-Savoie. Cette excursion offre des vues panoramiques à couper le souffle sur les montagnes environnantes et une immersion totale dans la nature préservée.', 'https://www.visugpx.com/qWxbenCe05?iframe'),
('Les Chalêts de Sales', '3 heures et 30 minutes', 11000, 940, 1895, 1169, 3, 'Aller-retour', 6, 'Sixt-Fer-A-Cheval', '46.083834, 6.735949', 'https://www.visugpx.com/download.php?id=iH5PYk1uKw', 'Le sentier débute à la cascade de Rouget, l''un des sites naturels les plus impressionnants de la région. De là, la randonnée se poursuit le long de la rivière, en passant par des paysages de forêts et de prairies. Vous pourrez admirer les montagnes environnantes et les cascades qui jalonnent le chemin.
En chemin, vous découvrirez les Chalets de Sales, de magnifiques constructions en pierre et en bois typiques de la région, ainsi que des troupeaux de vaches et de moutons broutant dans les alpages. Vous pouvez également faire une pause dans l''un des nombreux petits coins de paradis, en bordure de rivière pour profiter de la vue et de l''ambiance.
Si vous êtes en forme, vous pouvez continuer la randonnée au-delà des Chalets de Sales jusqu''à la Tête de Sales à 2114 mètres d''altitude, pour profiter d''une vue à couper le souffle sur la vallée.
Cette randonnée offre une expérience authentique de la nature et des traditions de la région.', 'Partez à l''aventure dans l''un des plus beaux décors de la Haute-Savoie en explorant la randonnée des Chalets de Sales près de Sixt-Fer-à-Cheval. Cette randonnée vous emmènera à travers des paysages magnifiques, en passant par des forêts de sapins et des alpages verdoyants. 
Les Chalets de Sales est une excursion emblématique de la région de Sixt-Fer-à-Cheval en Haute-Savoie, accessible à tous, y compris aux familles avec enfants.', 'https://www.visugpx.com/iH5PYk1uKw?iframe'),
('Le Parmelan', '2 heures et 30 minutes', 11300, 1200, 1823, 1140, 4, 'Aller-retour', 3, 'Villaz', '45.974125, 6.240705', 'https://www.visugpx.com/download.php?id=aZBmanJBPU', 'La randonnée du Parmelan débute sur le parking des Puisots. Cette boucle de 11 km offre une vue imprenable sur les montagnes environnantes et le lac d''Annecy.
Le sentier débute par une montée progressive à travers une forêt de sapins et des prairies verdoyantes, avant d''atteindre la crête du Parmelan. En chemin, les randonneurs peuvent rencontrer des vaches, des chèvres et des moutons en liberté dans les alpages.
Le point culminant de la randonnée est le Grand Montoir, qui offre une vue panoramique à 360 degrés sur les montagnes environnantes. Pour y accéder, il faut emprunter un sentier rocailleux et escarpé.
Après avoir admiré la vue au sommet, la descente se fait par un sentier en lacets à travers les alpages et les forêts. Au col du Pertuiset, les randonneurs peuvent visiter la grotte de l''Enfer, une cavité naturelle où se trouve une source d''eau pure.
La randonnée du Parmelan est une expérience de randonnée inoubliable pour les amateurs de nature et de montagne, offrant des paysages spectaculaires et une belle aventure en Haute-Savoie.', 'Venez découvrir les paysages exceptionnels de la Haute-Savoie en randonnant sur les sentiers du Parmelan ! Cette randonnée vous emmènera sur les crêtes du massif, offrant des vues imprenables sur les montagnes environnantes et le lac d''Annecy. 
La randonnée du Parmelan est une expérience de randonnée inoubliable pour les amateurs de nature et de montagne, offrant des paysages spectaculaires et une belle aventure en Haute-Savoie.', 'https://www.visugpx.com/aZBmanJBPU?iframe'),
('Sur Cou', '4 heures', 18250, 1200, 1783, 1002, 4, 'En boucle', 3, 'Orange', '46.027609, 6.325638', 'https://www.visugpx.com/download.php?id=ykCLiP32Z9', 'La randonnée "Sur Cou" est une expérience à ne pas manquer pour les amateurs de marche. Avec une longueur de 18 km, cette randonnée est parfaite pour ceux qui souhaitent s''engager dans une marche agréable et sportive en pleine nature. Le parcours offre un paysage magnifique tout au long du chemin, avec des vues panoramiques exceptionnelles sur les montagnes environnantes. Que vous soyez un randonneur expérimenté ou novice, cette randonnée est une occasion idéale pour explorer la beauté naturelle de la région.
Le départ se fait à la base de loisir d''Orange. Elle commence par une boucle de la Laurentine, une agréable promenade qui permet de découvrir les paysages pittoresques environnants.
Ensuite, la randonnée se poursuit vers le sommet de "Sur Cou", qui offre une vue panoramique à couper le souffle sur les montagnes environnantes. Le parcours est assez exigeant, avec une montée progressive et des pentes abruptes, mais le paysage en vaut largement la peine.
Elle fait ensuite une boucle jusqu’au châlet de Balme et passe par le parking du Chesnet avant de retourner sur la base de loisir.', 'Partez à la conquête du sommet de "Sur Cou" en Haute-Savoie et découvrez des vues panoramiques époustouflantes. Cette randonnée offre un parcours de toute beauté dans un cadre naturel exceptionnel. Du sommet, vous pourrez admirer les Alpes et le lac Léman, un spectacle à couper le souffle. Une expérience inoubliable à partager en famille, entre amis ou en solo.', 'https://www.visugpx.com/ykCLiP32Z9?iframe'),
('Le Cirque du Fer A Cheval', '2 heures et 10 minutes', 11000, 400, 1193, 842, 2, 'Aller-retour', 7, 'Sixt-Fer-A-Cheval', '46.077278, 6.836917', 'https://www.visugpx.com/download.php?id=6IS5ugGwoe', 'Le départ se fait depuis le parking du Cirque du Fer à Cheval, où les randonneurs peuvent admirer la beauté du paysage avant de commencer leur randonnée. Le sentier commence doucement à travers les prairies verdoyantes, longeant les falaises impressionnantes de calcaire.
Le sentier s''élève progressivement et offre des vues magnifiques sur les sommets alentours et sur les cascades spectaculaires. Les randonneurs peuvent s''arrêter pour admirer la beauté de la cascade du Ferrand avant de poursuivre leur chemin.
La randonnée continue en direction de la cascade de Nant d''Ant, qui offre une vue exceptionnelle sur le cirque.
Après avoir admiré cette vue impressionnante, les randonneurs peuvent redescendre tranquillement vers le parking en profitant des vues magnifiques sur les montagnes environnantes.
Cette randonnée dure environ 2 heures et est accessible à tous les niveaux de randonneurs. Cette randonnée est une expérience inoubliable pour tous les amoureux de la nature.', 'Partez à la découverte du Cirque du Fer-à-Cheval et laissez-vous émerveiller par la majesté de ce cirque, bordé de falaises de calcaire impressionnantes. 
Les cascades y sont nombreuses, notamment au printemps. 
En plus de cette beauté naturelle, la commune est également une réserve naturelle protégée où l''on peut apercevoir des bouquetins et des marmottes. Ne manquez pas cette expérience de randonnée unique.', 'https://www.visugpx.com/6IS5ugGwoe?iframe'),
('Le Trou de la Mouche', '2 heures et 30 minutes', 11200, 1150, 2425, 1420, 4, 'En boucle', 2, 'La Clusaz', '45.920408, 6.480487', 'https://www.visugpx.com/download.php?id=CipsIiJCWl', 'La randonnée du Trou de la Mouche, c''était une aventure incroyable ! Au départ, on était un peu anxieux, on ne savait pas trop à quoi s''attendre. Mais dès les premiers pas, on a été époustouflés par la beauté des paysages. On marchait tranquillement, en admirant les troupeaux de vaches et les alpages verdoyants qui s''étendaient à perte de vue.
Au fur et à mesure de la montée, le chemin devenait de plus en plus raide et caillouteux, mais on était tellement concentrés sur la vue magnifique qu''on oubliait presque la difficulté de l''ascension. Et puis, enfin, on est arrivés au sommet ! Le Trou de la Mouche, ce passage naturel dans la roche, était à couper le souffle. On a pris des photos, on a respiré l''air pur des montagnes, on a tout simplement savouré l''instant présent.
Le retour s''est fait tranquillement, en prenant le temps de profiter du paysage. On s''est arrêtés à l''alpage de Paccaly pour une petite pause, et on a discuté avec les autres randonneurs rencontrés en chemin. Tout le monde avait le sourire aux lèvres, l''expérience était inoubliable.
En fin de journée, on est retournés au parking du col des Aravis, fatigués mais heureux. Cette randonnée nous a permis de découvrir la beauté de la Haute-Savoie, ses villages alpins typiques, ses montagnes majestueuses et ses paysages à couper le souffle. Une expérience à vivre absolument !', 'La randonnée du Trou de la Mouche à La Clusaz est une belle balade de 11 km qui offre une vue panoramique sur les montagnes environnantes. Le point culminant est le Trou de la Mouche, un passage naturel dans la roche à 2 260 mètres d''altitude, offrant une vue imprenable sur la chaîne des Aravis.', 'https://www.visugpx.com/CipsIiJCWl?iframe'),
('Les Rochers de Leschaux', '2 heures', 8800, 610, 1925, 1398, 3, 'En boucle', 3, 'Brison', '46.033167, 6.427444', 'https://www.visugpx.com/download.php?id=xoIBu2smMD', 'Le départ de la randonnée se trouve au parking de la station de ski de Solaison. La randonnée commence par une montée assez raide sur un chemin forestier qui mène à une crête offrant une vue panoramique sur les montagnes environnantes. Ensuite, la randonnée se poursuit sur une crête étroite et rocheuse, offrant une vue à 360 degrés sur les montagnes et la vallée en contrebas.
Le point culminant de la randonnée est le sommet des Rochers de Leschaux, qui offre une vue panoramique sur le Mont Blanc et le lac d''Annecy. La descente se fait ensuite vers "Ice Blow Hole", une formation rocheuse étonnante qui ressemble à un trou dans la roche, où le vent souffle constamment.
La randonnée se poursuit ensuite sur un chemin de crête, traversant des champs de fleurs alpines et offrant une vue imprenable sur les montagnes environnantes. Le chemin redescend ensuite dans la forêt, où il rejoint le point de départ.', 'Le Tour des Rochers de Leschaux est une randonnée de 8,5 km située sur le Plateau de Solaison en Haute-Savoie. Elle offre des vues panoramiques sur les montagnes environnantes et permet de découvrir des formations rocheuses étonnantes. La randonnée peut être réalisée en environ 2 heures.', 'https://www.visugpx.com/xoIBu2smMD?iframe'),
('La Tournette', '3 heures et 30 minutes', 12700, 1550, 2302, 1218, 4, 'Aller-retour', 3, 'Montmin', '45.831215, 6.263832', 'https://www.visugpx.com/download.php?id=U0GFzUG1n7', 'La randonnée de la Tournette commence généralement au chalet de l''Aulp, situé à environ 30 minutes en voiture d''Annecy. À partir de là, le sentier monte progressivement à travers la forêt, offrant des vues sur la vallée environnante.
Au bout d''environ 2 heures de marche, le sentier rejoint la crête et offre des vues spectaculaires sur le lac d''Annecy et les montagnes environnantes. La vue panoramique est à couper le souffle, avec des sommets enneigés à l''horizon.
Le sentier continue ensuite sur la crête, traversant des zones rocailleuses et exposées. Il faut faire preuve de prudence sur ces sections, surtout si les conditions météorologiques sont mauvaises.
Après un peu plus de 2 heures de marche, le sentier atteint le sommet de la Tournette, culminant à 2302 mètres d''altitude. Le panorama depuis le sommet est absolument époustouflant, avec des vues à 360 degrés sur les Alpes françaises.
Le retour s''effectue par le même sentier, en suivant la crête jusqu''au chalet de l''Aulp. La randonnée complète prend environ 3 à 4 heures, avec une distance totale d''environ 12 km et un dénivelé positif d''environ 1500 mètres.', 'Prêt pour une randonnée inoubliable dans les Alpes françaises? Découvrez la Tournette, une des montagnes les plus emblématiques de la région d''Annecy. Cette randonnée offre des vues à couper le souffle sur le lac et les sommets environnants, ainsi qu''une expérience de randonnée unique pour tous les niveaux. Préparez-vous à vivre une expérience inoubliable en parcourant les sentiers de la Tournette.', 'https://www.visugpx.com/U0GFzUG1n7?iframe'),
('Le Lac de Pormenaz', '3 heures et 40 minutes', 13300, 1030, 1976, 1201, 4, 'En boucle', 6, 'Passy', '45.951173, 6.739291', 'https://www.visugpx.com/download.php?id=KG0ATWlp83', 'La randonnée commence au parking de Plaine Joux et suit un sentier à travers la forêt jusqu''au Lac Vert. En cours de route, vous pourrez admirer les vues spectaculaires sur la vallée en contrebas.
Après une pause pour profiter du paysage, la randonnée se poursuit vers les Chalets d''Ayères, où vous pourrez vous arrêter pour déjeuner ou pour admirer les vues sur les montagnes environnantes.
Le sentier continue ensuite vers le ravin de Monthieux, une gorge étroite bordée de falaises abruptes, où vous pourrez voir une cascade et une rivière cristalline. Ensuite, vous passerez devant le Lac de Laouchet, un autre joyau alpin, avec des eaux turquoise et des vues imprenables sur les sommets environnants.
La randonnée continue ensuite vers le Lac de Pormenaz, en passant par le chemin de La Chorde, où vous pourrez profiter des vues sur les Rochers des Fiz et l''imposante Pointe Noire, ainsi que sur le massif du Mont-Blanc.
Après avoir atteint le Lac de Pormenaz, vous pourrez vous arrêter pour vous rafraîchir, avant de commencer votre descente vers le parking de Plaine Joux.', 'Au cœur de la réserve naturelle de Passy se trouve le Lac de Pormenaz, une destination estivale incontournable offrant une sortie modulable à souhait. Cette balade familiale mène tranquillement au torrent du Souay et offre une vue imprenable sur les Rochers des Fiz et l''imposante Pointe Noire.', 'https://www.visugpx.com/KG0ATWlp83?iframe'),
('La Dent d''Oche', '1 heure et 40 minutes', 6400, 960, 2190, 1203, 4, 'Aller-retour', 5, 'Bernex', '46.346207, 6.707540', 'https://www.visugpx.com/download.php?id=gRzhsAyaOq', 'Je me suis réveillé tôt ce matin, impatient de partir à l''aventure dans les montagnes de la Haute-Savoie. J''avais entendu parler de la Dent d''Oche, un promontoire bien pointu offrant une vue à couper le souffle sur le lac Léman et les sommets du Chablais.
Je suis parti en direction du sentier qui mènerait à la Dent d''Oche, le cœur battant d''excitation. Le début du sentier était facile, traversant les alpages verdoyants qui s''étendaient à perte de vue. Je marchais tranquillement, profitant du paysage spectaculaire qui s''offrait à moi.
Mais à mesure que je m''approchais du refuge d''Oche, le paysage commençait à changer. Les alpages faisaient place à des rocailles et à des roches, et le sentier se transformait en un sentier plus difficile. Je continuais à avancer, grimpant des ressauts escarpés et sautant de pierre en pierre, me dirigeant vers la Dent d''Oche.
Enfin, j''ai atteint le refuge d''Oche, un impressionnant nid d''aigle perché sur les hauteurs de la montagne. J''ai fait une pause bien méritée, reprenant mon souffle et admirant la vue sur le paysage environnant.
Après cette pause, j''ai poursuivi l''ascension en direction du sommet de la Dent d''Oche. J''ai grimpé un couloir raide équipé de chaînes, où mes mains n''étaient pas inutiles. C''était un peu effrayant, mais je suis arrivé au sommet sans problème. La vue était absolument incroyable. J''ai pu admirer le lac Léman au nord, les sommets du Chablais au sud et la région de Gavot tout autour. Les bouquetins étaient là également, ajoutant à l''expérience sauvage de la randonnée.
Après avoir admiré la vue pendant un moment, j''ai commencé la descente, les jambes un peu fatiguées mais le cœur rempli de la beauté des montagnes. Cette randonnée à la Dent d''Oche restera à jamais gravée dans ma mémoire comme une expérience incroyable de découverte de la nature.', 'Découvrez la majestueuse Dent d''Oche, un promontoire pointu offrant un panorama à 360° sur le lac Léman et les sommets du Chablais. Le sentier efficace traversant les alpages mène au refuge d''Oche, impressionnant nid d''aigle, puis à un couloir raide équipé de chaînes. En haut, partagez le sommet avec les bouquetins et profitez de la vue époustouflante sur la région de Gavot.', 'https://www.visugpx.com/gRzhsAyaOq?iframe'),
('Le Lac de Tavaneuse', '3 heures et 20 minutes', 6800, 780, 1917, 1181, 3, 'En boucle', 5, 'Abondance', '46.25011, 6.72176', 'https://www.visugpx.com/download.php?id=WKkUcZTaEc', 'Au départ du sentier de randonnée, les alpages d''Ardens s''étendent à perte de vue, parsemés de fleurs multicolores et bordés de sommets enneigés. Le chemin serpente à travers les prés verdoyants et le paysage devient de plus en plus spectaculaire au fil de l''ascension.
À mesure que nous approchons du lac de Tavaneuse, le terrain devient plus escarpé et les sentiers plus techniques, offrant une vue plongeante sur les vallées environnantes. Nous avons même traversé quelques névés tardifs en chemin, ajoutant une touche supplémentaire d''aventure à notre randonnée.
Arrivés au bord du lac de Tavaneuse, nous avons été récompensés par un paysage à couper le souffle. Les eaux cristallines du lac reflétaient les sommets environnants, créant un tableau saisissant de beauté naturelle. Nous nous sommes arrêtés pour admirer le lac et nous reposer avant de continuer notre chemin.
La descente nous a réservé autant de surprises que la montée, avec des cascades spectaculaires à chaque tournant du sentier. Nous avons même eu la chance d''apercevoir quelques animaux sauvages, comme des chamois et des marmottes, évoluant en toute liberté dans leur environnement naturel.
Cette randonnée de 6,8 km a été l''occasion de découvrir la nature à l''état pur et de profiter de toutes les merveilles que la montagne peut offrir. Le parcours modéré nous a permis de profiter pleinement de chaque instant, sans pour autant nous épuiser, et nous avons terminé la randonnée avec la satisfaction d''avoir accompli un beau défi tout en étant ressourcés par la beauté du paysage.', 'Partez à la découverte d''un des plus beaux lacs du Chablais lors d''une randonnée en pleine montagne ! Des sommets élevés aux cascades en passant par les sentiers aériens et les prairies alpines, chaque instant de cette boucle de 6,8 km vous réserve des merveilles à découvrir. Ne manquez pas l''occasion de contempler la nature dans toute sa splendeur lors de votre ascension vers le magnifique lac de Tavaneuse.', 'https://www.visugpx.com/WKkUcZTaEc?iframe'),
('La Pointe de Chavasse', '4 heures', 9700, 770, 2012, 1458, 3, 'En boucle', 5, 'Taninges', '46.175154, 6.606456', 'https://www.visugpx.com/download.php?id=YhewtOAyI7', 'La randonnée débute à La Villiaz de Combafou, un petit village de montagne près de Taninges. Le départ se fait depuis le parking de l''église, où une indication pour le sentier de randonnée est visible. Le sentier monte rapidement et les premiers kilomètres sont assez raides. On traverse une forêt de conifères et de feuillus avant d''arriver au Col du Foron.
De là, on emprunte un sentier en direction du Col de Chalune. La montée est plus douce et la vue sur la vallée devient de plus en plus spectaculaire. Arrivé au Col de Chalune, on continue en direction du Col de Vésinaz, à 1802 mètres d''altitude. Le sentier traverse une prairie alpine et longe une crête, offrant une vue sur le massif du Mont Blanc à l''horizon.
Le sommet de la Pointe de Chavasse est maintenant en vue, à 2012 mètres d''altitude. L''ascension se fait par une crête rocheuse, avec quelques passages un peu plus techniques. Mais une fois au sommet, le panorama à 360 degrés est absolument à couper le souffle : le massif du Chablais, le Mont Blanc, les Dents du Midi, le lac Léman et le Mont Forchat, tout est visible.
Le retour se fait par un sentier différent, qui passe par les Châlets Blancs et le Col de la Bolirre. Le sentier est plus facile à descendre, mais offre toujours des vues impressionnantes sur les montagnes environnantes.
Au total, cette boucle de 10 kilomètres et 770 mètres de dénivelé est une randonnée exigeante mais gratifiante. Les paysages sont à couper le souffle et l''ascension jusqu''à la Pointe de Chavasse est une expérience inoubliable pour les amateurs de montagne.', 'Partez à l''aventure dans le Géoparc du Chablais en Haute-Savoie ! Cette randonnée vous emmènera de La Villiaz de Combafou à la Pointe de Chavasse, offrant une vue panoramique sur le massif du Chablais, le Mont Blanc et les Dents du Midi. Pour les plus intrépides, poursuivez votre parcours en traversant le Roc d''Enfer pour atteindre trois sommets. Un itinéraire exigeant mais gratifiant, avec des passages rocheux et des paysages à couper le souffle.', 'https://www.visugpx.com/YhewtOAyI7?iframe'),
('La Roche Parnal', '3 heures et 30 minutes', 7200, 699, 1896, 1040, 3, 'En boucle', 3, 'Orange', '46.02124, 6.32368', 'https://www.visugpx.com/download.php?id=v63ILibxNO', 'La randonnée à la Roche Parnal débute dans le petit hameau de Bellajoux, situé à quelques kilomètres de la ville d''Annecy. Après avoir garé la voiture sur le parking dédié, nous entamons la marche en direction du versant nord de la Roche Parnal.
Nous suivons un sentier qui serpente à travers les alpages verdoyants de Bellajoux, où les troupeaux de vaches paissent tranquillement. Nous profitons de la vue magnifique sur les montagnes environnantes, alors que le soleil commence à pointer timidement à travers les nuages.
Après une heure de marche, nous arrivons au pied du col du Freu. La montée est raide et éprouvante, mais nous sommes récompensés par une vue imprenable sur les sommets environnants. Nous atteignons enfin le col, où nous nous reposons quelques minutes pour reprendre notre souffle.
Nous entamons ensuite la montée dans le couloir est de la Roche Parnal. Le sentier est étroit et rocailleux, et nous devons parfois utiliser nos mains pour nous hisser sur les rochers. Après une montée soutenue, nous atteignons enfin l''arête nord de la Roche Parnal.
Nous progressons lentement sur l''arête, en prenant garde de ne pas glisser sur les pierres instables. La vue depuis le sommet est absolument spectaculaire : nous avons l''impression de dominer le massif des Bornes tout entier, avec ses montagnes et ses vallées à perte de vue.
Nous profitons de cet instant de calme et de contemplation, avant d''entamer la descente vers Bellajoux. Le sentier est moins abrupt que celui de la montée, mais nous devons tout de même faire attention à ne pas glisser sur les pierres.', 'Découvrez la majestueuse Roche Parnal et son panorama imprenable sur les Bornes. Empruntez un itinéraire varié, entre alpages et montées abruptes, pour atteindre son sommet dégagé et contempler ses falaises impressionnantes. Une aventure mémorable vous attend dans le versant nord austère de cette imposante masse rocheuse.', 'https://www.visugpx.com/v63ILibxNO?iframe'),
('L''aiguille du Midi', '1 heure et 40 minutes', 900, 0, 3842, 1035, 1, 'Aller-retour', 8, 'Chamonix', '45.918303, 6.870021', 'https://www.visugpx.com/download.php?id=3QQkGgZ0W5', 'L''ascension de l''Aiguille du Midi en téléphérique est une aventure inoubliable qui vous transporte dans les hauteurs vertigineuses des montagnes alpines.
Une fois arrivé au sommet, vous êtes émerveillé par la vue à couper le souffle qui s''offre à vous. Vous pouvez admirer les sommets alpins tels que le Mont Blanc, le Mont Maudit, le Mont Blanc du Tacul et bien d''autres encore. Cette expérience est unique en son genre et vous donne une perspective totalement différente sur les montagnes.
Ensuite, vous pouvez profiter de différentes activités une fois au sommet, comme la marche sur la passerelle du vide, une expérience à la fois effrayante et passionnante qui vous permet de marcher au-dessus du vide avec une vue à 360 degrés sur les montagnes environnantes. Vous pouvez également visiter le musée de l''Aiguille du Midi pour en apprendre plus sur la géologie et l''histoire de la montagne.
Enfin, vous pouvez vous détendre dans le restaurant panoramique en savourant une boisson chaude et des pâtisseries locales tout en admirant la vue incroyable.', 'Préparez-vous à vivre une expérience hors du commun en vous élevant jusqu''au sommet de l''Aiguille du Midi, à plus de 3 800 mètres d''altitude, grâce au téléphérique de Chamonix. Découvrez une vue panoramique à couper le souffle sur les sommets alpins et vivez des sensations fortes en marchant sur la passerelle du vide. L''aventure vous attend à l''Aiguille du Midi !', 'https://www.visugpx.com/3QQkGgZ0W5?iframe'),
('Le Lac de Machilly', '1 heure', 3000, 18, 519, 500, 1, 'En boucle', 10, 'Machilly', '46.1732, 6.3276', 'https://www.visugpx.com/download.php?id=pZCDG6dNEv', 'La promenade autour du lac de Machilly est une agréable balade à travers la campagne de Haute-Savoie. Le lac, qui s''étend sur environ 2,5 kilomètres, est entouré de verdure et offre de jolies vues sur les montagnes environnantes.
Le chemin de promenade est facilement accessible et est bien entretenu et parsemé de bancs pour permettre aux visiteurs de se reposer et de profiter de l''air frais et de la vue. Tout au long de la promenade, les visiteurs peuvent également admirer la faune et la flore locales, y compris les canards et les oiseaux qui vivent dans et autour du lac.
La promenade peut être parcourue à pied ou à vélo et nombreuses aires de repos et des tables de pique-nique sont disponibles tout au long de la promenade pour profiter d’un pique-nique.
Le lac de Machilly est un lieu de détente populaire pour les habitants de la région et les visiteurs, et est particulièrement fréquenté pendant les mois d''été pour permettre de profiter de la beauté naturelle de la Haute-Savoie.', 'Promenez-vous autour du lac de Machilly en Haute-Savoie pour profiter de superbes vues sur les montagnes environnantes.', 'https://www.visugpx.com/pZCDG6dNEv?iframe'),
('Le Lac du Vallon', '2 heures', 4800, 210, 1233, 1077, 1, 'Aller-retour', 5, 'Bellevaux', '46.2187, 6.55747', 'https://www.visugpx.com/download.php?id=bnPNCGWiWJ', 'Il était une fois, une belle journée ensoleillée où j''ai décidé de partir en randonnée vers le lac du Vallon et la cascade de la Diomaz près de Bellevaux. Je me suis préparé avec mon sac à dos, de l''eau et une collation, ainsi que mes chaussures de randonnée.
Le sentier était bien balisé et je me suis rapidement immergé dans la beauté de la nature. Les arbres verts et les fleurs colorées bordaient le chemin, créant une ambiance paisible et relaxante.
Au lac du Vallon, la vue était superbe avec les montagnes environnantes reflétées sur la surface calme du lac. Je me suis posé quelques minutes pour apprécier la beauté du paysage et prendre des photos.
La prochaine étape était la cascade de la Diomaz. Le chemin était un peu plus difficile, avec des pentes raides et des rochers glissants, mais cela en valait la peine. La cascade était magnifique, avec une eau cristalline tombant dans une piscine d''eau en contrebas. Je me suis approché pour sentir la fraîcheur de l''eau sur mon visage.
Après avoir profité de la cascade, j''ai commencé à redescendre. La descente était plus facile et j''ai pu profiter de la vue en sens inverse. En fin d''après-midi, je suis rentré chez moi, satisfait de cette belle journée en pleine nature.', 'Partez à l''aventure sur cet itinéraire très populaire, près de Bellevaux.
Considéré comme un parcours modéré, il faut un peu moins de 2h pour le parcourir', 'https://www.visugpx.com/bnPNCGWiWJ?iframe'),
('La Pointe de Marcelly', '5 heures', 18000, 1220, 1999, 1415, 4, 'En boucle', 5, 'Sommand', '46.16109, 6.5548', 'https://www.visugpx.com/download.php?id=XG1Xi2fhG1', 'La randonnée du Pic du Marcelly est une boucle de 18 km qui débute au parking de Sommand. Le sentier suit une montée douce à travers les pâturages du Praz-de-Lys, menant à un sommet nommé la pointe de la Couenasse. De là, les randonneurs peuvent admirer une vue panoramique de la Vallée de l''Arve et des montagnes environnantes.
Le sentier se poursuit à travers les crêtes et les vallées, offrant des vues sur les sommets environnants. Après quelques lilomètres de marche, les randonneurs atteignent le Lac du Roy, où ils peuvent faire une pause, puis continue jusqu''au sommet du Pic du Marcelly.
Depuis le sommet, les randonneurs peuvent admirer une vue à couper le souffle sur la Vallée de l''Arve, les montagnes environnantes et le Lac Léman au loin.
La descente est une promenade paisible à travers les forêts et les champs, avec des vues occasionnelles sur la vallée en contrebas. Les randonneurs finissent leur boucle au parking de Sommand.', 'Randonneurs, envie d''un défi accessible aux vues spectaculaires ? La boucle du Pic du Marcelly vous offre un voyage à travers les paisibles pâturages de Praz-de-Lys et les crêtes aériennes de la pointe de la Couenasse, tout en vous récompensant avec une vue imprenable sur la Vallée de l''Arve depuis le sommet. Ne manquez pas cette randonnée inoubliable !', 'https://www.visugpx.com/XG1Xi2fhG1?iframe'),
('Le Lac de Lessy', '3 heures et 30 minutes', 8600, 670, 1945, 1300, 3, 'Aller-retour', 3, 'Chinaillon', '45.974562, 6.453521', 'https://www.visugpx.com/download.php?id=VnlZB0z9R1', 'La randonnée débute au parking du col de la Colombière (1613m d''altitude). Le sentier est clairement indiqué par un panneau "Lac de Lessy". Le début du chemin est assez raide et se fait en forêt. Le sentier est balisé et facile à suivre.
Au bout d''environ une heure de marche, vous atteindrez les chalets de Lessy (1815m d''altitude), un endroit parfait pour faire une pause et admirer la vue sur les montagnes environnantes.
Après les chalets, la montée se poursuit en direction du lac de Lessy. La pente devient plus douce et vous traverserez plusieurs petits ruisseaux avant d''arriver au lac. Le paysage est splendide avec des vues imprenables sur les montagnes environnantes.
Le lac de Lessy (1945m d''altitude) est un endroit magnifique pour se reposer, pique-niquer et se détendre avant de revenir sur ses pas.
Pour le retour, il suffit de reprendre le même chemin en sens inverse.', 'La randonnée du lac de Lessy près de Chinaillon en Haute-Savoie offre une vue imprenable sur les montagnes environnantes. Cette randonnée de 3h30 heures aller-retour, d''une distance de 9 kilomètres et d''un dénivelé d’environ 700 mètres, est accessible aux randonneurs de tous niveaux. Le lac de montagne est un endroit idéal pour pique-niquer et se détendre avant de revenir sur ses pas.', 'https://www.visugpx.com/VnlZB0z9R1?iframe'),
('Le Lac de Plagnes', '1 heure', 2500, 130, 1204, 1175, 1, 'Aller-retour', 5, 'Abondance', '46.248820, 6.754352', 'https://www.visugpx.com/download.php?id=kRjZqnWERS', 'La promenade du lac de Plagnes est un joyau caché dans la belle région d''Abondance en Haute-Savoie. La balade facile de 2,5 km autour du lac est un véritable havre de paix pour les amoureux de la nature, où l''on peut se ressourcer en admirant l''eau qui reflète les montagnes environnantes.
Le lac de Plagnes est également réputé pour être un lieu de pêche très prisé, avec une grande variété de poissons, qui raviront les amateurs de la canne à pêche. Les enfants seront ravis d''observer les poissons nager sous l''eau.
Pour les sportifs, cette promenade est un excellent terrain de course à pied ou de randonnée. Un sentier facile suit le contour du lac, tandis qu''une trace plus escarpée permet d''accéder à une cascade qui se jette dans le lac, offrant une vue imprenable sur la chute d''eau et la nature environnante. En continuant plus haut, on rejoint le chemin principal à Cubourré.
La promenade du lac de Plagnes est une activité familiale idéale pour tous les amoureux de la nature, que ce soit pour une balade tranquille, une partie de pêche ou une randonnée plus sportive. Ce lieu enchanteur offre une vue imprenable sur les montagnes environnantes et est un véritable havre de paix pour les visiteurs qui souhaitent s''échapper du tumulte de la vie urbaine et se ressourcer dans la nature.', 'La promenade du lac de Plagnes près d''Abondance est une belle randonnée de 2,5 km autour d''un lac de montagne magnifique. Le sentier est facile et convient à toute la famille. Vous pourrez admirer de superbes vues sur les montagnes environnantes et profiter d''un cadre paisible et naturel.', 'https://www.visugpx.com/kRjZqnWERS?iframe'),
('Les Dents de Lanfon', '3 heures et 10 minutes', 11000, 1100, 1814, 761, 4, 'Aller-retour', 3, 'Alex', '45.879964, 6.230057', 'https://www.visugpx.com/download.php?id=gEL4svjJNV', 'Partons à la découverte de la randonnée menant aux Dents de Lanfon, à proximité de Menthon-Saint-Bernard. Le sentier débute au niveau de Les Villard-Dessus et prend la direction de la Cascade d''Alex. 
Tout au long de la marche, nous sommes accompagnés par le doux bruit du torrent qui suit notre chemin. Nous passons par les Chalets de l''Aulp, où nous faisons une pause pour apprécier la beauté des alpages. Puis nous atteignons le Col des Frêtes, offrant une vue imprenable sur le Lac d''Annecy.
Le sentier continue ensuite en contournant la Pointe sud des Dents de Lanfon, nous offrant d’autres vues sur le lac d''Annecy depuis un chemin en surplomb. Nous prenons notre temps pour apprécier la nature qui nous entoure et pour prendre des photos de ce magnifique panorama.
Le retour dans la forêt est agréable et nous offre des moments agréables avec la nature environnante.', 'Découvrez une randonnée éprouvante, mais gratifiante, à proximité d''Annecy. Ce sentier en boucle vous mènera à un belvédère à couper le souffle sur le lac d''Annecy. Etes vous prêt à relever le défi de cette randonnée pour une expérience inoubliable ?', 'https://www.visugpx.com/gEL4svjJNV?iframe'),
('Le Lac Blanc', '4 heures et 10 minutes', 8000, 990, 2352, 1470, 4, 'Aller-retour', 1, 'Tré-Le-Champs', '45.9968, 6.92647', 'https://www.visugpx.com/download.php?id=HFRzPo8mv3', 'La randonnée au Lac Blanc depuis Tré-le-Champ est une randonnée classique de la région de Chamonix, qui offre des vues spectaculaires sur le massif du Mont Blanc et les Aiguilles Rouges. Le départ de la randonnée se fait depuis le parking de la Flégère, situé à environ 20 minutes à pied de Tré-le-Champ.
Le sentier monte progressivement à travers les forêts d''épicéas et de mélèzes, avant de déboucher sur un plateau herbeux offrant une vue imprenable sur les montagnes environnantes. Le refuge du Lac Blanc se trouve à environ 2 heures de marche depuis le départ. Il offre un point de ravitaillement pour les randonneurs, ainsi que des vues magnifiques sur le massif du Mont Blanc et le lac.
Le lac lui-même est situé à une altitude d''environ 2 352 mètres, entouré de falaises abruptes et de sommets enneigés. Le bivouac est autorisé sur les rives du lac, à condition de respecter certaines règles (notamment de ne pas laisser de trace et de ne pas faire de feu). La nuit au bivouac offre une expérience unique et inoubliable, avec des vues sur les étoiles et le silence de la montagne.
Le retour se fait par le même sentier que l''aller, offrant des vues différentes sur les montagnes environnantes.', 'Le lac Blanc de Haute-Savoie est un magnifique lac d''origine glaciaire situé dans la vallée de Chamonix, entouré de sommets tels que l''Aiguille du Midi. Il est accessible depuis le téléphérique de la Flégère ou en randonnée depuis la vallée. La randonnée offre une vue panoramique imprenable sur les montagnes.', 'https://www.visugpx.com/HFRzPo8mv3?iframe'),
('Le Grammont', '5 heures', 12100, 1020, 2153, 1082, 4, 'Aller-retour', 5, 'Vouvry', '46.3382, 6.848297', 'https://www.visugpx.com/download.php?id=HyowI62iAs', 'Le point de départ de la randonnée est facilement accessible en voiture, et il y a un parking à proximité du lieu-dit Le Flon. Le sentier de randonnée commence par une montée régulière qui traverse une belle forêt de pins, avant d''atteindre le lac de Taney. Ce dernier est un site naturel préservé, entouré de montagnes et d''une beauté à couper le souffle.
Après une petite pause pour profiter du paysage, le sentier continue à travers les alpages et les pâturages de montagne. La montée devient plus raide, mais sans difficulté technique. Les derniers kilomètres de l''ascension se font sur l''arête du Grammont, offrant une vue imprenable sur le Léman, les massifs environnants et les vallées alpines.
Le point culminant de la randonnée est la croix du sommet, qui offre une vue panoramique à 360 degrés sur les montagnes environnantes et les vallées alpines. Le panorama s''étend du Mont Blanc jusqu''au Jura en passant par le Grand Combin et le Haut-Giffre.', 'Le Grammont, situé au cœur du Chablais, offre une randonnée pittoresque passant par le Lac de Taney, pour atteindre le sommet offrant une vue plongeante sur le Léman et un panorama sur les massifs alentours.', 'https://www.visugpx.com/HyowI62iAs?iframe'),
('La Route des Cascades', '1 heure et 30 minutes', 3000, 133, 702, 591, 2, 'En boucle', 3, 'Thônes', '45.89969, 6.29201', 'https://www.visugpx.com/download.php?id=wlpmcIO9oO', 'La Route des Cascades près de Thônes en Haute-Savoie est une randonnée inoubliable qui vous fera découvrir la beauté naturelle spectaculaire de la région. La randonnée commence à la cascade de Morette et suit une série de cascades à travers une forêt dense, offrant des vues incroyables sur les torrents d''eau qui s''écoulent en cascade à travers les rochers.
Le sentier de randonnée serpente le long du ruisseau à travers une série de passages qui permettent de voir des formations rocheuses et des cascades. Les passerelles en bois, les escaliers de pierre et les ponts suspendus ajoutent à l''aventure et créent une atmosphère de conte de fées.
La randonnée dure environ 2 heures et est classée comme facile. Le sentier est bien balisé et offre des options pour les randonneurs de tous les niveaux, avec des endroits pour se reposer et profiter des vues panoramiques. Cette randonnée est également très populaire auprès des familles avec enfants en raison de son accessibilité.
La randonnée se termine au sommet de la cascade de Tines, une cascade de 30 mètres qui offre une vue imprenable sur les montagnes environnantes et les vallées verdoyantes. Vous pouvez également explorer les grottes et les rochers autour de la cascade pour une expérience encore plus immersive.', 'Découvrez la beauté naturelle de la Haute-Savoie sur la Route des Cascades près de Thônes. Une randonnée époustouflante à travers des cascades et des paysages somptueux. L''aventure parfaite pour les amoureux de la nature et du plein air !', 'https://www.visugpx.com/wlpmcIO9oO?iframe'),
('Le Balcon des Mémises', '3 heures et 30 minutes', 9900, 640, 1667, 1165, 3, 'En boucle', 5, 'Thollon-Les-Mémises', '46.36989, 6.68904', 'https://www.visugpx.com/download.php?id=2zz02ivtUQ', 'Le Balcon des Mémises est une randonnée emblématique de la région offrant une vue imprenable sur le Léman, le Chablais et la chaîne du Jura. Le départ se fait depuis le parking de Creusaz et suit une boucle de 10 km avec 700 m de dénivelé.
Le parcours alterne entre sentiers en forêt, escalade aisée dans de gros blocs de rochers et balade le long des crêtes. Le point culminant de la randonnée est le pic des Mémises, qui offre un panorama spectaculaire sur la région.
En hiver, la boucle à raquettes par Creusaz est une alternative populaire offrant également une vue imprenable sur le Léman et le Chablais. Cette boucle est une excellente façon de découvrir la région sous un nouvel angle tout en pratiquant une activité hivernale amusante et accessible à tous.', 'Le Balcon des Mémises offre une magnifique randonnée estivale avec des sentiers en forêt, escalade aisée et balade le long des crêtes. En hiver, la boucle à raquettes par Creusaz offre une vue imprenable sur le Léman et le Chablais.', 'https://www.visugpx.com/2zz02ivtUQ?iframe'),
('Le Lac Vert', '45 minutes', 2000, 10, 1200, 1190, 1, 'En boucle', 1, 'Passy', '45.9499, 6.75307', 'https://www.visugpx.com/download.php?id=eFsqInGzhE', 'Le Lac Vert est un lac situé à Passy, en Haute-Savoie. Il est entouré d''une forêt dense et de hautes montagnes, dont le Mont Blanc, le plus haut sommet d''Europe de l''Ouest. Le lac est alimenté par les eaux des glaciers voisins, qui lui confèrent une couleur émeraude unique.
Le Lac Vert est un site classé depuis 1959 en raison de sa beauté naturelle exceptionnelle. Le lac et sa région environnante offrent un cadre idéal pour les promenades et les randonnées. Des sentiers pédestres balisés permettent de découvrir les richesses naturelles de la région, notamment les espèces de plantes et d''animaux qui y vivent.
La promenade autour du lac est une promenade facile et agréable qui peut être faite en famille ou entre amis. Le sentier fait environ 2 kilomètres de long et suit le contour du lac. Les visiteurs peuvent y découvrir la faune et la flore locales, ainsi que des vues panoramiques sur les montagnes environnantes. Des panneaux d''information le long du sentier donnent des explications sur la géologie, l''histoire et la faune et la flore de la région.
Pour ceux qui cherchent une promenade plus longue, il est possible de suivre le sentier de la Boucle du lac, qui offre une vue spectaculaire sur le Mont Blanc. Le sentier suit un parcours de 7,5 kilomètres à travers la forêt et les alpages, offrant des vues imprenables sur le lac et les montagnes environnantes.
Les promenades autour du Lac Vert offrent également la possibilité de pique-niquer dans un cadre naturel paisible. Des tables de pique-nique sont disponibles sur place pour ceux qui souhaitent se détendre et profiter de la vue.
En hiver, le Lac Vert offre une atmosphère de conte de fées avec ses eaux gelées et ses paysages enneigés. La promenade autour du lac est également possible en hiver, mais l''accès se fait à pied ou en raquettes, car la route est fermée aux voitures.', 'Le Lac Vert, joyau naturel classé près de Passy Plaine-Joux, offre un spectacle époustouflant. Bordé d''épicéas qui reflètent le majestueux Mont Blanc, ses eaux cristallines abritent une accumulation d''arbres et de végétaux visibles grâce à leur transparence. Le tout, surplombé d''une couleur vert émeraude envoûtante. Accessible à tous, c''est un lieu de promenade idéal en toutes saisons.', 'https://www.visugpx.com/eFsqInGzhE?iframe'),
('Le Lac de Peyre', '2 heures et 40 minutes', 5000, 550, 2085, 1617, 2, 'Aller-retour', 2, 'Col de la Colombière', '45.99222, 6.47554', 'https://www.visugpx.com/download.php?id=GFdJVap1oC', 'La randonnée jusqu''au Lac de Peyre est une excursion incontournable pour ceux qui recherchent une balade facile mais spectaculaire en montagne. Niché au cœur du massif des Aravis, le lac se trouve à environ 2 heures de marche depuis le parking de la Balme de Thuy.
Le sentier bien balisé suit une pente raide pendant environ 45 minutes jusqu''à ce que vous atteigniez le Col de Balafrasse. Cette partie de la randonnée peut être difficile pour certains, mais la beauté des paysages environnants vous récompensera pour vos efforts. Le Col de Balafrasse offre une vue imprenable sur les montagnes environnantes et les vallées en contrebas.
Une fois que vous avez atteint le col, vous pouvez vous reposer et profiter de la vue avant de poursuivre votre marche. Le sentier continue ensuite à travers un paysage de roches et de pentes douces avant de descendre vers le lac. Le chemin se fait au milieu de gros blocs de rochers, donnant une impression de marcher dans un labyrinthe.
Le Lac de Peyre est une destination de rêve pour les familles avec enfants, car le sentier est facile et ne présente pas de difficultés particulières. Le lac est entouré d’herbes où vous pouvez vous détendre et pique-niquer tout en admirant les sommets environnants. Les eaux cristallines du lac invitent également les plus courageux à une baignade rafraîchissante en été.', 'Le Lac de Peyre est une destination idéale pour les familles en quête d''une balade facile mais spectaculaire. Le sentier bien balisé, malgré sa raideur, offre un accès facile au lac entouré de gros blocs de rochers, faisant de cette excursion un beau challenge.', 'https://www.visugpx.com/GFdJVap1oC?iframe'),
('Le Pic de Jalouvre', '2 heures et 50 minutes', 5500, 746, 2366, 1611, 3, 'Aller-retour', 2, 'Col de la Colombières', '45.99239, 6.47588', 'https://www.visugpx.com/download.php?id=1pcMYzJI4K', 'La randonnée débute au niveau d''un lacet de la route qui mène au col de Colombière.
Le sentier démarre doucement puis devient de plus en plus abrupt, traversant des pierriers et des barres rocheuses jusqu''à atteindre le Col du Rasoir, point de jonction entre le Pic du Jalouvre et la Pointe Blanche. La descente se fera dans un pierrier raide, en passant sous les Dents du Jalouvre et en rejoignant le Col de Sosay. 
De là, il est possible d''admirer le lac de Lessy et de descendre en suivant le sentier qui passe par les Chalets de Lessy. Après avoir contourné le lac par la droite, le sentier monte en direction du Col de la Forclaz. De la, un petit sentier peu incliné vous fera traverser un pierrier et le flanc de l''aiguille verte, puis le sentier s''élèvera sur la droite. La descente se fera à travers l''alpage, en passant par une Via Ferrata jusqu''à retrouver le parking après une longue traversée sous une grosse barre rocheuse sur le flanc du Pic du Jalouvre.', 'Cette randonnée de 5,5 km sur des sentiers alpins et rocheux offre des vues spectaculaires et une opportunité d''observer la faune, en particulier les bouquetins. 
Attention cependant, le dénivelé et le passage délicat via un pierrier raide jusqu''au Col du Rasoir la rendent difficile et déconseillée par temps de pluie.', 'https://www.visugpx.com/1pcMYzJI4K?iframe'),
('La Pointe de Miribel', '1 heure', 2700, 170, 1588, 1416, 1, 'Aller-retour', 5, 'Habère-Poche', '46.205112, 6.472886', 'https://www.visugpx.com/download.php?id=7SB6k2xgKV', 'Le sentier menant à la Pointe de Miribel depuis les Chalets d’Ajon est bien balisé et offre une vue imprenable sur le sommet depuis le parking. Au Calvaire de Miribel, juste avant d''atteindre le sommet, le chemin devient plus rocailleux. Depuis le sommet, la vue sur les montagnes environnantes est spectaculaire, donnant envie de planifier de futures randonnées.
Pour la descente, il suffit de reprendre le même chemin emprunté pour monter.', 'La Pointe de Miribel, dans la Vallée verte, est une randonnée facile avec une vue imprenable sur les alpages et les sommets environnants. Ce sommet isolé offre un panorama étendu sur le Léman et les massifs de Haute-Savoie jusqu''au Mont Blanc, idéal pour une remise en jambe de début de saison.', 'https://www.visugpx.com/7SB6k2xgKV?iframe'),
('La pointe de Lachau', '1 heure et 40 minutes', 4900, 440, 1962, 1511, 2, 'En boucle', 5, 'Abondance', '46.306958, 6.743061', 'https://www.visugpx.com/download.php?id=MN2BPoZmLA', 'La randonnée ne nécessite pas de compétences particulières. 
C''est une belle balade pour profiter de la nature et des panoramas spectaculaires.
Le sentier de la Pointe de Lachau commence à droite des chalets d''alpage et mène au col d''Ubine en 40 minutes, offrant une vue sur les Cornettes de Bise. 
De là, sur la gauche vers la Pointe de Lachau, la montée devient raide et étroite, nécessitant de regarder où l''on met les pieds. 
Le sommet offre une vue à 360° sur les montagnes environnantes. 
La descente suit la crête avec une vue sur le lac de la Fontaine et les chalets de Bise. Le sentier peut être aérien par endroits, donc faites attention si vous avez le vertige. 
Enfin, le sentier de l’aller se situe sur la gauche en direction du Mont Blanc.', 'La Pointe de Lachau, petite montagne des Alpes, offre une randonnée accessible avec une vue imprenable sur les Cornettes de Bise, le Mont Chauffé, la Dent d''Oche et la pointe de Bénévent. La dernière partie de l''arête est un peu raide, mais la balade permet de découvrir un paysage d''alpage au pied du Mont Chauffé. Un lieu idéal pour une escapade nature et une vue à 360° sur les montagnes alentour.', 'https://www.visugpx.com/MN2BPoZmLA?iframe'),
('Le Désert de Platé', '2 heures', 8600, -914, 2543, 1639, 2, 'Aller-retour', 2, 'Flaine', '46.005946, 6.695744', 'https://www.visugpx.com/download.php?id=C5KfOOYUWc', 'Le désert de Platé est une région unique située dans les Alpes françaises, plus précisément dans la Haute-Savoie, à une altitude de 2200 mètres. Ce qui le rend unique, c''est qu''il s''agit d''un plateau désertique qui s''étend sur plusieurs kilomètres, avec des rochers, des pierres et des falaises abruptes.
Sur le plan géologique, le plateau de Platé est formé de roches calcaires qui se sont déposées il y a environ 150 millions d''années. Au fil du temps, l''érosion a sculpté le plateau et a créé les falaises et les gorges qui le caractérisent.
Le désert de Platé est également célèbre pour ses nombreuses grottes et cavités souterraines, dont certaines sont les plus grandes d''Europe. Ces grottes sont le résultat de l''érosion karstique, un phénomène où l''eau de pluie dissout le calcaire pour créer des cavités souterraines.
L''histoire du désert de Platé est liée à l''activité pastorale, avec des troupeaux de moutons qui paissaient sur le plateau pendant des siècles. Aujourd''hui, le plateau est principalement utilisé pour les activités de loisirs comme la randonnée, l''escalade et le ski de randonnée en hiver.
En raison de sa beauté naturelle et de son caractère unique, le désert de Platé est classé comme site naturel remarquable depuis 1942 et fait partie du Parc Naturel Régional du Massif des Bauges.', 'Le désert de Platé est un plateau désertique unique situé dans les Alpes françaises, caractérisé par des falaises abruptes et des grottes souterraines. Formé il y a environ 150 millions d''années, il est classé comme site naturel remarquable.', 'https://www.visugpx.com/C5KfOOYUWc?iframe'),
('La Pointe de Jottis', '2 heures et 20 minutes', 7000, 510, 1548, 980, 2, 'Aller-retour', 5, 'Megevette', '46.217190, 6.510175', 'https://www.visugpx.com/download.php?id=0qBWxrRlbP', 'Le sentier, empruntant le Tour des Crêtes de Bellevaux, est facile et accessible à tous, même aux débutants. La première partie du parcours est assez soutenue dans la forêt, puis il y a un long passage relativement plat dans le Pâturage des Jottis, avant une courte montée raide pour atteindre le sommet.
Le nom "Jottis" provient des plantes que l''on trouve en abondance dans les pâturages en contrebas, comme la moutarde des champs ou la bette. C''est un lieu unique et préservé qui ravira les amoureux de la nature et de la faune locale, notamment les chamois et les marmottes que l''on peut apercevoir en chemin.
Le trajet aller-retour mesure 7 km avec un dénivelé cumulé de 520 mètres, et peut être parcouru en 2 heures environ. La randonnée débute depuis le hameau du Châtelet, près de Mégevette. Suivez la petite route qui monte à droite panneautée "Le Châtelet" jusqu''au terminus. Le sentier est bien balisé et facile à suivre, il vous emmènera jusqu''au sommet de la Pointe des Jottis où vous pourrez profiter de la vue à couper le souffle.
Cette randonnée est idéale pour la remise en jambes ou l''entraînement de début de saison. Elle convient parfaitement pour une journée de détente en famille ou entre amis. En automne, les couleurs des arbres et des paysages environnants ajoutent une touche supplémentaire à cette randonnée inoubliable.', 'Située dans la région du Chablais, non loin de la station d''Hirmentaz, la Pointe des Jottis est une randonnée à faire absolument pour tous les amateurs de nature et de belles vues. Avec ses 1548 mètres d''altitude, elle offre une vue imprenable sur le lac Léman et les sommets environnants.', 'https://www.visugpx.com/0qBWxrRlbP?iframe'),
('Les Fermes du Maroly', '1 heure et 50 minutes', 5000, 210, 1460, 1330, 2, 'En boucle', 2, 'Le Grand Bornand', '45.977939, 6.469398', 'https://www.visugpx.com/download.php?id=RXvIUflpmK', 'La randonnée en raquettes "Les Fermes du Maroly" est une balade idéale pour les familles ou les personnes qui recherchent une expérience de randonnée hivernale tranquille et pittoresque. Elle commence au hameau de "Les Bouts", situé à proximité de la station de ski de Chinaillon.
Le parcours, d''une longueur de 5 km et d''un dénivelé de 200 mètres, suit un chemin bien balisé qui serpente à travers des prairies enneigées et des forêts de conifères. En chemin, les randonneurs peuvent admirer les fermes traditionnelles de la région, certaines datant de plusieurs siècles.
Les vues panoramiques sur les montagnes environnantes, notamment les Aravis, sont impressionnantes tout au long de la randonnée. Les randonneurs peuvent également apprécier le calme et la sérénité de la nature hivernale.
Cette randonnée est accessible à tous les niveaux et peut être accomplie en quelques heures. Les raquettes sont nécessaires pour parcourir la neige profonde et glissante, mais elles peuvent être louées dans les magasins de sports à proximité.', 'Une randonnée paisible dans l''alpage de Maroli offre des vues panoramiques exceptionnelles sur les Aravis et les massifs avoisinants. Le Crêt des Annes, en crête, offre une vue spectaculaire et les lacs artificiels de Maroly et de la Cour ajoutent également de la beauté à la région.', 'https://www.visugpx.com/RXvIUflpmK?iframe'),
('La Pointe de Beauregard', '2 heures et 30 minutes', 6900, 280, 1633, 1452, 2, 'En boucle', 2, 'Manigod', '45.87694, 6.40512', 'https://www.visugpx.com/download.php?id=pZhT3ErwUl', 'La randonnée en raquettes sur le Plateau et la Pointe de Beauregard offre de belles vues sur le Massif des Aravis et du Bargy et est accessible à tous.
Le parcours facile avec un dénivelé d''environ 270 mètres est accessible à tous.
Le sentier débute au Col de la Croix Fry, situé sur les hauteurs de La Clusaz.
La randonnée commence dans une forêt de sapins offrant des vues sur le massif de l’Étale et la chaîne du Mont-Blanc.
Le sentier se poursuit à travers la forêt avant d''arriver sur le Plateau de Beauregard où se trouve le domaine de ski de fond. L''ascension vers la Pointe de Beauregard devient un peu plus raide après deux petits chalets. Ensuite, le sentier mène jusqu''au gros chalet des Vaunessins, remarquable pour sa façade « à l''ancienne ». 
La descente se fait en suivant le sentier fléché « Croix Fry », qui permet de rejoindre le tracé de l''aller pour retourner au parking.', 'Découvrez la beauté de la nature enneigée du Massif des Aravis en vous offrant une balade hivernale sur le Plateau et la Pointe de Beauregard. Accessible à tous, cette randonnée en raquettes offre des vues à couper le souffle sur les paysages environnants.', 'https://www.visugpx.com/pZhT3ErwUl?iframe'),
('Le Tour des Fiz', '13 heures et 20 minutes', 51000, 3356, 2354, 1000, 5, 'En boucle', 6, 'Passy', '45.951173, 6.739291', 'https://www.visugpx.com/download.php?id=RHiMoNknKP', 'Le tour des Fiz est une randonnée incontournable pour les amateurs de montagne et les amoureux de la nature. Ce trek de trois jours permet de découvrir les paysages alpins exceptionnels de la région de la Haute-Savoie. Voici un récapitulatif de cette randonnée de trois jours.
Le premier jour, le départ est donné de la station de ski de Plaine-Joux. La randonnée commence par la traversée du magnifique lac vert et des chalets d''Ayères. Ensuite, le chemin se poursuit en direction des chalets du Souay et du Lac de Pormenaz, avant d''atteindre le Refuge d''Anterne pour passer la nuit au bord du Lac d''Anterne.
Le deuxième jour commence avec une montée difficile vers le Col d''Anterne, situé à une altitude de 2 257 mètres. Depuis le col, on peut admirer des vues imprenables sur les montagnes environnantes. La descente mène ensuite au Refuge des Fonts et à la cascade du Rouget. Ensuite, les randonneurs poursuivent leur chemin vers le Chalet de Sales et le Dérochoir, avant de grimper jusqu''au Col de la Portette pour y passer la nuit dans une tente près du Chalet de Platé.
Le troisième jour est le dernier jour de la randonnée. Les randonneurs traversent le désert de Platé, avant de redescendre vers la station de Plaine-Joux pour clôturer le tour des Fiz. Cette randonnée est une expérience inoubliable pour les amateurs de nature, de montagne et de randonnée.', 'Partez à la découverte des Fiz lors de ce trek de 3 jours. Admirez des paysages magnifiques, des lacs alpins et des sommets majestueux tout en parcourant les sentiers de randonnée. Une expérience à ne pas manquer pour les amoureux de la nature et des sports de plein air.', 'https://www.visugpx.com/RHiMoNknKP?iframe'),
('Trail de Gets', '5 heures et 20 minutes', 35670, 2089, 1880, 1056, 5, 'En boucle', 5, 'Les Gets', '46.161948, 6.673159', 'https://www.visugpx.com/download.php?id=wkBbm8Obcy', 'Le trail des Gets est une épreuve incontournable pour les amateurs de course en montagne. Cette course de 36 kilomètres propose un parcours technique et exigeant, qui mettra à l''épreuve la résistance physique et mentale des coureurs.
Ce trail est une expérience unique qui nécessite une préparation physique et mentale adéquate. Les coureurs doivent être en mesure de gérer leur effort tout au long de la course et de s''adapter aux conditions changeantes du terrain.
Le départ du Trail Long des Gets a lieu sur le versant du Mont Chéry, dans un cadre sauvage et préservé, offrant des paysages à couper le souffle. 
Les coureurs traverseront des alpages et des sentiers de crête offrant des vues imprenables sur le Mont Blanc et le Roc d''Enfer.
Le parcours comprend également des passages en sous-bois, qui ajoutent un niveau de difficulté supplémentaire à la course. Les coureurs doivent être vigilants et concentrés pour éviter les obstacles et les surfaces glissantes.', 'Le Trail des Gets permet de se dépasser tout en découvrant les merveilles du terrain gétois : alpages, crêtes avec vue sur le Mont Blanc et le Roc d''Enfer, passages en sous-bois. Le trail se déroule sur le versant du Mont Chéry et autour du Roc d''Enfer, offrant un terrain montagneux technique et roulant.', 'https://www.visugpx.com/wkBbm8Obcy?iframe'),
('Le Lac Bleu', '2 heures', 7000, 36, 698, 668, 1, 'Aller-retour', 7, 'Morillon', '46.086818, 6.679317', 'https://www.visugpx.com/download.php?id=qyE9pSj7JP', 'Située dans la vallée de Giffre, la promenade du Lac Bleu est une destination idéale pour une journée en famille.
En été, avec ses eaux cristallines et ses forêts mixtes d''épicéas et de hêtres, cette promenade offre un cadre paisible et pittoresque pour une balade tranquille, un pique-nique ou une baignade rafraîchissante.
Pendant l''hiver, la promenade du Lac Bleu se transforme en une expérience magique. Le lac gelé et la neige fraîche ajoutent une beauté naturelle à cette promenade pittoresque, offrant un cadre parfait. 
La passerelle de La R''Biolle et les bois de L''Etelley ajoutent une touche de charme supplémentaire à cette balade, qui est sans doute l''une des plus fréquentées de la vallée.', 'Cette promenade est sans conteste la plus fréquentée de la vallée. Outre les lacs de Samoëns et de Morillon elle permet d’accéder aux très belles berges du Giffre, non loin de la passerelle de La R’Biolle.', 'https://www.visugpx.com/qyE9pSj7JP?iframe'),
('Le Roc d''Enfer', '6 heures et 20 minutes', 33200, 2302, 2243, 963, 5, 'En boucle', 5, 'Bellevaux', '46.242021, 6.526950', 'https://www.visugpx.com/download.php?id=qtYi8ZErjB', 'La randonnée débute à "Jambaz de ça", situé dans la commune de Bellevaux en Haute-Savoie. Elle fait une boucle de 33 km avec un dénivelé de 2300 mètres. 
Le départ se fait tranquillement sur un chemin de terre jusqu''à l''arrivée au Col des Betets qui se trouve à une altitude de 1748 mètres. Cette montée initiale peut être assez raide, il est donc important de ne pas partir trop vite.
Après une courte pause pour admirer la vue sur les montagnes environnantes, la randonnée se poursuit vers la Tête des Follys. Il s''agit d''une montée assez technique avec quelques passages escarpés qui nécessitent de l''attention. À 2000 mètres d''altitude, la vue sur les sommets environnants est spectaculaire. La randonnée continue ensuite le long de l''Arête des Follys qui offre une vue panoramique sur les montagnes environnantes.
Le second point culminant de cette randonnée est la Haute Pointe, située à 2192 mètres d''altitude. Cette montée peut être assez difficile, mais la vue panoramique sur les montagnes environnantes en vaut la peine. La descente se fait ensuite en direction du Col de Vesnaz qui se situe à une altitude de 1615 mètres.
Le Roc d''Enfer est le point culminant de cette sortie, c''est un sommet qui culmine à 2243 mètres d''altitude et qui offre une vue imprenable sur le paysage environnant. La randonnée se poursuit ensuite en direction du Col de Graydon qui se situe à une altitude de 1697 mètres. 
Le retour jusqu''au point de départ est plus calme et permet de se remettre de cette sortie éprouvante
Cette randonnée offre une vue imprenable sur les montagnes environnantes et est accessible aux randonneurs expérimentés.', 'Cette randonnée de 33 km en Haute-Savoie offre des panoramas spectaculaires sur les montagnes environnantes, notamment depuis la Tête des Follys et la Haute Pointe. 
Préparez-vous pour une journée de défis et de paysages à couper le souffle !', 'https://www.visugpx.com/qtYi8ZErjB?iframe'),
('Trail Coupardine', '4 heures et 50 minutes', 24960, 1879, 1996, 1032, 5, 'En boucle', 3, 'Orange', '46.02124, 6.32368', 'https://www.visugpx.com/download.php?id=pRbs2ZxjPb', 'Le trail Coupardine est une aventure mémorable qui offre des sentiers variés et des vues spectaculaires sur les montagnes environnantes. Il est recommandé d''être en bonne condition physique et de bien se préparer avant de partir à l''aventure. La prudence est également de mise lors de la randonnée. Alors, chaussez vos chaussures de trail et venez explorer cette merveille de la Haute-Savoie !
Votre randonnée commencera par l''ascension de la montagne "Sur Cou", où des sentiers techniques et exigeants s''offriront à vous. Vous pourrez admirer les Alpes et le lac Léman depuis son sommet, qui offre une vue panoramique à couper le souffle. Le parcours est exigeant et technique, avec quelques passages qui peuvent représenter un défi pour les randonneurs les plus expérimentés.
En poursuivant votre route vers la montagne Roche Parnal, vous découvrirez un paysage de montagne à couper le souffle, avec des alpages verdoyants et des falaises impressionnantes. L''itinéraire vous fera passer par des montées abruptes pour atteindre le sommet dégagé de la Roche Parnal, qui offre un panorama imprenable sur les Bornes. 
Enfin, la majestueuse montagne Sous Dine vous offrira des sentiers variés à travers des forêts verdoyantes et des crêtes escarpées. Vous pourrez découvrir une vue panoramique à 360 degrés sur les massifs environnants, avec notamment le Mont Blanc en toile de fond.', 'Coupardine est un trail qui vous emmènera au cœur des montagnes du massif des Bornes et des Glières, avec un panorama à vous couper le souffle. 
Une vue à 360° depuis les sommets de Sur Cou, La Roche Parnal et Sous Dine, d’où vous pourrez admirer la vallée de l’Arve (du lac Léman jusqu’au Mont Blanc) en passant également par le massif du Bargy et la chaîne des Aravis.', 'https://www.visugpx.com/pRbs2ZxjPb?iframe'),
('Tour des Fiz (à la journée)', '10 heures', 38700, 2920, 2345, 1217, 5, 'En boucle', 6, 'Passy', '45.9499, 6.75307', 'https://www.visugpx.com/download.php?id=6l7bs9v0mz', 'La randonnée au départ de Plaine Joux en Haute-Savoie est une aventure époustouflante avec des vues panoramiques à couper le souffle. Le parcours de 39 km et un dénivelé de 2900 m offre un défi difficile mais gratifiant pour les randonneurs expérimentés.
Le parcours commence par une montée au Col de Barmerousse offrant une vue imprenable sur la vallée. Ensuite, les randonneurs atteignent les chalets de Plate avant de continuer leur ascension vers le Col de la Portette, un autre point de vue incroyable.
Le chemin passe par le dérochoir et les chalets de Sales avant d''arriver aux Collets d''Anterne. La vue sur le Lac d''Anterne est à couper le souffle.
Le parcours se poursuit vers le Lac de Pormenaz puis par les chalets d''Ayères et le Lac Vert avant de revenir au point de départ.', 'Ce trail offre une expérience inoubliable avec des vues panoramiques spectaculaires tout au long du parcours. C''est un défi difficile mais gratifiant pour ceux qui cherchent à explorer les montagnes de Haute-Savoie.', 'https://www.visugpx.com/6l7bs9v0mz?iframe'),
('Ultra Tour du Môle', '8 heures et 30 minutes', 31360, 3113, 1847, 493, 5, 'En boucle', 5, 'Marignier', '46.091883, 6.500080', 'https://www.visugpx.com/download.php?id=E3P3snoAEw', 'Cette course de trail est connue pour son parcours exigeant, technique et très montagneux, offrant des vues magnifiques sur les montagnes environnantes.
Le départ de la course est situé à Marignier.
Le trail commence par une montée raide vers la Croix, située à une altitude de 1847 mètres. Cette première montée est assez exigeante et offre une vue imprenable sur les montagnes environnantes.
Une fois au sommet de la Croix, c''est parti pour la descente vers la Tour, en passant par Plan Meulet. Cette partie de la course est très technique, avec des sentiers étroits et rocailleux, nécessitant une grande attention.
Après la descente à la Tour arrive la remontée vers le Petit Môle. Cette montée est également assez exigeante, avec des passages techniques et des pentes raides.
Une fois au Petit Môle, retour vers la Croix pour des retrouvailles qui piquent les cuisses. Cette ultime montée n’est pourtant pas la dernière difficulté du parcous
Arrivée à la Croix, l''heure de la dernière descente de la course est arrivée avec le retour à Marignier.', 'L''UTM : « ultra tour du môle » est une course exigeante de 32 km pour un dénivelé positif de 3200 mètres, ce qui en fait un trail quasi unique en son genre.
Malgré ses caractéristiques, la variété sera au rendez vous : du bitume sur quelques kilomètres, du single à plat, de la piste forestière, une descente de 1400 mètres pour son final, ou du « dré dans l''pentu » !! Voilà qui devrait satisfaire les amateurs de trail complet.', 'https://www.visugpx.com/E3P3snoAEw?iframe'),
('Trail des Glières', '10 heures et 50 minutes', 41400, 2790, 1996, 657, 5, 'En boucle', 3, 'Thorens Glières', '45.997178, 6.252834', 'https://www.visugpx.com/download.php?id=tY4dfYY6zi', 'On commence par explorer la forêt domaniale de la Haute Filière, puis on grimpe à travers les lapiaz.
Si l''on vous avait dit que vous auriez la tête dans les nuages, c''est parce que vous allez passer par trois sommets : le plateau des Glières, culminant à 1600 mètres, la tête du Parmelan à 1800 mètres, et enfin, la montagne de Sous-Dine à 2000 mètres.
Cette dernière est aisément reconnaissable grâce à ses falaises sur la façade nord et son immense plateau herbeux.
Une fois au sommet, profitez du panorama que vous offre l''altitude et vous vous sentirez comme le roi ou la reine du monde ! 
Vous pourrez admirer une vue imprenable sur les sommets enneigés (ou non) du Jura et des Alpes.
Outre les sommets, il est également recommandé de voir le Pas du Roc, avec ses sentiers à flanc de falaise qui offrent une ascension originale. 
Sur le plateau calcaire des Glières, il y a même un peu d''histoire à découvrir en passant devant la monumentale sculpture rendant hommage à un mouvement résistant de la région pendant la guerre.', 'Tu en as un peu assez du plat des trails urbain ? Avec cette course, tu auras la tête dans les nuages.', 'https://www.visugpx.com/tY4dfYY6zi?iframe'),
('Trail des Voirons', '3 heures', 20290, 1248, 1492, 524, 5, 'En boucle', 10, 'Bonnes', '46.170961, 6.324607', 'https://www.visugpx.com/download.php?id=4nKrkcxMq1', 'Le Trail des Voirons est une aventure épique de 20 km qui vous fera découvrir les merveilles de la région. Avec un dénivelé de 1250 mètres, cette boucle est une véritable épreuve pour les amateurs de trail. Au départ de la mairie de Bonne, direction la route de la grange de Boege. C''est ici que commence le véritable défi, avec la montée ardue jusqu''au Crêt des Fenils. Les jambes brûlent, le souffle se fait court, mais le paysage grandiose qui s''offre à vous en haut de la colline en vaut la peine.
Le parcours continue ensuite vers le Col du Prieuré, avant d''atteindre le sommet tant attendu : le Signal des Voirons. Une vue à couper le souffle vous attend ici, avec un panorama à 360 degrés sur les montagnes et les vallées environnantes. Le sentiment d''accomplissement est indescriptible.
La descente commence ensuite, avec le Col du Pralere et Notre-Dame du Pralere comme points de passage, avant de se poursuivre sur le chemin des Loies. La dernière ligne droite se dessine alors en ligne de mire. Les derniers kilomètres se font dans la douleur, mais la fierté de terminer cette boucle difficile est immense.', 'Prêt à relever le défi du Trail des Voirons ? Ce parcours de 20km exigeant vous emmènera de Bonne jusqu''au sommet du Signal des Voirons. Mettez votre entraînement à l''épreuve et découvrez les paysages époustouflants de cette région lors de cette aventure inoubliable !', 'https://www.visugpx.com/4nKrkcxMq1?iframe');


INSERT INTO "tag_has_trek" ("trek_id", "tag_id") VALUES
(1, 4),
(2, 4),
(2, 2),
(3, 10),
(3, 2),
(4, 4),
(4, 2),
(5, 10),
(5, 2),
(6, 4),
(7, 4),
(7, 1),
(8, 4),
(8, 1),
(9, 4),
(10, 4),
(10, 2),
(11, 4),
(12, 4),
(13, 4),
(13, 3),
(14, 4),
(14, 9),
(15, 4),
(16, 4),
(16, 3),
(17, 4),
(18, 4),
(19, 4),
(19, 1),
(19, 9),
(20, 4),
(20, 1),
(21, 4),
(22, 4),
(22, 1),
(22, 3),
(23, 4),
(24, 4),
(25, 10),
(25, 2),
(26, 6),
(26, 1),
(27, 10),
(27, 1),
(27, 3),
(28, 4),
(28, 1),
(29, 4),
(29, 1),
(30, 6),
(30, 1),
(31, 4),
(32, 7),
(32, 1),
(33, 4),
(34, 10),
(34, 3),
(35, 4),
(35, 2),
(36, 6),
(36, 1),
(37, 4),
(37, 1),
(37, 2),
(38, 4),
(39, 10),
(39, 9),
(40, 4),
(41, 10),
(42, 4),
(43, 10),
(43, 2),
(44, 10),
(44, 2),
(44, 9),
(45, 7),
(45, 4),
(45, 1),
(46, 5),
(47, 10),
(47, 2),
(48, 5),
(49, 5),
(49, 8),
(50, 5),
(50, 8),
(51, 5),
(51, 8),
(51, 2),
(51, 9),
(52, 5),
(52, 8),
(52, 2),
(53, 5),
(1, 13),
(2, 12),
(3, 12),
(4, 12),
(5, 12),
(6, 13),
(7, 12),
(8, 14),
(9, 14),
(10, 13),
(11, 13),
(12, 13),
(13, 13),
(14, 14),
(15, 14),
(16, 12),
(17, 14),
(18, 13),
(19, 14),
(20, 14),
(21, 14),
(22, 13),
(23, 13),
(24, 13),
(25, 11),
(26, 11),
(27, 12),
(28, 14),
(29, 13),
(30, 11),
(31, 14),
(32, 14),
(33, 14),
(34, 12),
(35, 13),
(36, 11),
(37, 12),
(38, 13),
(39, 11),
(40, 12),
(41, 12),
(42, 12),
(43, 12),
(44, 12),
(45, 14),
(46, 15),
(47, 11),
(48, 15),
(49, 15),
(50, 15),
(51, 15),
(52, 15),
(53, 15);

COMMIT;
