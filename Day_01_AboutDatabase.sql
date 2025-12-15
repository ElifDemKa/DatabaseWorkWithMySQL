CREATE SCHEMA aboutdatabase;
-- Bu bir yorum satırıdır. Yorum satırı -- (iki tire) olarak yapılır.
/*
Bu da bir yorum blogudur. Birden fazla satırda yorum
yapmak istersek kullanılır.
*/

/*
	Database'de islem yapmak,
    Java ile islem yapmaktan farklidir.
    Java Run Time program oldugundan, calisma bittiginde hersey sifirlanir ve en bastaki duruma doner
    Fakat database'de yapilan her islem KALICI olacaktir.
    
    Kismen geriye almak mumkun olsa da,
    her islemi geriye almak MUMKUN DEGILDIR
    
    BU ACIDAN database ile yapacagimiz her islemi dikkatle yapmalıyız.

*/

-- yeni bir schema olusturmak icin
CREATE SCHEMA aboutdatabase;

/*
	Database ve Query sayfasi farkli seylerdir.
    Database'i Local olarak olusturduk,
    Ancak ister Local isterse Uzak database olsun, database'de yapilan islemler KALICIDIR
    
    Database'de islem yapabilmek icin olusturdugumuz Query dosyalari ise
    bizim not aldigimiz sayfalar gibidir,
    biz kaydetmedikce kalici olarak kaydedilmez.
*/

/*
	SQL ile sorgu yapmak da Java kodlarini calistirmaktan farklidir
    Java'da bir class veya method calistirildiginda
    o class veya method'daki tum kodlar calisir.
    
    FAKAT:
    Database sorgularini calistirmak icin iki alternatif vardir
    1- Query sayfasindaki belirli satir(lar)i calistirmak icin
       o satir(lar)i secip yukardaki execute (simsek) butonuna basilir
       
       NOT : eger secim olmazsa tum sayfa calistirilir
             BUNU KESINLIKLE TAVSIYE ETMIYORUZ
             cunku ayni kayitlari tekrar tekrar database'e kaydedebilir
             
    2- uzerinde (I) olan execute(simsek) tusuna basarsdaniz
       en yukardan Cursor'un bulundugu satira kadar 
       tum sorgulari calistirir
*/
-- database de dublıcate e yer olmaz, konsolda 1007 uyarısı alınır
-- Bir Query sayfasinin hangi Schema ile calisacagini belirlemek icin use komutu kullanir
-- Query sayfasi her acildiginda bu kodun 1 kere calistirilmasi gerekir.