DROP TABLE IF EXISTS instrument;

CREATE TABLE instrument (

  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  info TEXT,
  image TEXT

);

INSERT INTO instrument (name , info, image) VALUES ('Piano' , 'This is a string instrument', 'http://www.belfastmusic.co.uk/ekmps/shops/belfastmusic/images/v-piano-grand-1424-p.jpg');
INSERT INTO instrument (name , info, image) VALUES ('Trumpet' , 'This is a brass instrument', 'https://images-na.ssl-images-amazon.com/images/I/41c90VJBDBL._SL500_AC_SS350_.jpg');
INSERT INTO instrument (name , info, image) VALUES ('Flute' , 'This is a wind instrument', 'http://az632705.vo.msecnd.net/cmsroot/jupitermusic/media/jupiter-media/products/woodwinds/jaf1000e/angle1/jaf1000e_1.jpg');
