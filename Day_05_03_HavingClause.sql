use aboutdatabase;


/*======================== HAVING CLAUSE ======================= 

HAVING, AGGREGATE FUNCTION'lar ile birlikte kullanilan 
FILTRELEME komutudur.

Aggregate fonksiyonlar ile ilgili bir kosul koymak 
icin GROUP BY'dan sonra HAVING cumlecigi kullanilir.

Yeni create ettigimiz bir field uzerinden filtreleme yapmak istiyorsak 
WHERE cumlecigini kullanamayiz. 
WHERE cumlecigi sadece  database de var olan fieldlar uzerinde 
bir filtreleme yapar.    
===============================================================*/

CREATE TABLE isciler(
	id int,
	isim varchar(50),
    sehir varchar(20),
    maas int,
	sirket varchar(20)
);

INSERT INTO isciler VALUES 
(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda'),
(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'),
(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'),
(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford'),
(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas'),
(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford'),
(123456710, 'Hatıce Sahin', 'Bursa', 4500, 'Honda');


SELECT * FROM isciler;

-- Soru-1. Sirketlere gore toplam isci sayisini listeleyiniz

SELECT sirket, COUNT(isim) isci_sayisi
FROM isciler
GROUP BY sirket;

-- Soru-2. Isci sayisi 1'den buyuk olan sirketleri listeleyiniz.

SELECT sirket, COUNT(isim) AS isci_sayisi
FROM isciler
GROUP BY sirket
HAVING isci_sayisi > 1;

-- Not: Database'de olmayan sonrada üretilmiş columnları HAVING ile filtreleyebiliriz.

-- Soru-3.Toplam geliri 8000 liradan fazla olan isimleri gosteren sorgu yaziniz
-- isimleri gruplandirarak soruyu cozumleyiniz.

SELECT isim, SUM(maas) toplam_gelir
FROM isciler
GROUP BY isim
HAVING toplam_gelir > 8000;

--  Soru-4. Eger bir sehirde alinan MAX maas 5000'den dusukse sehir ismini
-- ve MAX maasi veren sorgu yaziniz

SELECT sehir, MAX(maas) AS max_maas
FROM isciler
GROUP BY sehir
HAVING max_maas < 5000;


-- Soru-5. Eger bir sehirde alinan MAX maas 3500'den buyukse 
-- sehir ismi 'i' harfi ile basliyorsa o sehirleri ve 
-- ve MAX maasi, maas ters sirali veren sorgu yaziniz


SELECT sehir, MAX(maas)max_maas
FROM isciler
WHERE sehir LIKE 'i%'
GROUP BY sehir
HAVING max_maas > 3500
ORDER BY max_maas DESC; 

