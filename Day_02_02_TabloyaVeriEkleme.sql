use aboutdatabase;
/*
===============================================
          TABLOYA VERI GIRISI - INSERT
===============================================
*/


/*
-------------------- NOT -------------------------
   Degerleri girerken dikkat edilmesi gerekenler;
1- Tabloyu olustururken hangi data type belirlediysek o
   datatype cinsinden veri girisi yapmaliyiz
2- Metin ifadeleri 'tek tirnak' icinde yaziyoruz.
3- DATE data type'da 'tek tirnak' icinde yazilir.
4- MySQL'in default tarih formati YYYY-MM-DD seklindedir.
5- Eger kait olustururken tablodaki tum sutunlara deger girilecekse
	sutun isimlerini tek tek yazmaya gerek olmadan degerleri girebiliriz.
	Ancak tum sutunlara degil belirli sutunlara giris yapacaksak hangi sutunlara giris yapacagimizi belirtmemiz gerekir.
--------------------------------------------------
*/

/*
*************** SYNTAX ***************
INSERT INTO table_name (columns)
    VALUES (
    std_id ,           
    std_name ,     
    std_age                   
    );
*/

-- kitaplar tablosundaki her seyi goruntuleyin

SELECT * FROM kitaplar;


-- kitaplar tablosuna tum sutunlara bir deger girerek bir kayt ekleyelim

INSERT INTO kitaplar() 
VALUES (1,'Sefiller', 'Victor Hugo',1862, 'Roman');


-- kitaplar tablosundaki her seyi yeniden goruntuleyin
-- SQL'de bir komutu calistirmak icin yeniden yazmak SART DEGILDIR
-- daha once yazdigimiz bir komutu secip calistirabiliriz


/*
	Query sayfasindaki komutlar, database'den bagimsizdir
    Bu komutlar HER CALISTIGINDA kendisine verilen gorevi yeniden yapar
    Query calisirken daha once Database'e kaydedilip kaydedilmemesine bakmaz
    ornegin 42.satirdaki kayit ekleme komutunu 2 kere tekrar calistiralim
*/


/*  
========================  SORU ========================
 Kitaplar tablosuna null deger olmadan coklu veri girisi saglayiniz.
=========================================================
 */
 INSERT INTO kitaplar() 
VALUES (2,'Suç ve Ceza', 'Fyodor Dostoyevski',	1866,'Psikolojik'),
		(3, 'Yabanci', 'Albert Camus', 1942, 'Roman'),
        (4, 1984, 'George Orwel', 1949, 'Disatopya'),
        (5, 'Fareler ve İnsanlar', 'John Steinbeck' ,1937, 'Roman'),
        (6,'Kucuk Prens' ,'Antoine de Saint-Execupery', 1943, 'Cocuk');

-- Eger tablo ile ilgili kitap_id UNIQUE olsun veya 
-- kitap_adi NULL OLMASIN gibi belirli sartlar koymak isterseniz
-- tablo olusturulurken bu sinirlamalari belirtmeliyiz


-- kitaplar tablosuna id'si 11 ve kitap_ismi 'Ask ve Gurur' olan bir kitap ekleyin

INSERT INTO kitaplar(kitap_id,kitap_adi) 
VALUES (7 ,'Araba Sevdasi');

SELECT * FROM kitaplar;


/*  
========================  SORU ========================
 Personel tablosuna null deger olmadan coklu veri girisi saglayiniz.
=========================================================
 */

SELECT * FROM personel;

INSERT INTO personel() 
VALUES(1, 'Ayse', 'CELIK', '1988-10-06', 45000,'Muhasebeci'),
	  (2, 'Elif', 'DEMIR', '1988-12-06', 55000, 'QA Tester'),
      (3, 'Mert', 'Kaya', '1992-09-05', 45000,'Depo Gorevlisi');
      
INSERT INTO personel () 
VALUES ('4', 'Mehmet' , 'YILMAZ' , '1993-03-01' , '50000', 'Mudur');      

