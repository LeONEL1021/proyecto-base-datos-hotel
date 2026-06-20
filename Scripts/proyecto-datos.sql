--============================================================================
--SEGUNDO SCRIPT: CARGA INICIAL DE DATOS REPRESENTATIVOS
--============================================================================

-- 1. Hoteles de prueba
insert into hotel (id_hotel, nombre, direccion, telefono, categoria)
values 
(112, 'hotel san salvador lux', 'colonia escalon, san salvador', '2222-1111', 'lujo'),
(113, 'eco resort costa del sol', 'bulevar costa del sol, la paz', '2222-2222', 'resort'),
(114, 'boutique centro historico', 'avenida españa, san salvador', '2222-3333', 'boutique');

-- 2. Tipos de habitaciones con sus tarifas
insert into tipo_habitacion (nombre, descripcion, capacidad, tarifa_noche)
values
('individual', 'cama matrimonial, ideal para personas solas o ejecutivos', 1, 45.00),
('doble estandar', 'dos camas matrimoniales, perfecta para familias pequeñas', 4, 85.00),
('suite presidencial', 'vista al mar o la ciudad, jacuzzi y sala de estar privada', 2, 250.00);

-- 3. Habitaciones (Aquí no ponemos el estado para que aplique el DEFAULT 'disponible')
insert into habitacion (numero_habitacion, piso, id_hotel, id_tipo)
values
('101', 1, 112, 1), -- individual en hotel lux 
('102', 1, 112, 2), -- doble en hotel lux 
('201', 2, 112, 3), -- suite en hotel lux 
('a-10', 1, 113, 2), -- doble en eco resort 
('b-20', 2, 113, 3); -- suite en eco resort 
    
-- 4. 	Servicios adicionales que ofrece el hotel
insert into servicio (nombre, descripcion, categoria, precio, id_hotel)
values
    ('restaurante - desayuno buffet', 'desayuno completo con opciones tipicas y continentales', 'alimentacion', 12.50, 112),
    ('spa - masaje relajante', 'sesion de 60 minutos de masaje terapeutico', 'bienestar', 40.00, 112),
    ('servicio a la habitacion', 'recargo por envio de alimentos y bebidas al cuarto', 'otros', 5.00, 112),
    ('transporte al aeropuerto', 'traslado de ida o vuelta en minivan ejecutiva', 'transporte', 25.00, 113);

-- 5. Empleados con sus puestos reales
insert into empleado (nombre, apellido, email, telefono, cargo, id_hotel) values ('Agretha', 'Gauvain', 'agauvain0@google.it', '6720-4174', 'recepcionista turno noche', 112);
insert into empleado (nombre, apellido, email, telefono, cargo, id_hotel) values ('Aeriela', 'Dallaghan', 'adallaghan1@uol.com.br', '7247-6737', 'recepcionista turno noche' , 112);
insert into empleado (nombre, apellido, email, telefono, cargo, id_hotel) values ('Violetta', 'Sultan', 'vsultan2@theguardian.com', '6899-2885', 'recepcionista turno mañana', 112);
insert into empleado (nombre, apellido, email, telefono, cargo, id_hotel) values ('Kimmie', 'Ovenell', 'kovenell3@ca.gov', '7265-7688', 'chef ejecutivo', 112);
insert into empleado (nombre, apellido, email, telefono, cargo, id_hotel) values ('Greta', 'Gayne', 'ggayne4@facebook.com', '6561-3753', 'gerente general', 112);
insert into empleado (nombre, apellido, email, telefono, cargo, id_hotel) values ('Lilia', 'Nutten', 'lnutten5@merriam-webster.com', '6734-5305', 'mesero', 112);
insert into empleado (nombre, apellido, email, telefono, cargo, id_hotel) values ('Joni', 'Gadsdon', 'jgadsdon6@squarespace.com', '6377-6624', 'mesero', 112);
insert into empleado (nombre, apellido, email, telefono, cargo, id_hotel) values ('Danita', 'Arnefield', 'darnefield7@tiny.cc', '6778-4590', 'gerente de operaciones', 112);
insert into empleado (nombre, apellido, email, telefono, cargo, id_hotel) values ('Bryana', 'Dyet', 'bdyet8@privacy.gov.au', '6809-1535', 'auxiliar de mantenimiento', 112);
insert into empleado (nombre, apellido, email, telefono, cargo, id_hotel) values ('Robbie', 'Staddom', 'rstaddom9@diigo.com', '6681-7432', 'botones', 112);
insert into empleado (nombre, apellido, email, telefono, cargo, id_hotel) values ('Koren', 'Dafforne', 'kdaffornea@biglobe.ne.jp', '6717-2829', 'mesero', 112);
insert into empleado (nombre, apellido, email, telefono, cargo, id_hotel) values ('Gaby', 'Cross', 'gcrossb@blinklist.com', '7520-1515', 'supervisor de limpieza', 112);
insert into empleado (nombre, apellido, email, telefono, cargo, id_hotel) values ('Lorry', 'Fordham', 'lfordhamc@istockphoto.com', '7271-3100', 'chef ejecutivo', 112);
insert into empleado (nombre, apellido, email, telefono, cargo, id_hotel) values ('Isabella', 'Ambrogiotti', 'iambrogiottid@ucoz.com', '6903-6649', 'mesero', 112);
insert into empleado (nombre, apellido, email, telefono, cargo, id_hotel) values ('Zarla', 'Libby', 'zlibbye@ucsd.edu', '7472-5560', 'supervisor de limpieza', 112);
insert into empleado (nombre, apellido, email, telefono, cargo, id_hotel) values ('Gael', 'Horry', 'ghorryf@cafepress.com', '7058-4364', 'mesero', 112);
insert into empleado (nombre, apellido, email, telefono, cargo, id_hotel) values ('Berni', 'Pert', 'bpertg@barnesandnoble.com', '7845-3709', 'botones', 112);
insert into empleado (nombre, apellido, email, telefono, cargo, id_hotel) values ('Amandy', 'Mathieu', 'amathieuh@ted.com', '7837-9207', 'mantenimiento de habitaciones', 112);
insert into empleado (nombre, apellido, email, telefono, cargo, id_hotel) values ('Nicoli', 'Everit', 'neveriti@sciencedaily.com', '7235-6397', 'mantenimiento de habitaciones', 112);
insert into empleado (nombre, apellido, email, telefono, cargo, id_hotel) values ('Arabela', 'Kabos', 'akabosj@prlog.org', '6135-9549', 'recepcionista turno mañana', 112);

-- 6. Huéspedes de prueba 
insert into huesped (nombre, apellido, email, telefono, documento) values ('Ammamaria', 'Beall', 'abeall0@cmu.edu', '6191-9679', '83585848-6');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Marin', 'Bartosik', 'mbartosik1@about.me', '6115-5376', '03153158-3');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Wanda', 'Cranny', 'wcranny2@sfgate.com', '2963-7755', '10219887-1');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Mallory', 'Bridgwood', 'mbridgwood3@w3.org', '7447-6868', '70957122-8');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Livvyy', 'Mangeney', 'lmangeney4@merriam-webster.com', '2253-6013', '65707789-6');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Stephi', 'Yerson', 'syerson5@photobucket.com', '6089-2775', '53024047-5');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Zelda', 'Kleinmintz', 'zkleinmintz6@vimeo.com', '2222-6917', '25932789-3');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Keriann', 'Rowlings', 'krowlings7@twitpic.com', '7495-7772', '34041287-2');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Joscelin', 'Gareisr', 'jgareisr8@ameblo.jp', '7179-6552', '30940156-6');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Darcie', 'Shedden', 'dshedden9@sogou.com', '2450-7475', '65043117-8');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Maddi', 'Letessier', 'mletessiera@csmonitor.com', '6494-4884', '44309727-9');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Arlyne', 'Cahen', 'acahenb@vimeo.com', '2373-7424', '66103151-9');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Deeanne', 'Egger', 'deggerc@mail.ru', '2213-4796', '46945262-4');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Valeria', 'McCue', 'vmccued@theglobeandmail.com', '2731-3183', '87396608-4');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Darcy', 'Fowgies', 'dfowgiese@mit.edu', '2032-5622', '60010102-7');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Ashly', 'Andriss', 'aandrissf@people.com.cn', '7878-4101', '66808390-3');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Mia', 'Eveque', 'mevequeg@com.com', '6158-6775', '30009676-3');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Caprice', 'Warnock', 'cwarnockh@state.gov', '6687-9700', '60918729-6');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Fionna', 'Finley', 'ffinleyi@oracle.com', '7114-6548', '09996971-6');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Odessa', 'Lettson', 'olettsonj@statcounter.com', '7878-4040', '52602264-6');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Susana', 'Gley', 'sgleyk@list-manage.com', '7708-4320', '22339389-7');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Bobbette', 'Nozzolii', 'bnozzoliil@msu.edu', '7957-3079', '22650500-7');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Debor', 'Downing', 'ddowningm@booking.com', '7456-9706', '15048741-3');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Noella', 'Sanders', 'nsandersn@shinystat.com', '2778-9133', '46667029-9');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Jaimie', 'Mechan', 'jmechano@bloomberg.com', '2543-3789', '68610403-6');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Maggie', 'Rawstron', 'mrawstronp@tiny.cc', '7084-7174', '41991985-6');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Karry', 'Kynson', 'kkynsonq@meetup.com', '7139-8169', '62630576-3');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Euphemia', 'Espy', 'eespyr@alexa.com', '6401-2208', '43384502-9');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Patrizia', 'Weddell', 'pweddells@npr.org', '2697-4201', '36032014-0');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Veda', 'Dunkerly', 'vdunkerlyt@wordpress.org', '6275-6029', '56434466-7');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Tricia', 'Dennerly', 'tdennerlyu@npr.org', '7115-5628', '15057254-3');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Fae', 'Fley', 'ffleyv@studiopress.com', '6814-0139', '66263149-9');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Ursola', 'Dayne', 'udaynew@shop-pro.jp', '6020-3607', '07578405-6');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Kania', 'Eddie', 'keddiex@ocn.ne.jp', '6714-2259', '65114791-2');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Chris', 'Bartels', 'cbartelsy@imgur.com', '7560-1433', '01077732-9');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Blondy', 'Scopes', 'bscopesz@shutterfly.com', '6168-7447', '59738395-5');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Lilly', 'Lantiff', 'llantiff10@addtoany.com', '6487-9125', '44370037-3');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Jillian', 'Oury', 'joury11@mail.ru', '2459-3597', '02127105-6');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Marsha', 'Vecard', 'mvecard12@homestead.com', '7722-4230', '80432013-2');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Leia', 'Trappe', 'ltrappe13@biglobe.ne.jp', '6276-4914', '00859163-6');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Valma', 'Shambroke', 'vshambroke14@mapquest.com', '2067-7325', '48119772-8');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Letitia', 'Nickels', 'lnickels15@desdev.cn', '7702-3686', '54855009-6');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Ardenia', 'Utridge', 'autridge16@intel.com', '7538-6743', '93305713-3');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Frayda', 'Heyburn', 'fheyburn17@scientificamerican.com', '2776-0401', '22033906-8');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Myrtie', 'Neiland', 'mneiland18@examiner.com', '2456-9436', '38463192-5');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Cristi', 'Santori', 'csantori19@unc.edu', '7847-9252', '61859389-9');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Agnesse', 'Harding', 'aharding1a@google.com.br', '7446-2323', '14567230-4');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Diana', 'Upcraft', 'dupcraft1b@nhs.uk', '2239-9467', '61915952-5');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Frieda', 'McRory', 'fmcrory1c@jigsy.com', '6075-6360', '92822281-1');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Helsa', 'Anyon', 'hanyon1d@tripadvisor.com', '7327-3660', '89138085-4');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Allegra', 'Dikes', 'adikes1e@sfgate.com', '6231-6962', '15352350-7');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Legra', 'Hamber', 'lhamber1f@virginia.edu', '6000-3613', '58480174-3');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Koo', 'Tschierasche', 'ktschierasche1g@posterous.com', '7080-2042', '93250841-6');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Latrina', 'Maplestone', 'lmaplestone1h@salon.com', '7047-7397', '20029723-6');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Roanna', 'Babin', 'rbabin1i@virginia.edu', '2791-8848', '05183420-3');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Essie', 'Fandrey', 'efandrey1j@comcast.net', '6863-5318', '62488267-2');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Idell', 'Calveley', 'icalveley1k@vkontakte.ru', '2209-4690', '49869533-5');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Lynnelle', 'Basill', 'lbasill1l@pagesperso-orange.fr', '6646-6574', '03166326-2');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Lind', 'Geffen', 'lgeffen1m@unblog.fr', '7969-6524', '78286898-1');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Noemi', 'Christophe', 'nchristophe1n@redcross.org', '6737-1238', '71949067-7');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Kissie', 'Gwyer', 'kgwyer1o@japanpost.jp', '7358-1576', '58942367-5');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Emilee', 'Bondley', 'ebondley1p@sun.com', '6302-8160', '51258681-9');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Nora', 'Rutty', 'nrutty1q@github.io', '6004-2772', '53583614-8');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Stephannie', 'Doyley', 'sdoyley1r@over-blog.com', '6650-3058', '14368849-0');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Elenore', 'Sagrott', 'esagrott1s@google.fr', '6118-3612', '10770310-8');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Janene', 'Mineghelli', 'jmineghelli1t@yellowpages.com', '2483-3506', '03424299-4');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Engracia', 'Bleythin', 'ebleythin1u@go.com', '7348-8724', '82905491-1');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Kass', 'Hawkswell', 'khawkswell1v@godaddy.com', '2414-9201', '26808746-1');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Louisette', 'Miklem', 'lmiklem1w@phpbb.com', '7178-0788', '50490340-8');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Gerta', 'Lewins', 'glewins1x@networksolutions.com', '7468-3041', '30339980-4');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Madella', 'Le Fleming', 'mlefleming1y@wunderground.com', '6112-7033', '63970910-7');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Lia', 'Tyght', 'ltyght1z@devhub.com', '6815-7571', '07783686-3');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Kerrin', 'Baulch', 'kbaulch20@studiopress.com', '2606-9214', '35981646-2');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Susanna', 'Goodbairn', 'sgoodbairn21@free.fr', '2754-6141', '71124552-4');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Candra', 'Summerrell', 'csummerrell22@nba.com', '2717-1902', '74828887-4');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Sandye', 'Vanichkov', 'svanichkov23@canalblog.com', '7512-1670', '19040936-9');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Pennie', 'Benesevich', 'pbenesevich24@cocolog-nifty.com', '7735-5106', '46911345-9');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Francesca', 'Scarborough', 'fscarborough25@scribd.com', '2187-5948', '67556935-3');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Reine', 'Harmar', 'rharmar26@scientificamerican.com', '6192-0706', '49758675-1');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Misti', 'Ludford', 'mludford27@skype.com', '6647-4514', '23001194-8');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Mariette', 'Queree', 'mqueree28@oaic.gov.au', '2891-6408', '71943376-1');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Amabel', 'Streat', 'astreat29@cmu.edu', '7901-4336', '78666788-2');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Rafaelita', 'Hargreave', 'rhargreave2a@fastcompany.com', '2268-0758', '48553341-8');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Stefania', 'Trengrove', 'strengrove2b@trellian.com', '2601-8210', '05092139-0');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Juli', 'Chastand', 'jchastand2c@pen.io', '2627-0749', '29458592-0');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Coretta', 'Bonde', 'cbonde2d@wordpress.com', '2821-9173', '17113294-2');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Suzette', 'Woliter', 'swoliter2e@ibm.com', '7283-5119', '01348503-0');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Winna', 'Benardeau', 'wbenardeau2f@amazon.co.uk', '2752-4516', '47098270-6');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Ailey', 'Lapwood', 'alapwood2g@webnode.com', '6267-5954', '87397037-8');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Cahra', 'Shambrook', 'cshambrook2h@ca.gov', '7542-7400', '00619330-0');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Auroora', 'Mosdell', 'amosdell2i@marketwatch.com', '6870-3048', '68426002-5');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Vinny', 'Dulton', 'vdulton2j@intel.com', '7575-2386', '09437538-8');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Doretta', 'Collingridge', 'dcollingridge2k@accuweather.com', '7533-6081', '76392504-7');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Dede', 'Nitti', 'dnitti2l@nps.gov', '7905-1921', '55267511-8');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Janaye', 'Schrieves', 'jschrieves2m@naver.com', '7555-4634', '78568695-1');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Micheline', 'Planke', 'mplanke2n@weibo.com', '7218-3215', '50461606-8');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Lian', 'Holtum', 'lholtum2o@state.gov', '7052-0620', '44046291-4');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Etty', 'Wilden', 'ewilden2p@auda.org.au', '2598-8153', '32488612-6');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Evangelina', 'Sackey', 'esackey2q@ed.gov', '7428-7002', '68657274-1');
insert into huesped (nombre, apellido, email, telefono, documento) values ('Bevvy', 'Hadwick', 'bhadwick2r@altervista.org', '7984-6410', '56449627-5');

-- 7. Reservaciones 
-- Usamos id_huesped 1, 2 y 3 
insert into reservacion (id_huesped, id_hotel, fecha_checkin, fecha_checkout, num_huespedes, estado, id_tipo)
values
(1, 112, '2026-07-01', '2026-07-05', 1, 'confirmada', 1),  -- hotel lux
(2, 112, '2026-07-10', '2026-07-12', 2, 'pendiente', 2),   -- hotel lux
(3, 113, '2026-08-15', '2026-08-20', 3, 'confirmada', 1);  -- eco resort

-- 8. Check in/check out 
insert into check_in_out
(id_reservacion, monto_estadia, consumo_total, fecha_checkin_real, fecha_checkout_real, id_empleado_checkin, id_empleado_checkout, numero_habitacion, id_hotel)
values
( 1, 180.00, 50.00, '2026-07-01 14:15:00', '2026-07-05 10:00:00', 12, 13, '101', 112);
-- 9. Consumo de servicios
insert into consumo_servicio
( id_reservacion, num_consumo, fecha, cantidad, precio_unitario, subtotal, id_servicio)
values
(1, 1, '2026-07-02', 2, 12.50, 25.00, 1),
(1, 2, '2026-07-04', 5, 5.00, 25.00, 3);
-- 10. Facturas
insert into factura
( id_reservacion, fecha, subtotal_habitacion, subtotal_servicios, impuestos, total, metodo_pago, estado_pago)
values
(1, '2026-07-05', 180.00, 50.00, 29.90, 259.90, 'tarjeta', 'pagada');

-- 11. Detalle de factura
insert into detalle_factura
( id_factura, num_detalle, descripcion, cantidad, precio_unitario, descuento, subtotal)
values
(1, 1, 'Hospedaje - Habitacion 101', 1, 180.00, 0.00, 180.00),
(1, 2, 'Consumo - Desayuno buffet', 2, 12.50, 0.00, 25.00),
(1, 3, 'Consumo - Servicio a la habitacion', 5, 5.00, 0.00, 25.00);
-- Verificar que todo se pobló con éxito
select * from reservacion;
select * from check_in_out;
select * from factura;
select * from detalle_factura;