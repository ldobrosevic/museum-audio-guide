ALTER TABLE exhibitions ADD CONSTRAINT chk_dateEnd CHECK (date_End >= date_Begin);
INSERT INTO exhibitions(name_Of_Exhibition, date_Begin, date_End, description, typeof_Exhibition) VALUES ('ART', '2017-2-18', '2017-2-28', 'umjetnost', 0);
INSERT INTO exhibitions(name_Of_Exhibition, date_Begin, date_End, description, typeof_Exhibition) VALUES ('AEROSPACE', '2017-2-19', '2017-2-28', 'zrakoplovstvo',1);
INSERT INTO exhibitions(name_Of_Exhibition, date_Begin, date_End, description, typeof_Exhibition) VALUES ('ANTHROPOLOGY', '2017-2-20', '2017-2-28', 'antropologija',2);
INSERT INTO exhibitions(name_Of_Exhibition, date_Begin, date_End, description, typeof_Exhibition) VALUES ('ARCHITECTURE', '2017-2-21', '2017-2-28', 'arhitektura',3);
INSERT INTO exhibitions(name_Of_Exhibition, date_Begin, date_End, description, typeof_Exhibition) VALUES ('ASTRONOMY', '2017-2-22', '2017-2-28', 'astronomija',4);
INSERT INTO exhibitions(name_Of_Exhibition, date_Begin, date_End, description, typeof_Exhibition) VALUES ('AUTOMOBILE', '2017-2-22', '2017-2-28', 'automobili',5);
INSERT INTO exhibitions(name_Of_Exhibition, date_Begin, date_End, description, typeof_Exhibition) VALUES ('DINOSAUR', '2017-2-22', '2017-2-28', 'dinosauri',6);
INSERT INTO exhibitions(name_Of_Exhibition, date_Begin, date_End, description, typeof_Exhibition) VALUES ('GEOLOGY', '2017-2-22', '2017-2-28', 'geologija',7);
INSERT INTO exhibitions(name_Of_Exhibition, date_Begin, date_End, description, typeof_Exhibition) VALUES ('HISTORY', '2017-2-22', '2017-2-28', 'povijest',8);
INSERT INTO exhibitions(name_Of_Exhibition, date_Begin, date_End, description, typeof_Exhibition) VALUES ('INDUSTRY', '2017-2-22', '2017-2-28', 'industrija',9);
INSERT INTO exhibitions(name_Of_Exhibition, date_Begin, date_End, description, typeof_Exhibition) VALUES ('LITERATURE', '2017-2-22', '2017-2-28', 'književnost',10);
INSERT INTO exhibitions(name_Of_Exhibition, date_Begin, date_End, description, typeof_Exhibition) VALUES ('MUSIC', '2017-2-22', '2017-2-28', 'glazba',11);
INSERT INTO exhibitions(name_Of_Exhibition, date_Begin, date_End, description, typeof_Exhibition) VALUES ('SCIENCE', '2017-2-22', '2017-2-28', 'znanost',12);
INSERT INTO exhibitions(name_Of_Exhibition, date_Begin, date_End, description, typeof_Exhibition) VALUES ('SPORT', '2017-2-22', '2017-2-28', 'sport',13);
INSERT INTO exhibitions(name_Of_Exhibition, date_Begin, date_End, description, typeof_Exhibition) VALUES ('TECHNOLOGY', '2017-2-22', '2017-2-28', 'tehnologija',14);
INSERT INTO exhibitions(name_Of_Exhibition, date_Begin, date_End, description, typeof_Exhibition) VALUES ('MISCELLANEOUS', '2017-2-22', '2017-2-28', 'razno',15);
INSERT INTO exhibits(name, description, audio_path, image_path) VALUES ('mona lisa', 'half-length portrait painting by the Italian Renaissance artist Leonardo da Vinci that has been described as "the best known, the most visited, the most written about, the most sung about, the most parodied work of art in the world".','monalisa.mp3','monalisa.jpg');
INSERT INTO exhibits(name, description, audio_path, image_path) VALUES ('The Virgin and Child with St. Anne', 'The Virgin and Child with Saint Anne is an oil painting by Leonardo da Vinci depicting St Anne, her daughter the Virgin Mary and the infant Jesus. Christ is shown grappling with a sacrificial lamb symbolizing his Passion as the Virgin tries to restrain him. The painting was commissioned as the high altarpiece for the Church of Santissima Annunziata in Florence and its theme had long preoccupied Leonardo.','vaww.mp3','image.jpg');
INSERT INTO exhibit_details(exhibit_id, name,description, audio_path, image_path) VALUES (1, 'mona lisa obrva', 'ima 2 obrve, valjda','vaww.mp3','image.jpg');
INSERT INTO users(first_name, last_name, username, password, email, role,email_verified, validation_token) VALUES ('Tom', 'Smith', 'tommy', '843ut9384hjf', 'tommyboy@yahoo.com', 'admin','true', '12321321412');
INSERT INTO users(first_name, last_name, username, password, email, role,email_verified, validation_token) VALUES ('Frank', 'Castle', 'Punisher', '1234567', 'onebatch@yahoo.com', 'admin','true', '12321321423');
INSERT INTO users(first_name, last_name, username, password, email, role,email_verified, validation_token) VALUES ('Tony', 'Stark', 'IronMan', '843ut9384123', 'ironboy@yahoo.com', 'admin','true', '12321321434');
INSERT INTO users(first_name, last_name, username, password, email, role,email_verified, validation_token) VALUES ('Steve', 'Rogers', 'Cap', '843ut9384345', 'mericaboy@yahoo.com', 'registrated_user','true', '12321321534');
INSERT INTO users(first_name, last_name, username, password, email, role,email_verified, validation_token) VALUES ('Bruce', 'Banner', 'Hulky', '843ut9323456', 'HulkTheMan@yahoo.com', 'registrated_user','true', '12321321876');
INSERT INTO users(first_name, last_name, username, password, email, role,email_verified, validation_token) VALUES ('Bruce', 'Banner', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'HulkTheMan@yahoo.com', 'admin','true', '12321321876');


