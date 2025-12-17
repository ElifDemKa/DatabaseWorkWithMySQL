use aboutdatabase;

/*
===============================================
        TABLODAN SORGULAMA YAPMAK / SELECT
===============================================
*/
/*
Tüm Sütunları Seçme: Eğer tablodaki tüm sütunlardaki verilere ihtiyacınız varsa, 
yıldız işareti (*) kullanarak tüm sütunları seçebilirsiniz. Bu, tablodaki her bir
 sütundan veri getirir.
*/
/*
*************** SYNTAX ***************
SELECT * FROM table_name;
*/
/*
Belirli Sütunları Seçme: Eğer sadece tablonun belirli sütunlarındaki
 verilere ihtiyacınız varsa, bu sütunların adlarını SELECT komutundan
 sonra, FROM komutu ile belirtilen tablo adından önce sıralayabilirsiniz
*/
/*
*************** SYNTAX ***************
SELECT sütun1, sütun2 FROM tablo_adı;
*/

CREATE TABLE kisiler (
id INT,
isim VARCHAR(50),
soyisim VARCHAR(50),
yas INT,
sehir VARCHAR(50)
);

-- Kısa Not!!: INSERT INTO'dan sonra tablo adının columnlarının eger hepsi yazılacaksa  sadece VALUES yeterli olacaktır
-- Fakat; tablodan sadece 1 column eksik bile olsa INSERT INTO tablo_name yazıp -column adlarından- sadece istenenler yazılır.

INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Ahmet', 'Yılmaz', 30, 'Ankara'); -- alt alta 15 adet tekli veri girisi
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Mehmet', 'Kara', 25, 'İstanbul');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Ayşe', 'Kaya', 22, 'İzmir');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Fatma', 'Güneş', 28, 'Bursa');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Ali', 'Çelik', 35, 'Antalya');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Elif', 'Demir', 29, 'Ankara');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Can', 'Özdemir', 33, 'İstanbul');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Deniz', 'Arslan', 24, 'İzmir');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Selin', 'Yıldız', 27, 'Bursa');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Emre', 'Koç', 31, 'Antalya');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Zeynep', 'Çınar', 26, 'Konya');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Oğuz', 'Kaplan', 40, 'Samsun');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Burcu', 'Ertuğrul', 22, 'Trabzon');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Kaya', 'Durmaz', 35, 'Diyarbakır');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Seda', 'Aydın', 28, 'Eskişehir');

SELECT * FROM kisiler;

/*  
========================  SORU 1 ========================
 Kisiler tablosundan isim ve soyisim bilgilerini listeleyiniz.
=========================================================
 */
 
 SELECT isim, soyisim
 FROM kisiler;
 
 
/*  
========================  SORU 2 ========================
 Kisiler tablosundan isim,yas ve sehir bilgilerini listeleyiniz.
=========================================================
 */
 
 SELECT isim, yas, sehir
 FROM kisiler;

-- SELECT ifadesinden sonra yazılan column isimlerinin sırası resulttaki sonuc kumesini belirler.


/*
 ===============================================
           WHERE ile Filtreleme
 ===============================================
 */
 
/*
 WHERE koşulu, SQL sorgularında belirli kriterlere göre verileri filtrelemek
 için kullanılır. WHERE ile birlikte karşılaştırma ve mantıksal operatörler,
 daha spesifik ve dinamik sorgular oluşturmak için kullanılabilir.
*/
-- Where sorgusu javada ki if-else ile hemen hemen aynı anlamda kullanılır.

/*
*************** SYNTAX ***************
SELECT * FROM tablo_adı
WHERE sütun = “istenen değer”;
*/

/*  
========================  SORU 3 ========================
 Kisiler tablosundaki sehir=antalya olan kisileri listeleyiniz.
=========================================================
 */
 
SELECT * FROM kisiler
WHERE sehir= 'Antalya';

/*  
========================  SORU 4 ========================
 Kisiler tablosundaki YASI 22 olan kisileri listeleyiniz.
=========================================================
 */

SELECT * FROM kisiler
WHERE yas= 22;

/*  
========================  SORU 5 ========================
 Kisiler tablosundaki sehri Ankara olanların yas, isim ve soy isim bilgilerini listeleyiniz.
=========================================================
 */

SELECT yas, isim, soyisim  FROM kisiler
WHERE sehir = 'Ankara';































































