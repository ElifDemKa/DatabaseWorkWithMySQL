use aboutdatabase;

/* 
===============================================
                   GROUP BY
===============================================
*/
/*
 GROUP BY SQL ifadesi, veritabanı sorgularında belirli bir veya 
 birden fazla sütuna göre satırları gruplandırmak için kullanılır. 
 Genellikle aggregate (gruplama) fonksiyonlar 
 (COUNT(), SUM(), AVG(), MIN(), MAX() vb.) ile birlikte kullanılır. 
 GROUP BY ifadesi, belirtilen sütunlardaki değerlere göre benzersiz 
 gruplar oluşturur ve her grup için aggregate fonksiyonların sonuçlarını
 döndürür. Bu, veriler üzerinde özetlemeler ve analizler yapmayı sağlar.
*/
/*
 Notlar:
GROUP BY kullanılırken, SELECT ifadesinde belirtilen sütunların ya gruplandırma
ifadesinde (GROUP BY kısmında) belirtilmiş olması ya da bir agregate fonksiyonunun
parçası olması gerekir.
Birden fazla sütun üzerinde gruplandırma yapılabilir. Bu durumda, sütunlar virgül
ile ayrılarak GROUP BY ifadesine eklenir.
*/
/*
*************** SYNTAX ***************
SELECT sutun_adi, SUM(adet) AS toplam_adet
FROM tablo_adi
GROUP BY sutun_adi(gruplanacak verilerin oldugu);
*/


CREATE TABLE manav (
    id INT ,
    urun_adi VARCHAR(50),
    miktar_kg DECIMAL(5, 2),
    satis_fiyati DECIMAL(7, 2),
    satis_tarihi DATE,
    kategori VARCHAR(50)
);

INSERT INTO manav () VALUES
(1, 'Elma', 10.5, 35.00, '2023-01-10', 'Meyve'),
(2, 'Muz', 20.0, 30.00, '2023-01-12', 'Meyve'),
(3, 'Portakal', 15.75, 42.50, '2023-01-14', 'Meyve'),
(4, 'Domates', 25.0, 25.00, '2023-01-16', 'Sebze'),
(5, 'Biber', 10.0, 30.00, '2023-01-18', 'Sebze'),
(6, 'Patlıcan', 13.5, 22.50, '2023-01-20', 'Sebze'),
(7, 'Salatalık', 17.0, 17.00, '2023-01-22', 'Sebze'),
(8, 'Üzüm', 22.0, 60.00, '2023-01-24', 'Meyve'),
(9, 'Kavun', 30.0, 45.00, '2023-01-26', 'Meyve'),
(10, 'Karpuz', 50.0, 50.00, '2023-01-28', 'Meyve'),
(11,'Elma', 2.5, 35.00, '2023-01-12', 'Meyve'),
(12,'Muz', 2.0, 30.00, '2023-01-12', 'Meyve'),
(13,'Portakal', 3.0, 15.00, '2023-01-12', 'Meyve'),
(14,'Domates', 4.0, 25.00, '2023-01-12', 'Sebze'),
(15,'Biber', 1.5, 25.00, '2023-01-12', 'Sebze'),
(16,'Patlıcan', 2.0, 20.00, '2023-01-12', 'Sebze'),
(17,'Salatalık', 3.0, 15.00, '2023-01-12', 'Sebze'),
(18,'Üzüm', 2.5, 50.00, '2023-01-12', 'Meyve'),
(19,'Kavun', 3.5, 40.00, '2023-01-12', 'Meyve'),
(20,'Karpuz', 5.0, 45.00, '2023-01-12', 'Meyve');

SELECT * FROM manav;


/*
=============================  SORU 1 =============================
    Manav tablosundaki her bir ürün icin toplam satıs mıktari nedir?
===================================================================
*/

SELECT urun_adi, SUM(miktar_kg)
FROM manav
GROUP BY urun_adi;

/*
=============================  SORU 2 =============================
    Manav tablosundaki en cok satilan urun nedir?
===================================================================
*/

SELECT urun_adi, SUM(miktar_kg)
FROM manav
GROUP BY urun_adi
ORDER BY toplam_satis DESC
LIMIT 1;


-- ****************************************************************************
/* 
======================== ALIASES ===========================
   Bir tablo goruntulerken
   Tablodaki sutun basliklarini degil de bizim belirleyecegimiz ozel bir degeri kullanmak istersek
   ALIASES kullaniriz
   
   Aliases kodu ile tablo yazdirilirken, 
   field isimleri sadece o cikti icin degistirilebilir.
===============================================================
*/

SELECT urun_adi AS en_cok_satilan_urun, SUM(miktar_kg) AS toplam_kg
FROM manav
GROUP BY urun_adi
ORDER BY SUM(miktar_kg) DESC
LIMIT 1;

-- ***************************************************************************

/*
=============================  SORU 3 =============================
    Manav tablosundaki her bir gun icin ortalama birim fiyati nedir?
===================================================================
*/

SELECT satis_tarihi, AVG(satis_fiyati) AS satis_fiyati
FROM manav
GROUP BY satis_tarihi;


/*
=============================  SORU 4 =============================
    Manav tablosundaki satilan en pahali urunun bilgileri nelerdir?
===================================================================
*/

SELECT * FROM manav
ORDER BY satis_fiyati DESC
LIMIT 1;

/*
=============================  SORU 5 =============================
    Manav tablosundaki her bir kategorideki en yüksek satıs fiyatına sahip ürünleri bulup
    bunları toplam satıs fiyatına göre azalan sirayla sıralayıp listeleyiniz.
===================================================================
*/

SELECT kategori, MAX(satis_fiyati) AS satis_fiyati
FROM manav
GROUP BY kategori
ORDER BY satis_fiyati DESC
LIMIT 5;












