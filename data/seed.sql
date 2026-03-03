-- TimeGuessr : insertion des rounds initiaux
-- Usage : mysql -u root timeguessr < data/seed.sql

INSERT INTO rounds (id, title, description, year, lat, lng, image, category) VALUES
(1,  'Chute du Mur de Berlin',
     'Allemands de l''Est et de l''Ouest réunis devant la porte de Brandebourg lors de la chute du Mur en novembre 1989.',
     1989, 52.516300, 13.377700, 'images/01.jpg', 'evenements'),

(2,  'Éruption du Mont Saint Helens',
     'L''éruption cataclysmique du Mont Saint Helens dans l''État de Washington le 18 mai 1980.',
     1980, 46.191400, -122.195600, 'images/02.jpg', 'evenements'),

(3,  'Ville fantôme de Pripyat',
     'La ville de Pripyat, évacuée après la catastrophe nucléaire de Tchernobyl en 1986, photographiée des années plus tard.',
     2011, 51.404500, 30.054200, 'images/03.jpg', 'evenements'),

(4,  'Acqua Alta à Venise',
     'La place Saint-Marc à Venise inondée lors d''un épisode d''acqua alta.',
     2004, 45.434100, 12.338800, 'images/04.jpg', 'evenements'),

(5,  'Rues de La Havane',
     'Une rue typique de La Havane, Cuba, avec ses bâtiments colorés et ses voitures vintage.',
     2010, 23.113600, -82.366600, 'images/05.jpg', 'villes'),

(6,  'Place Rouge, Moscou',
     'Vue panoramique de la Place Rouge à Moscou avec le Kremlin et la cathédrale Saint-Basile.',
     2020, 55.753900, 37.620800, 'images/06.jpg', 'monuments'),

(7,  'Carrefour de Shibuya, Tokyo',
     'Le célèbre carrefour de Shibuya à Tokyo, l''un des passages piétons les plus fréquentés au monde.',
     2018, 35.659500, 139.700400, 'images/07.jpg', 'villes'),

(8,  'Times Square, New York',
     'Times Square à Manhattan, avec ses écrans géants et ses enseignes lumineuses emblématiques.',
     2012, 40.758000, -73.985500, 'images/08.jpg', 'villes'),

(9,  'Panorama d''Istanbul',
     'Vue panoramique d''Istanbul avec ses mosquées et le Bosphore.',
     2015, 41.008200, 28.978400, 'images/09.jpg', 'villes'),

(10, 'Christ Rédempteur, Rio de Janeiro',
     'La statue du Christ Rédempteur dominant la baie de Rio de Janeiro depuis le sommet du Corcovado.',
     2014, -22.951900, -43.210500, 'images/10.jpg', 'monuments'),

(11, 'Burj Khalifa, Dubaï',
     'Le Burj Khalifa à Dubaï au coucher du soleil, plus haute tour du monde avec ses 828 mètres.',
     2015, 25.197200, 55.274400, 'images/11.jpg', 'monuments'),

(12, 'Pyramides et Sphinx de Gizeh',
     'Le Sphinx et les pyramides de Gizeh, aux portes du Caire, monuments millénaires de l''Égypte antique.',
     2008, 29.977300, 31.132500, 'images/12.jpg', 'monuments'),

(13, 'Jemaa el-Fna, Marrakech',
     'La célèbre place Jemaa el-Fna à Marrakech de nuit, avec ses étals et ses animations.',
     2012, 31.625800, -7.989100, 'images/13.jpg', 'villes'),

(14, 'Capitole de La Havane',
     'Le Capitole national de La Havane avec des voitures américaines classiques.',
     2015, 23.135300, -82.359600, 'images/14.jpg', 'monuments'),

(15, 'Marina Bay, Singapour',
     'La skyline de Marina Bay à Singapour au crépuscule, avec le Marina Bay Sands et les gratte-ciels illuminés.',
     2019, 1.283800, 103.859100, 'images/15.jpg', 'villes');
