use aboutdatabase;

/* 
===============================================
		       SELECT - DISTINCT
===============================================
   */

/*
 DISTINCT anahtar kelimesi SQL'de, bir sorgu sonucu setinden
 yalnızca benzersiz (tekrar etmeyen) değerleri seçmek için 
 kullanılır. 
 Tekrarlanan verilerin filtrelenmesi ve veri 
 setinden tekil kayıtların alınması gerektiğinde bu ifade 
 devreye girer.

DISTINCT genellikle SELECT ifadesiyle birlikte kullanılır 
ve SELECT sorgusunun hemen ardından gelir.
*/

/*
*************** SYNTAX ***************
SELECT DISTINCT sütun_adı
FROM tablo_adı;
*/

CREATE TABLE siparisler (
id INT ,
musteri_adi VARCHAR(50),
urun_adi VARCHAR(50),
siparis_tarihi DATE
);

INSERT INTO siparisler (musteri_adi, urun_adi, siparis_tarihi)
VALUES
('Ahmet Yilmaz', 'Laptop', '2023-01-10'),
('Ayse Kaya', 'Akilli Telefon', '2023-01-12'),
('Mehmet Öz', 'Laptop', '2023-02-05'),
('Ahmet Yilmaz', 'Akilli Telefon', '2023-02-10'),
('Ayse Kaya', 'Tablet', '2023-02-20'),
('Ahmet Yilmaz', 'Laptop', '2023-02-25');

SELECT * FROM siparisler;

/* ============================== SORU 1  ================================
	Siparişler tablosuna göre hangi urunler siparis edilmiş?
	(Urunler UNIQUE(benzersiz) olmalı
   ======================================================================
*/

SELECT DISTINCT urun_adi
FROM siparisler ;



/* ============================== SORU 2  ================================
	Siparişler tablosundaki verilere göre subat ayı içerisinde satılan
    urunleri benzersiz olarak listeleyiniz.
   ======================================================================
*/

-- Birinci Cozum;
SELECT DISTINCT urun_adi
FROM siparisler
WHERE siparis_tarihi
LIKE '____-02-__';

-- İkinci Cözum;

SELECT DISTINCT urun_adi
FROM siparisler
WHERE siparis_tarihi >= '2023-02-01'
AND siparis_tarihi <= '2023-02-28' ;


-- Üçüncü Cozum

SELECT DISTINCT urun_adi
FROM siparisler
WHERE MONTH(siparis_tarihi) = 2
AND YEAR (siparis_tarihi)=2023;







































