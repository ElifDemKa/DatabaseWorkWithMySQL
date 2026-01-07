use aboutdatabase;

-- ====================== UNION ======================
/*  
   1-Iki farkli sorgulamanin sonucunu birlestiren islemdir.
    Iki veya daha fazla Sorgu ifadesinin sonuc kumelerini 
    birlestirerek tek bir sonuc kumesi olusturur.
    
   2.sorgunun sonuna ORDER BY komutunu kullanirsaniz 
    tum tabloyu istediginiz siralamaya gore siralar. 
    
  NOT: Secilen Field SAYISI'nin ayni olmasi zorunludur.
    ve DATA TYPE'i ayni olmasi sonucun anlamli olmasi icin onemlidir.  
     Syntax:
    ----------
    SELECT sutun_adi,sutun_adi2, .. FROM tablo_adi1
    UNION 
    SELECT sutun_adi1, sutun_adi2, .. FROM tablo_adi2;
    
    NOT: UNION operatoru SADECE benzersiz degerleri alir. 
    Benzer verileri almak icin UNION ALL kullanilir.
    
    
*/
CREATE TABLE kadro (
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
 
INSERT INTO kadro VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO kadro VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO kadro VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500,'Honda');
INSERT INTO kadro VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO kadro VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO kadro VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO kadro VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
INSERT INTO kadro VALUES(345678902, 'Mehmet Ozturk', 'Izmir', 3500,'Honda');   
 
 SELECT * FROM kadro;
 
 -- 1) Honda ve Tofas'ta calisan benzersiz isimdeki personelleri listeleyin
 
 -- 1. YOL
 SELECT DISTINCT isim
 FROM kadro
 WHERE  sirket IN ('Honda' ,'Tofas');
 
 -- 2. YOL
 -- hepsini getirmek istersek
 
 SELECT DISTINCT isim
 FROM kadro
 WHERE  sirket='Honda'
 UNION
 SELECT isim FROM kadro
 WHERE sirket= 'Tofas';
 
 
 -- 2- Honda , Ford ve Tofasta calısan personlelleri isim sıralı listeleyınız
 SELECT DISTINCT isim
 FROM kadro
 WHERE  sirket='Honda'
 UNION
 SELECT isim 
 FROM kadro
 WHERE sirket= 'Tofas'
 UNION
 SELECT isim 
 FROM kadro
 WHERE sirket= 'Ford'
 ORDER BY isim;
 
 -- Maasi 4000'den fazla olan isci isimlerini ve 5000'den fazla
 -- maas alinan sehirleri ayni sutunda alt alta gosteren sorguyu yaziniz
 
 SELECT isim AS isim_sehir FROM kadro
 WHERE maas > 4000
 UNION
 SELECT sehir FROM kadro
 WHERE maas > 5000;
 
 
  -- 5000'den az maas alanlarin , buna ek olarak Honda calisani olmayanlarin
 -- isim bilgilerini listeleyiniz.
 
 SELECT isim FROM kadro
 WHERE maas < 5000
 UNION
 SELECT isim FROM kadro
 WHERE  sirket != 'Honda';
 
 -- kadro ve people tablolarindaki tum kayitlari listeleyin

SELECT * FROM kadro
 UNION
 SELECT * FROM people;
 
 
 SELECT * FROM people
 UNION
 SELECT * FROM puanlar;
 -- sutun sayilari farkli oldugu icin hata verir
 
 
 
 /*
SELECT (AGGREATE FUNCTION, DISTINCT) AS name
FROM table_name
WHERE CONDITION(LIKE, IN, REGEXP_LIKE, IS NULL, EXISTS, BETWEEN, AND, OR)
GROUP BY
HAVING
ORDER BY (ASC/DESC)
LIMIT OFFSET
*/

 
 /*============================== JOIN ISLEMLERI ===============================


Union,Union All Operatorleri farkli tablolardaki sutunlari 
 birlestirmek icin kullanilir.

   Join islemleri ise farkli Tablolari birlestirmek icin kullanilir. Diger 
    bir ifade ile farkli tablolardaki secilen sutunlar ile yeni bir tablo 
    olusturmak icin kullanilabilir.
    
    JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. Cunku;
    Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek 
    icin JOIN islemleri kullanilabilir.
    
 mySQL'de 3 Cesit Join islemi kullanilabilmektedir.
    
    1) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
    2) LEFT JOIN:  Ilk tabloda (Sol) olan sonuclari gosterir
    3) RIGHT JOIN:  Ikinci tabloda (Sag) olan tum sonuclari gosterir   

full JOIN=(left join + union + right join) Tablodaki tum sonuclari gosterir

*/

CREATE TABLE sirket 
(
    sirket_id INT , 
    sirket_isim VARCHAR(20)
);

    INSERT INTO sirket VALUES(100, 'Toyota');
    INSERT INTO sirket VALUES(101, 'Honda');
    INSERT INTO sirket VALUES(102, 'Ford');
    INSERT INTO sirket VALUES(103, 'Hyundai');
    
    
    CREATE TABLE siparisler    
(
    siparis_id INT,
    sirket_id INT, 
    siparis_tarihi DATE
);
    
    INSERT INTO siparisler VALUES(11, 101, '2020-04-17');
    INSERT INTO siparisler VALUES(22, 102, '2020-04-18');
    INSERT INTO siparisler VALUES(33, 103, '2020-04-19');
    INSERT INTO siparisler VALUES(44, 104, '2020-04-20');
    INSERT INTO siparisler VALUES(55, 105, '2020-04-21');


 SELECT * FROM sirket;
 SELECT * FROM siparisler;



/*=============================== INNER JOIN  ==================================
    
    Iki tablonun kesisim kumesi ile yeni bir tablo olusturmak icin kullanilir.
    
    1) Select'ten sonra tabloda gormek istediginiz sutunlari yazarken
       table_name.field_name seklinde yazin.
    2) From'dan sonra table_name yazarken 
       1. table_name + INNER JOIN + 2. table_name yazmaliyiz.
    3) Join'i hangi kurala gore yapacaginizi belirtmelisiniz. 
       Bunun icin ON kuralimiz yazilmali.
    
    Syntax
    -----------
    SELECT table1.sutun1,table2.sutun2....sutunN
    FROM tablo1 
    INNER JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
    
================================================================================*/

-- Iki Tabloda sirket_id'si ayni olanlarin sirket_ismi, siparis_id ve 
-- siparis_tarihleri listeleyen bir sorgu yaziniz.

SELECT siparisler.sirket_id, sirket.sirket_isim, 
siparisler.siparis_id, siparisler.siparis_tarihi
FROM siparisler INNER JOIN sirket
ON siparisler.sirket_id = sirket.sirket_id;


-- INNER JOIN kullanilirken sadece iki tabloda ortak olan degerleri alir.
-- Bu sorgu icin sirket tablosundan (sirket_id= 101, 102, 103) siparisler tablosunda da 
-- oldugu icin o degerlerin sonucunu getirdi


/*=============================== LEFT JOIN  ==================================
    
    LEFT JOIN, 1. tablodan (sol tablo) SELECT ile ifade edilen sutunlara ait tum
    satirlari getirir. 
    Ancak, diger tablodan sadece ON ile belirtilen kosula uyan satirlari getirir. 
    
    1) Left Join'de ilk tablodaki tum record'lar gosterilir.
    2) Ilk tablodaki datalara 2.tablodan gelen ek datalar 
       varsa bu ek datalar ortak datalar icin gosterilir, 
       ancak ortak olmayan datalar icin o kisimlar bos kalir.
    3) Ilk yazdiginiz Tablonun tamamini aldigi icin hangi tabloyu
       istedigimize karar verip once onu yazmaliyiz. 
        
    Syntax
    -----------
    SELECT table.sutun1,table....sutunN
    FROM tablo1 
    LEFT JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
    
==============================================================================*/ 

/* -----------------------------------------------------------------------------
  ORNEK2: sirket tablosundaki tum sirketleri ve bu sirketlere ait olan 
  siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/

SELECT sirket.sirket_isim, siparisler.siparis_id, siparisler.siparis_tarihi
FROM sirket LEFT JOIN siparisler
ON sirket.sirket_id = siparisler.sirket_id;


-- FROM komutundan sonra LEFT JOIN'de ilk tablodaki tum satirlar gosterilir.
-- ILK tablodan sonra ON kosulunda ne yaziyorsa onun sonuclari gosterilir.
-- Kosula uymayan satirlar NULL olarak gosterilir.


/*=============================== RIGHT JOIN  ==================================
    
    RIGHT JOIN, 2. tablodan (sag tablo) SELECT ile ifade edilen sutunlara ait tum
    satirlari getirir. 
    Ancak, diger tablodan sadece ON ile belirtilen kosula uyan satirlari getirir. 
    
    1) Right Join'de ikinci tablodaki tum record'lar gosterilir.
    2) Ikinci tablodaki datalara 1.tablodan gelen ek datalar 
       varsa bu ek datalar ortak datalar icin gosterilir, 
       ancak ortak olmayan datalar icin o kisimlar bos kalir.
    
        
    Syntax
    -----------
    SELECT table.sutun1,table.sutun2....sutunN
    FROM tablo1 
    RIGHT JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
    
==============================================================================*/

-- siparisler tablosundaki tum sirketleri ve bu sirketlere ait olan 
-- siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.

SELECT sirket.sirket_isim, siparisler.siparis_id, siparisler.siparis_tarihi
FROM sirket RIGHT JOIN siparisler
ON sirket.sirket_id = siparisler.sirket_id;



/*=============================== FULL JOIN  ==================================
    
    FULL JOIN (LEFT JOIN + UNION + RIGHT JOIN)
    FULL JOIN her iki tablo icin secilen sutunlara ait olan 
    satirlari getirmek icin kullanilir.
    
        
    Syntax
    -----------
    SELECT table.sutun1,table.sutun2....sutunN
    FROM tablo1 
    LEFT JOIN tablo2
    ON tablo1.sutun = tablo2.sutun
    UNION
    SELECT table.sutun1,table.sutun2....sutunN
    FROM tablo1 
    RIGHT JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;    



    FULL JOIN de iki tabloda var olan tum recordlar getirilir.
    Bir tabloda olup obur tabloda olmayan recordlar bos kalir.

    
==============================================================================*/  


-- sirket ve siparisler adindaki tablolarda yer alan sirket_id, 
-- sirket_isim, siparis_id ve siparis_tarihleri'ni listeleyen bir query yaziniz




SELECT sirket.sirket_isim, siparisler.siparis_id, siparisler.siparis_tarihi
FROM sirket LEFT JOIN siparisler
ON sirket.sirket_id = siparisler.sirket_id
UNION
SELECT sirket.sirket_isim, siparisler.siparis_id, siparisler.siparis_tarihi
FROM sirket RIGHT JOIN siparisler
ON sirket.sirket_id = siparisler.sirket_id;


-- -*-*-*-*--**-*--*-*-*-*-*- THE END -*-*-*-*-*-*-*-*--*-*- -- 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 