use aboutdatabase;
/*
===============================================
        LIKE OPERATORU 
===============================================
*/
/*
1- "LIKE" operatörü, belirli bir patern veya düzene uyan verileri bulmak için kullanılır.
2- Genellikle "%" (yüzde) ve "_" (alt çizgi) olmak üzere iki joker karakterle kullanılır.
3- "%" karakteri, sıfır veya daha fazla karakterin yerini tutar.
4- "_" karakteri ise tek bir karakterin yerini tutar.
Örneğin, "LIKE '%son'" ifadesi "son" ile biten tüm metin değerlerini bulur 
(örn. "Jason", "Wilson").

/*
Kısa Not: Örn1; "A%" --> % operatoru A' dan sonra gelen tüm karakterleri karsılar. Ne ve kac sayıda olursa olsun.
Orn2: "A_" --> _ operatoru A 'dan sonra sadece tek bir karakterin oldugu anlamını tasır.Karakterin ne oldugu onemsiz.
*/

/*
*************** SYNTAX ***************
SELECT sütun_adları
FROM tablo_adı
WHERE sütun_adı 
LIKE 'patern';
*/


CREATE TABLE personel(
id CHAR(5),
isim VARCHAR(50),
maas INT
);


INSERT INTO personel VALUES('10001','Ahmet Aslan',7000);
INSERT INTO personel VALUES('10002','Mehmet Yilmaz',12000);
INSERT INTO personel VALUES('10003','Meryem',7215);
INSERT INTO personel VALUES('10004','Veli Han',5000);
INSERT INTO personel VALUES('10005','Mustafa Ali',5500);
INSERT INTO personel VALUES('10006','Ayse Can',5600);
INSERT INTO personel VALUES('10010','Ayse',4700);
INSERT INTO personel VALUES('10009','Ayse Cemile',4000);
INSERT INTO personel VALUES('10008','Ayse Fatma',4300);
INSERT INTO personel VALUES('10007','Beyza Ayse',7700);
INSERT INTO personel VALUES('10011','Yeliz Alina',12700);

SELECT * FROM personel;


/*  
=============================  SORU 1 =============================
    Personel tablosundan ismi 'A' ile baslayan personeli listeleyiniz.
===================================================================
 */
 
SELECT * FROM personel
WHERE isim
LIKE 'A%';

-- SQL'de 'a' != 'A'
-- Ancak MySQL Workbanch default olarak Case Insensitive calısır.
-- Aksi belirtilmediği sürece MySQL Workbanch icin 'a' = 'A' dır. 
--  UYARI: Başka bir workbanch de bu böyle olmayabilir.!

/*
=============================  SORU 2 =============================
    Personel tablosundan ismi Ayse olan personeli listeleyiniz.
===================================================================
 */
-- SADECE 'ayse' ile baslayan değil içinde 'ayse' olan tüm isimler

SELECT * FROM personel
WHERE isim
LIKE '%Ayse%';

/*
=============================  SORU 3  =============================
    Personel tablosundan isminin 2. harfi 'e' olup diğer harflerinde 'y' olan personeli listeleyiniz
===================================================================
 */


SELECT * FROM personel
WHERE isim
LIKE '%_e%'
AND isim LIKE '%y%'; 

/*
=============================  SORU 4  =============================
    Personel tablosundan isminin 1. harfi 'a' ve 7. harfi 'a' olan
    personeli listeleyiniz
===================================================================
 */

SELECT * FROM personel
WHERE isim
LIKE 'a_____a%';


/* 
===============================================
           REGEXP_LIKE OPERATORU 
===============================================
1- "REGEXP_LIKE" (veya bazen "RLIKE" olarak da bilinir), daha karmaşık ve 
   güçlü bir arama yapmak için düzenli ifadeleri (regular expressions) kullanır.
2- Düzenli ifadeler, metin içindeki PATERN'leri tanımlamak için kullanılan bir dil 
   veya sözdizimidir.
3- "REGEXP" operatörü, çok daha spesifik ve esnek aramalar yapmanıza olanak tanır.
4- [!-~] = Butun karakterleri karsilayan tek bir karakteri ifade eder.
   [a-zA-Z0-9] = Harf ve rakamlari temsil eden bir karakteri ifade eder.
5- '^' isareti baslangici belirtir.
6- '$' isareti bitisi belirtir.  
7- '|' karakteri veya anlaminda kullanilir.
8- '.' herhangi bir tek karakter anlamina gelir'
 
Örneğin, "REGEXP '^J.*son$'" ifadesi "J" ile başlayıp "son" ile biten tüm metin değerlerini bulur
 (örn. "Jason" ama "Wilson" değil).
*/
/*
*************** SYNTAX ***************
 SELECT sutun1,sutun2,...
 FROM tablo_adi
 WHERE REGEXP_LIKE(sutun_adi, 'pattern[]');
*/

CREATE TABLE kelimeler (
        id int UNIQUE,
        kelime VARCHAR(50),
        harf_sayisi int
    );
    
    
INSERT INTO kelimeler VALUES 
    (1001, 'hot', 3),
    (1002, 'hat', 3),
    (1003, 'hit', 3),
    (1004, 'hbt', 3),
    (1005, 'hct', 3),
    (1006, 'adem', 4),
    (1007, 'selim', 5),
    (1008, 'yusuf', 5),
    (1009, 'hip', 3),
    (1010, 'HOT', 3),
    (1011, 'hOt', 3),
    (1012, 'h9t', 3),
    (1013, 'hoot', 4),
    (1014, 'haaat', 5),
    (1015, 'hooooot', 7),
    (1016, 'h-t', 3),
    (1017, 'h?t', 3),
    (1018, 'hOOOt', 5),
    (1019, 'O', 1);
    
    SELECT * FROM kelimeler;
    
    /*  
=============================  SORU  =============================
    Kelimeler tablosundan icerisinde 'ot' veya 'at' bulunan kelimeleri
    listeleyiniz
===================================================================
 */
 
 SELECT kelime 
 FROM kelimeler
 WHERE REGEXP_LIKE (kelime 'ot|at');
 
 SELECT kelime
 FROM kelimeler
 WHERE kelime LIKE '%ot%' OR kelime LIKE '%at%';
 
 
 /* 
 ===============================================
           CASE SENSITIVE / CASE INSENSITIVE
 ===============================================
 */
 
 
 /*
    Case Sensitive (Büyük/Küçük Harfe Duyarlılık)
    Bir sorgu veya veritabanı işlemi case sensitive olduğunda, 
    büyük ve küçük harfler farklı kabul edilir. 
    Örneğin, 'a' ve 'A' farklı karakterler olarak değerlendirilir.
    KULLANIM: sorgu sonuna 'c' seklinde patern eklenerek belirtilmelidir.
 */
 
 /*
    Case Insensitive (Büyük/Küçük Harfe Duyarsızlık)
    Bir sorgu veya işlem case insensitive olduğunda, 
    büyük ve küçük harf farkı göz ardı edilir. 
    Yani, 'a' ve 'A' aynı karakter olarak kabul edilir.
    KULLANIM: sorgu sonuna 'i' seklinde patern eklenerek belirtilmelidir.
*/
 
 /*
    NOT: Mysql de default caseType insensitive olarak kabul edilmektedir.
    Case Sensitive oldugu ozellikle belirtilmemis ise default type degeri 
    olan insensitive gecerlidir
 */
 
 
 /*  
=============================  SORU  =============================
    Kelimeler tablosundan icerisinde 'ot' veya 'at' bulunan kelimeleri
    case-sensitive'e dikkat ederek listeleyiniz.
===================================================================
 */ 
 
 SELECT kelime FROM kelimeler
 WHERE REGEXP_LIKE (kelime, 'ot|at','c'); 
 -- Eger sadece yazdıgımızi arasın istiyorsak 'c' eklemelıyız.
 -- Diğer turlu insensitive olarak algılayıp devam eder.
 
 SELECT kelime FROM kelimeler
 WHERE REGEXP_LIKE (kelime, 'ot|at','i'); 

/*
=============================  SORU  =============================
    Kelimeler tablosunda icinde 'ho' veya 'hi' gecen kelimeleri
    case-sensitive'e dikkat etmeksizin listeleyiniz.
===================================================================
 */
 
SELECT kelime FROM kelimeler
WHERE REGEXP_LIKE (kelime, 'ho|hi','i'); 
 
 /*
=============================  SORU  =============================
    Kelimeler tablosundan sonu 't' veya 'm' ile bitenleri
    case-sensitive'e dikkat etmeksizin listeleyiniz.
===================================================================
 */
 
SELECT kelime FROM kelimeler
WHERE REGEXP_LIKE (kelime, 't$|m$','i'); 

/*
=============================  SORU  =============================
    Kelimeler tablosundan icinde 'h' ile baslayıp 't' ile biten 3 karakterli kelimeleri
    (h ile t kucuk harfi olanları) listeleyiniz.
===================================================================
 */
 
 SELECT kelime
 FROM kelimeler
 WHERE REGEXP_LIKE (kelime, '^h[!-~]t$');


SELECT kelime
 FROM kelimeler
 WHERE REGEXP_LIKE (kelime, '^h[0-9]t$');
 
 SELECT kelime
 FROM kelimeler
 WHERE REGEXP_LIKE (kelime, '^h[a-zA-Z]t$');
 
 /* ÖNEMLİ!!!!!!!!!!!
------------------------------KARSILASTIRMA------------------------------

Esneklik: "REGEXP" daha esnek ve güçlüdür, karmaşık desenleri tanımlayabilir.
"LIKE" ise daha basit ve sınırlı desenlerle çalışır.

Performans: "LIKE" operatörü genellikle "REGEXP" operatörüne göre daha hızlıdır,
çünkü daha basit desenleri işler.

Kullanım Kolaylığı: "LIKE" daha basit ve anlaşılması daha kolaydır. "REGEXP"
ise düzenli ifadelerin nasıl çalıştığını bilmeyi gerektirir, bu da öğrenme eğrisini artırır.
*/

 
 
 
