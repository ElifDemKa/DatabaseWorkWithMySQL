use aboutdatabase;
/*============================== Primary Key ==============================

1- Primary Key bir row'u tanımlayan bir field veya birden fazla field kombinasyonudur
2- Primary Key UNIQUE'dir
3- Bir tabloda en fazla bir Primary Key olabilir.
4- Primary Key column'da hicbir data NULL olamaz.

*/

-- Bir field Primary Key yapmak icin 2 farkli yol vardir;

/*-------------------- Syntax 1 --------------------

    Data Type'dan sonra "PRIMARY KEY" yazarak

    CREATE TABLE students_table
    (
        id INT PRIMARY KEY,
        name VARCHAR(50), (UNIQUE olabilir)
        grade INT, (NOT NULL olabilir)
        adres VARCHAR(100),
        last_update DATE
    );

---------------------------------------------------*/

/*----------------------- Syntax 2 -----------------------
CONSTRAINT Keyword'u kullanılarak PRIMARY KEY tanimlanabilir.
"CONSTRAINT constraintName PRIMARY KEY(column1, column2, ... column_n);"

CREATE TABLE students_table
(
    id INT,
    name VARCHAR(50),
    grade INT,
    adres VARCHAR(100),
    last_update DATE
    CONSTARINT id_pk PRIMARY KEY (id)
);
---------------------------------------------------------*/


/*-------------------- Q1 ------------------
"sehirler" isimli bir table olustururn.
Tabloda "alan_kodu" , "isim", "nufus" fieldları olsun.
"isim" field'i bos bırakılamasın.
1. yolu kullanarak "alan_kodu" field'ini, primary key yapın.
--------------------------------------------*/

CREATE TABLE sehirler(
alan_kodu CHAR(4) PRIMARY KEY,
isim VARCHAR (20) not null,
nufus BIGINT
);

SELECT * FROM sehirler;

/*-------------------- Q2 ------------------
"ogretmenler" isimli bir table olustururn.
Tabloda "id" , "isim", "brans", "cinsiyet" fieldları olsun.
"id" fieldları tekrarlı veri kabul etmesin.
2. yolu kullanarak "id" ve "isim" field'ini primary key yapın.
--------------------------------------------*/

-- auto ıncrement otomatık olarak kendi ıd ataması yapacak,her veri girişinde 
CREATE TABLE ogretmenler(
id INT AUTO_INCREMENT,  
isim VARCHAR(20),
brans VARCHAR(20),
cinsiyet CHAR (5),
CONSTRAINT id_isim_pk PRIMARY KEY(id, isim)
);


/*------------------------------ Foreign Key ------------------------------
1- Foreign Key iki tablo arasında Relation oluşturmak için kullanılır.
2- Foreign Key başka bir tablonun Primary Key’ine bağlıdır.
3- Referenced table (bağlanılan tablo, Primary Key’in olduğu tablo)
   Parent Table olarak da adlandırılır. Foreign Key’in olduğu tablo ise
   Child Table olarak da adlandırılır.
4- Bir tabloda birden fazla Foreign Key olabilir.
5- Foreign Key NULL değeri alabilir.
6- Foreign Key DUBLICATE değeri alabilir.

Not 1: Parent Table’da olmayan bir veriyi (PK'daki herhangi bir deger)
Child Table’a giremezsiniz.

Not 2: Child Table’ı silmeden Parent Table’ı silemezsiniz.
Önce Child Table silinir, sonra Parent Table silinir.
=========================================================================*/


/*---------------------------- Syntax ----------------------------

CONSTRAINT constraintName FOREIGN KEY(child_table_field_name)
REFERENCES parent_table (parent_table_field_name)

CREATE TABLE table_name
(
    id CHAR(10),
    name CHAR(10),
    CONSTARINT constraint_name
    FOREIGN KEY(id)
    REFERENCES parent_table (parent_table_field_name)
);
---------------------------------------------------------------*/

/*------------------------------ Q4 ------------------------------
"tedarikci" isimli bir tablo olusturun.
Tabloda "tedarikci_id", "tedarikci_ismi", "iletisim_isim" fieldlari olsun.
"tedarikci_id" field'ini PRIMARY KEY olsun.

"urunler" isminde baska bir tablo olusturun.
Tabloda "tedarik_id" ve "urun_id" field'lari olsun.
"tedarik_id" FOREIGN KEY olsun.
----------------------------------------------------------------*/

CREATE TABLE tedarikci    -- PARENT TABLE - REFERENCED TABLE
(
tedarikci_id INT,
tedarikci_ismi VARCHAR(20),
iletisim_isim VARCHAR(20),
CONSTRAINT ti_pf PRIMARY KEY(tedarikci_id)
);

CREATE TABLE urunler (   -- CHILD TABLE
tedarik_id INT,
urun_id INT,
CONSTRAINT ti_fk FOREIGN KEY(tedarik_id)
REFERENCES tedarikci(tedarikci_id)
);

SELECT * FROM tedarikci;
SELECT * FROM urunler;

/*------------------------------ Q6 ------------------------------
"ogrenciler2" ve "dersler" isimli iki tablo olusturun.

"ogrenciler" tablosunda "ogrenci_no" (Primary Key),
"isim", ve "bolum" alanlari olsun.

"dersler" tablosunda "ders_kodu" (Primary Key),
"ders_adi", ve "kredi" alanlari olsun.

"ogrenci_dersleri" isimli bir many to many iliski tablosu
olusturun ve gerekli Foreign Key’leri tanimlayin.
----------------------------------------------------------------*/

CREATE TABLE ogrenciler2(
ogrenci_no INT,
isim VARCHAR(20),
bolum VARCHAR(30),
CONSTRAINT on_pk PRIMARY KEY(ogrenci_no)
);

CREATE TABLE dersler(
ders_kodu INT,
ders_adi VARCHAR(20),
kredi INT,
CONSTRAINT dk_pk PRIMARY KEY (ders_kodu)
);

CREATE TABLE ogrenci_dersleri
(
ogrenci_no INT,
ders_kodu INT,
CONSTRAINT on_fk FOREIGN KEY(ogrenci_no)
REFERENCES ogrenciler2(ogrenci_no),
CONSTRAINT dk_fk FOREIGN KEY(ders_kodu)
REFERENCES dersler(ders_kodu)
);


SELECT * FROM ogrenciler2;
SELECT * FROM dersler;
SELECT * FROM ogrenci_dersleri;

/*
-- SENARYOLAR --

Örnek 1: Hastane Yönetim Sistemi

Senaryo:
Hastane yönetim sistemi için "hastalar" ve "randevular" isimli iki tablo oluşturacaksınız.
Hastalar tablosunda her hastanın benzersiz bir "hasta_id"si, "ismi" ve "soyismi" olacak.
Randevular tablosunda ise "randevu_id", "hasta_id", "randevu_tarihi" ve "doktor_isim" alanları bulunacak.
"randevular" tablosundaki "hasta_id" alanı, "hastalar" tablosundaki "hasta_id"ye bir Foreign Key ile bağlanacak.

Sorular:

"hastalar" tablosunu oluşturun.
"randevular" tablosunu oluşturun ve "hastalar" tablosu ile ilişkilendirin.
Bir hastaya ait tüm randevuları sorgulayın.

Örnek 2: Kitaplık Sistemi

Senaryo:
Bir kitaplık yönetim sistemi için "yazarlar" ve "kitaplar" isimli iki tablo tasarlayacaksınız.
Yazarlar tablosunda her yazarın "yazar_id", "isim" ve "ülke" alanları bulunacak.
Kitaplar tablosunda ise "kitap_id", "baslik", "yayin_yili" ve "yazar_id" alanları olacak.
"kitaplar" tablosundaki "yazar_id" alanı, "yazarlar" tablosundaki "yazar_id"ye bir Foreign Key ile bağlanacak.

Sorular:

"yazarlar" tablosunu oluşturun.
"kitaplar" tablosunu oluşturun ve "yazarlar" tablosu ile ilişkilendirin.
Belirli bir yazarın tüm kitaplarını sorgulayın.









































