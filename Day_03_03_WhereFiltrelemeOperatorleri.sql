use aboutdatabase;

-- kisiler tablosunu goruntuleyin
SELECT * FROM kisiler; 

-- kisiler tablosundan id sutununu silin

ALTER TABLE kisiler
DROP COLUMN id;

/*
 ===============================================
           KARSILASTIRMA OPERATORLERİ
 ===============================================
 */
/* Karsilastirma Operatörleri sütun degerlerini
 belirli bir değer veyabaska bir sütun degeriyle
 karsılastırmak icin kullanılır. 
 */
 
 /*
 > Eşittir (=): İki degerin eşit olup olmadıgını kontrol eder.
 */
 
 /*
========================  SORU 1 ========================
 Kisiler tablosundan 35 yaşolan kisilerin isim ve soyisimlerini listeleyiniz.
=========================================================
 */
 
 SELECT isim, soyisim 
 FROM kisiler
 WHERE yas = 35;
 
 
 /*
   Büyüktür (>), Küçüktür (<): Sayısal değerlerin büyüklük/küçüklüğünü karşılaştırır.
*/
/*
*************** SYNTAX ***************
SELECT * FROM tablo_adı WHERE sütun_adı > 1;
SELECT * FROM tablo_adı WHERE sütun_adı < 1;
*/
/*
========================  SORU 2 ========================
    Kisiler tablosundaki yasi 30 `dan buyuk olan kisilerin
    bilgilerini listeleyiniz.
=========================================================
 */
 SELECT * FROM kisiler
 WHERE yas > 30;
 
 /*
===============================================
 CHAR veya VARCHAR türündeki ifadeler için de büyüktür (>) ve küçüktür (<)
 operatörleri kullanılabilir. Bu operatörler, karakter dizileri (stringler)
 arasında alfabetik veya leksikografik karşılaştırma yapar.
 Bu tür karşılaştırmalar, karakter dizilerinin alfabetik sırasına göre büyük
 veya küçük olup olmadıklarını belirlemek için kullanılır.
 (ASCII tablosundaki yerlerine gore karakterleri siralar)
===============================================*/
/*
========================  SORU  ========================
    Kisiler tablosundaki ismi 'emre' den buyuk olan kisilerin
    isimlerini listeleyiniz.
=========================================================
 */
 
 
SELECT isim FROM kisiler
WHERE isim > 'emre';

/*
 MySQL ozellikle belirtmedigimiz surece case sensitive degildir
 Biz case sensitive olmasini ozellikle belirtmedikce 
 kucuk buyuk harf ayirimi yapmaz
*/

/*
========================  SORU  ========================
    Kisiler tablosundaki sehri 'D' den buyuk olan sehirlerde
    yasayan kisileri isim ve soyisim  bilgilerini listeleyiniz.
=========================================================
 */

SELECT isim,soyisim, sehir
FROM kisiler
WHERE sehir > 'D';

/*==============================================
Büyük eşittir (>=), > Küçük eşittir (<=): Sayısal değerlerin
büyüklüğünü/küçüklüğünü eşitlikle birlikte karşılaştırır.
==============================================*/

/*==============================================
Büyüktür (>) ve küçüktür (<) operatörleri kullanıldığında, karşılaştırmada
belirtilen değer genellikle dahil edilmez; yani sorgulanan değer "hariç" tutulur.
Bu, sayısal değerler, tarihler ve karakter dizileri gibi farklı veri türleri için
geçerlidir. Eğer belirtilen değeri de dahil etmek istiyorsanız, büyük eşittir (>=)
veya küçük eşittir (<=) operatörlerini kullanmanız gerekir.
==============================================*/

/*
*************** SYNTAX ***************
SELECT * FROM tablo_adı WHERE sütun_adı > 1;
SELECT * FROM tablo_adı WHERE sütun_adı < 1;
*/

/*
========================  SORU  ========================
    Kisiler tablosundaki sehri 'Konya' dan kucuk veya esit olan sehirlerde
    yasayan kisilerin isim ve soyisim  bilgilerini listeleyiniz.
=========================================================
 */

SELECT isim, soyisim
FROM kisiler
WHERE sehir <= 'Konya';

/*
 ========================  SORU  ========================
    Kisiler tablosundaki yasi 35 den kucuk veya esit olan kisilerin
    bilgilerini listeleyiniz.
 =========================================================
 */

SELECT * FROM kisiler
WHERE yas <= 35;


/*
 ===============================================
   Değildir (<> veya !=): İki değerin birbirine eşit olmadığını kontrol eder.
 ===============================================*/
 
 /*
*************** SYNTAX ***************
SELECT * FROM tablo_adı WHERE sütun_adı <> 1;
SELECT * FROM tablo_adı WHERE sütun_adı != 1;
*/
 
 /*  
 ========================  SORU  ========================
    Kisiler tablosundaki sehri Trabzon olmayan kisilerin
    bilgilerini listeleyiniz.
 =========================================================
 */


SELECT * FROM kisiler
WHERE sehir <> 'Trabzon'; --  ya da ! de kullanılarbilirdi.

/*
 ========================  SORU  ========================
    Kisiler tablosundaki soyismi Gunes olmayan kisilerin
    bilgilerini listeleyiniz.
 =========================================================
 */

SELECT * FROM kisiler
WHERE soyisim != 'Gunes';

/*
===============================================
       WHERE/  MANTIKSAL OPERATORLER
===============================================*/
/*
"AND" , "OR" , "NOT" , SQL sorgu dili içinde kullanılan mantıksal operatorlerdir.
Bu operatorler, sorgularda belirli kosulların nasıl birlestirilecegını ve 
degerlendirilecegını kontrol eder. Bu operatorlerin kullanımı, veritabanı 
sorgularınızın esneklıgını ve gucunu artırır.
*/


/*
===============================================
       WHERE/  Mantiksal Operatorler / AND
===============================================*/
/*
1- "AND" operatörü, birden fazla koşulun aynı anda karşılanması gerektiğinde kullanılır.
2- Tüm "AND" operatörüyle bağlanmış koşulların TRUE olması durumunda sonuç TRUE döner.
3- Eğer koşullardan herhangi biri FALSE ise, sonuç da FALSE olur.
Örnek: SELECT * FROM tablo_adi WHERE sütun1 = 'değer1' AND sütun2 = 'değer2' sorgusu,
hem sütun1'in 'değer1' değerine eşit olduğu hem de sütun2'nin 'değer2' değerine eşit olduğu 
kayıtları secer.
*/
/*
*************** SYNTAX ***************
SELECT * FROM tablo_adı 
WHERE 1sütun_adı = 1 
AND 2sütun_adı = 2 ;
*/

/*
========================  SORU   ========================
 Kisiler tablosundan 29 yaşından büyük olan ve Ankara'da yaşayan kişileri listeleyiniz.
=========================================================
 */

SELECT * FROM kisiler
WHERE yas > 29
AND sehir = 'Ankara';

/*
========================  SORU  ========================
 Kisiler tablosundan Adı 'Fatma' olan ve Bursa'da yaşayan kişilerin yasini listeleyiniz.
=========================================================
 */

SELECT yas
FROM kisiler
WHERE isim = 'Fatma' 
AND sehir = 'Bursa';

/*
========================  SORU  ========================
 Kisiler tablosundan ismi Ayse ve soyismi Kaya olan kişileri listeleyiniz.
=========================================================
 */

SELECT * FROM kisiler
WHERE isim = 'Ayse'
AND soyisim = 'Kaya';

/* 
 ===============================================
                   BETWEEN
 ===============================================*/
 
 /*
BETWEEN anahtar kelimesi, SQL'de bir aralıktaki değerleri seçmek için kullanılır.
 Bu anahtar kelime genellikle sayısal değerler, tarihler ve metinlerle kullanılır
 ve belirtilen iki değer arasındaki tüm değerleri kapsar. 
 BETWEEN ile belirlenen aralık her iki uç değeri de içerir, yani "başlangıç" ve "bitiş"
 değerleri sorgu sonuçlarına dahildir.
*/
 
 /*
*************** SYNTAX ***************
SELECT sütun_adı
FROM tablo_adı
WHERE sütun_adı BETWEEN değer1 AND değer2;
*/

/*  
 ========================  SORU  ========================
 Kisiler tablosundan yaşı 25 ile 35 arasında olan kişileri listeleyiniz.
 =========================================================
 */

SELECT * FROM kisiler
WHERE yas
BETWEEN 25 AND 35; 

/*
========================  SORU  ========================
 Kisiler tablosundan yaşı 25 ile 35 arasında olan ve Ankara'da yaşayan kişileri listeleyiniz.
=========================================================
 */

SELECT * FROM kisiler
WHERE yas
BETWEEN 25
AND 35
AND sehir = 'Ankara'; 


/*
===============================================
        Mantiksal Operatorler / OR
===============================================*/
/*
1- "OR" operatörü, birden fazla koşuldan en az birinin karşılanması 
gerektiğinde kullanılır.
2- Koşullardan herhangi biri TRUE ise, sonuç TRUE döner.
3- Tüm koşullar FALSE ise, sonuç FALSE olur.
Örnek: SELECT * FROM tablo_adi WHERE sütun1 = 'değer1' OR 
sütun2 = 'değer2' sorgusu, sütun1'in
'değer1' değerine eşit olduğu veya sütun2'nin 'değer2' 
değerine eşit olduğu kayıtları seçer.
*/
/*
*************** SYNTAX ***************
SELECT * FROM tablo_adı 
WHERE 1sütun_adı = 1 
OR 2sütun_adı = 2 ;
*/
/*  
========================  SORU  ========================
 Kisiler tablosundan yaşı 22 veya 35 olan kişileri listeleyiniz.
=========================================================
 */
 
 SELECT * FROM kisiler
 WHERE yas = 22 OR yas = 35;
 
/*
========================  SORU  ========================
 Kisiler tablosundan 29 yaşından büyük olan veya Ankara'da yaşayan kişileri listeleyiniz.
=========================================================
 */

SELECT * FROM kisiler
WHERE yas >29 OR sehir = 'Ankara'; 
 
 /*
========================  SORU  ========================
 Kisiler tablosundan İstanbul, Ankara veya İzmir'de yaşayan kişileri listeleyiniz.
=========================================================
 */
 
 SELECT * FROM kisiler
 WHERE sehir = 'İstanbul'
 OR sehir = 'Ankara'
 OR sehir = 'Izmir';
 
  /*
===============================================
                  IN OPERATORU
===============================================*/
/*
/*
 SQL'de IN operatörü, belirli bir sütunun değerlerini belirtilen bir değerler
 listesiyle karşılaştırmak için kullanılır. Bu operatör, sorgulanacak değerlerin
 bir listesini parantez içinde alır ve belirtilen sütunun değeri bu listedeki 
 herhangi bir değerle eşleşirse, o satırı sonuç kümesine dahil eder. IN operatörü,
 birden çok OR koşulunu daha okunaklı ve kısa bir şekilde yazmanın bir yoludur.
*/
/*
*************** SYNTAX ***************
SELECT sütun_adları
FROM tablo_adi
WHERE sütun_adi IN (değer1, değer2, ..., değerN);
*/
/*  
========================  SORU  ========================
 Kisiler tablosundan İstanbul, Ankara veya İzmir'de yaşayan kişileri listeleyiniz.
=========================================================
 */
 
 SELECT * FROM kisiler
 WHERE sehir = 'İstanbul'
 OR sehir = 'Ankara'
 OR sehir = 'Izmir';
 
 -- Bu OR ile cozum.
 -- Asagıdaki de IN ile cozum 
 
SELECT * FROM kisiler
WHERE sehir IN ( 'İstanbul', 'Ankara', 'Izmir');
 
 /*
========================  SORU ========================
    Kisiler tablosundan Soyadı 'Demir', 'Çelik' veya 'Kaya' olan kişileri listeleyiniz.
=========================================================
 */
 
SELECT * FROM kisiler
WHERE soyisim IN ( 'Demir', 'Çelik','Kaya');

/*
 ===============================================
        Mantiksal Operatorler / NOT
 ===============================================*/
 
/*
1- "NOT" operatörü, bir koşulun sonucunu tersine çevirmek için kullanılır.
2- Eğer koşul TRUE ise, "NOT" operatörü sonucu FALSE yapar; koşul FALSE ise, sonucu TRUE yapar.
3- Genellikle "NOT IN", "NOT EXISTS", "NOT LIKE" gibi ifadelerde kullanılır.
Örnek: SELECT * FROM tablo_adi WHERE NOT sütun1 = 'değer1' sorgusu, sütun1'in 
'değer1' değerine eşit olmayan tüm kayıtları seçer.
*/
/*
*************** SYNTAX ***************
SELECT * FROM tablo_adı 
WHERE NOT sütun_adı = 1;
*/
/*  
========================  SORU ========================
 Kisiler tablosundan  İstanbul'da yaşamayan kişileri listeleyiniz.
=========================================================
 */
 
 -- Once Istanbul'da yasayanları bulalım.
 
SELECT * FROM kisiler 
WHERE sehir = 'Istanbul' ;

--  Sonra NOT operatoru ile bu sorguyu tersine cevirecegız.
-- Bu soru 3 sekilde cevaplandı ve 3 u de aynı anlamı tasır.

SELECT * FROM kisiler 
WHERE NOT sehir = 'Istanbul' ;

SELECT * FROM kisiler 
WHERE sehir != 'Istanbul' ;

SELECT * FROM kisiler 
WHERE sehir <> 'Istanbul' ;

/*
========================  SORU  ========================
 Kisiler tablosundan 30 yaşından büyük olmayan kişileri listeleyiniz.
=========================================================
 */
 -- once 30 yasından buyuk olanları bulalım
 
 SELECT * FROM kisiler 
WHERE yas > 30; 

-- NOT operatoru ile sorgulamayı tersine cevirelim

SELECT * FROM kisiler 
WHERE NOT yas > 30; 

/*
 ========================  SORU  ========================
 Kisiler tablosundan soyadı 'Yılmaz' veya 'Kara' olmayan kişileri listeleyiniz.
 =========================================================
 */
 
SELECT * FROM kisiler 
WHERE NOT soyisim IN ( 'Kara',  'Yılmaz');




































 
 



































































































































































