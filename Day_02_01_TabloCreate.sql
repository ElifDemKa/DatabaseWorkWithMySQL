use aboutdatabase;
/*
===============================================
		TABLO OLUSTURMA (CRUD - Create)
===============================================
*/


/*
"CREATE TABLE" bir veritabanında yeni bir tablo oluşturmak için kullanılan 
bir SQL (Structured Query Language) ifadesidir. 

Bu komut, tablonun yapısını tanımlar.
yani tabloda bulunacak sütunların isimlerini, veri tiplerini ve diğer özelliklerini 
(örneğin, Primary Key, Unique, Not Null  vb.) belirtir. 

"CREATE TABLE" komutunu kullanırken, her bir sütun için uygun veri tipini ve 
boyutunu belirlemek ve gerektiğinde sütunlara kısıtlamalar eklemek önemlidir. 

Bu işlem, veri bütünlüğünü korumak ve veritabanı işlemlerinin doğru şekilde 
çalışmasını sağlamak için kritik öneme sahiptir.
*/
/*
*************** SYNTAX ***************
	CREATE TABLE tablo_adi
	sütun1_Adi veri_tipi1 ,
    sütun2_Adi veri_tipi2 ,
    ...
    sütunN_Adi veri_tipiN ,
);
*/


/*  
   ========================  SORU-1 ========================
   Icerisinde kitap id, kitap adi, yazar adi, yayin yili ve kategori columnlari
   olan bir kitaplar tablosu create ediniz. 
   =========================================================
 */
CREATE TABLE kitaplar ( 
	kitap_id INT,
    kitap_adi VARCHAR(40),
    yazar_adi VARCHAR(40),
    yayin_yili INT,
    kategori VARCHAR(20)
);

/*  
    ========================  SORU-2 ========================
    Icerisinde ogrenci id, adi, soyadi, bolum, kayit yili, ortalama not columnlari
    olan bir personel tablosu create ediniz. 
    =========================================================
 */

CREATE TABLE ogrenciler(
id int,
adi VARCHAR(20),
soyadi VARCHAR(20),
kayit_yili YEAR,
ortalama_not DOUBLE(3,2)
 );
  
  
  /*
===============================================
		TABLO GORUNTULEME (CRUD - Create)
===============================================
*/

/*
*************** SYNTAX ***************
	SELECT * FROM tablo_adi;
    !! buradaki * ifadesi 'herşeyi getir' anlamını tasir.
*/


/*
SELECT komutu, SQL'de veritabanından veri sorgulamak ve almak icin
 kullanılan temel bir komuttur. Bu komut, belirtilen kriterlere uygun
 verileri secmek ve goruntulemek için kullanılır.
*/
/*
	Select bir tablodan data cagirmak icin kullanilir
    bizim de en cok kullanacagimiz komuttur
    
    * hersey anlamina gelir
    asagidaki komut su anlama gelir
    
    aboutdatabase.kitaplar'dan herseyi getir
    
    SQL syntax yapisi gundelik konusma diline yaklastirilmaya calisiliyor (INGILIZCE)
    Syntax yapisini tersten okudugunuzda mantikli bir cumle ile karsilasirsiniz
*/
 
 
	SELECT * FROM kitaplar;
    
    
    /*  
    ========================  SORU-3 ========================
    Icerisinde personel id, adi, soyadi, dogum tarihi, pozisyon ve maas columnlari
    olan bir personel tablosu create ediniz. 
    =========================================================
 */
  CREATE TABLE personel (
personel_id INT,
adi VARCHAR(20),
soyadi VARCHAR(20),
dogum_tarihi DATE,
maas INT
);
ALTER TABLE personel
ADD COLUMN pozisyon VARCHAR(30);


SELECT * FROM personel;

-- NOT:Mysqlde tabloyu bir defa create edince tablo silinse bile databaseden silinmez(delete) kullanmadan.Java gibi runtime degildir cunku.
-- Tablo uzerindeki column isimlerini filtreleyerekte SELECT sorgusu ile calistirabilirim.

  SELECT soyadi,personel_id FROM personel;
  
  
