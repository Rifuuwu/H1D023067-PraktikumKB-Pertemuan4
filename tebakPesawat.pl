% DATABASE SISTEM PAKAR PESAWAT MILITER
:- dynamic ciri_pos/1.
:- dynamic ciri_neg/1.

% FAKTA PESAWAT MILITER

% Daftar pesawat
pesawat("P-51D Mustang").
pesawat("F4U Corsair").
pesawat("Spitfire Mk IX").
pesawat("Bf 109 G-6").
pesawat("Fw 190 A-8").
pesawat("Yak-9").
pesawat("La-5FN").
pesawat("A6M Zero").
pesawat("Ki-84 Hayate").
pesawat("J2M Raiden").
pesawat("C.205 Veltro").
pesawat("G.55 Centauro").

% Ciri-ciri berdasarkan negara
ciri(usa, "P-51D Mustang").
ciri(usa, "F4U Corsair").
ciri(britain, "Spitfire Mk IX").
ciri(germany, "Bf 109 G-6").
ciri(germany, "Fw 190 A-8").
ciri(ussr, "Yak-9").
ciri(ussr, "La-5FN").
ciri(japan, "A6M Zero").
ciri(japan, "Ki-84 Hayate").
ciri(japan, "J2M Raiden").
ciri(italy, "C.205 Veltro").
ciri(italy, "G.55 Centauro").


% Ciri-ciri berdasarkan mesin
ciri(inline_engine, "P-51D Mustang").
ciri(radial_engine, "F4U Corsair").
ciri(inline_engine, "Spitfire Mk IX").
ciri(inline_engine, "Bf 109 G-6").
ciri(radial_engine, "Fw 190 A-8").
ciri(inline_engine, "Yak-9").
ciri(inline_engine, "La-5FN").
ciri(radial_engine, "A6M Zero").
ciri(radial_engine, "Ki-84 Hayate").
ciri(radial_engine, "J2M Raiden").
ciri(inline_engine, "C.205 Veltro").
ciri(inline_engine, "G.55 Centauro").

% Ciri-ciri berdasarkan peran
ciri(air_superiority, "P-51D Mustang").
ciri(multirole, "F4U Corsair").
ciri(air_superiority, "Spitfire Mk IX").
ciri(air_superiority, "Bf 109 G-6").
ciri(interceptor, "Fw 190 A-8").
ciri(multirole, "Yak-9").
ciri(air_superiority, "La-5FN").
ciri(turnfighter, "A6M Zero").
ciri(multirole, "Ki-84 Hayate").
ciri(interceptor, "J2M Raiden").
ciri(air_superiority, "C.205 Veltro").
ciri(air_superiority, "G.55 Centauro").

% Ciri-ciri berdasarkan kemampuan manuver
ciri(high_maneuverability, "Spitfire Mk IX").
ciri(high_maneuverability, "Yak-9").
ciri(high_maneuverability, "A6M Zero").
ciri(medium_maneuverability, "P-51D Mustang").
ciri(medium_maneuverability, "F4U Corsair").
ciri(medium_maneuverability, "La-5FN").
ciri(medium_maneuverability, "Ki-84 Hayate").
ciri(medium_maneuverability, "C.205 Veltro").
ciri(medium_maneuverability, "G.55 Centauro").
ciri(medium_maneuverability, "J2M Raiden").
ciri(low_maneuverability, "Fw 190 A-8").
ciri(low_maneuverability, "Bf 109 G-6").

% Ciri-ciri berdasarkan kecepatan
ciri(high_speed, "P-51D Mustang").
ciri(high_speed, "Fw 190 A-8").
ciri(high_speed, "Ki-84 Hayate").
ciri(high_speed, "J2M Raiden").
ciri(medium_speed, "F4U Corsair").
ciri(medium_speed, "Spitfire Mk IX").
ciri(medium_speed, "Bf 109 G-6").
ciri(medium_speed, "La-5FN").
ciri(medium_speed, "C.205 Veltro").
ciri(medium_speed, "G.55 Centauro").
ciri(low_speed, "Yak-9").
ciri(low_speed, "A6M Zero").

% Ciri-ciri berdasarkan ketinggian optimal
ciri(high_altitude, "P-51D Mustang").
ciri(high_altitude, "Spitfire Mk IX").
ciri(high_altitude, "Bf 109 G-6").
ciri(high_altitude, "Fw 190 A-8").
ciri(medium_altitude, "F4U Corsair").
ciri(medium_altitude, "Ki-84 Hayate").
ciri(medium_altitude, "C.205 Veltro").
ciri(medium_altitude, "G.55 Centauro").
ciri(low_altitude, "Yak-9").
ciri(low_altitude, "La-5FN").
ciri(low_altitude, "A6M Zero").
ciri(low_altitude, "J2M Raiden").


% Pertanyaan-pertanyaan untuk sistem pakar

% Pertanyaan tentang negara
pertanyaan(usa, "Apakah pesawat ini berasal dari Amerika Serikat (USA)?").
pertanyaan(britain, "Apakah pesawat ini berasal dari Britania Raya?").
pertanyaan(germany, "Apakah pesawat ini berasal dari Jerman?").
pertanyaan(ussr, "Apakah pesawat ini berasal dari Uni Soviet?").
pertanyaan(japan, "Apakah pesawat ini berasal dari Jepang?").
pertanyaan(italy, "Apakah pesawat ini berasal dari Italia?").


% Pertanyaan tentang jenis mesin
pertanyaan(inline_engine, "Apakah pesawat ini menggunakan mesin inline?").
pertanyaan(radial_engine, "Apakah pesawat ini menggunakan mesin radial?").

% Pertanyaan tentang peran pesawat
pertanyaan(air_superiority, "Apakah pesawat ini dirancang untuk air superiority (menguasai udara)?").
pertanyaan(multirole, "Apakah pesawat ini memiliki kemampuan multi-peran?").
pertanyaan(interceptor, "Apakah pesawat ini merupakan interceptor?").
pertanyaan(turnfighter, "Apakah pesawat ini dikenal sebagai turn fighter (unggul dalam manuver memutar)?").

% Pertanyaan tentang kemampuan manuver
pertanyaan(high_maneuverability, "Apakah pesawat ini memiliki kemampuan manuver yang sangat baik?").
pertanyaan(medium_maneuverability, "Apakah pesawat ini memiliki kemampuan manuver yang cukup baik?").
pertanyaan(low_maneuverability, "Apakah pesawat ini memiliki kemampuan manuver yang kurang baik?").

% Pertanyaan tentang kecepatan
pertanyaan(high_speed, "Apakah pesawat ini memiliki kecepatan tinggi?").
pertanyaan(medium_speed, "Apakah pesawat ini memiliki kecepatan sedang?").
pertanyaan(low_speed, "Apakah pesawat ini memiliki kecepatan rendah?").

% Pertanyaan tentang ketinggian optimal
pertanyaan(high_altitude, "Apakah pesawat ini bekerja optimal pada ketinggian tinggi?").
pertanyaan(medium_altitude, "Apakah pesawat ini bekerja optimal pada ketinggian sedang?").
pertanyaan(low_altitude, "Apakah pesawat ini bekerja optimal pada ketinggian rendah?").



