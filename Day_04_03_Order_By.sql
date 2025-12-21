use aboutdatabase;

/* 
===============================================
		       ORDER BY
===============================================*/
/*

    ORDER BY, LIMIT VE OFFSET gibi filtreleme ifadeleri
    database uzerinde degil bize donen sonuc uzerinde 
    filtreleme yapar. Database de bir degisiklik yapmaz.

/*
   ORDER BY ifadesi, SQL sorgularında sonuçları belirli bir
   veya birden fazla sütuna göre sıralamak için kullanılır.
   Bu ifade, sıralama işleminin yükselen (ascending) veya 
   azalan (descending) düzeninde yapılmasını sağlar. 
   ASC anahtar kelimesi yükselen sıralamayı (dogal),
   DESC anahtar kelimesi ise azalan sıralamayı(ters) belirtir.
   
   ozellikle belirtilmediyse sorgu dogal siralamaya uygun olarak 
   (ASC) yapilir.
*/

-- ASC 0'dan 9'a yani; en düşükten yüksege, A'dan Z'ye sıralamadir.
-- DESC ise 9'dan 0'a yani; yüksekten aşagi alçalan sıralamadır.

/*
*************** SYNTAX ***************
SELECT sütun_adları
FROM tablo_adı
ORDER BY sıralanacak_sütun ASC|DESC;

*/


CREATE TABLE kitaplik (
    id INT,
    kitap_adi VARCHAR(100),
    yazar VARCHAR(50),
    yayin_yili INT
);

INSERT INTO kitaplik () VALUES
					(1, 'Sefiller', 'Victor Hugo', 1862),
					(2, '1984', 'George Orwell', 1949),
					(3, 'Suç ve Ceza', 'Fyodor Dostoyevski', 1866),
					(4, 'Kürk Mantolu Madonna', 'Sabahattin Ali', 1943),
					(5, 'Yabancı', 'Albert Camus', 1942),
					(6, 'Ulysses', 'James Joyce', 1922),
					(7, 'Yüzüklerin Efendisi', 'J.R.R. Tolkien', 1954),
					(8, 'Harry Potter ve Felsefe Taşı', 'J.K. Rowling', 1998),
					(9, 'Da Vinci Şifresi', 'Dan Brown', 2003),
					(10, 'Zamanın Kısa Tarihi', 'Stephen Hawking', 1998),
					(11, 'Karamazov Kardeşler', 'Fyodor Dostoyevski', 1880),
					(12, 'Budala', 'Fyodor Dostoyevski', 1869),
					(13, 'Savaş ve Barış', 'Lev Tolstoy', 1866),
					(14, 'Anna Karenina', 'Lev Tolstoy', 1877),
					(15, 'Hobbit', 'J.R.R. Tolkien', 1942);

SELECT * FROM kitaplik;

/*  
============================= SORU 1 =============================
    Kitaplik tablosundaki kitapları yayın yılına göre eski olanlardan
    yeni olanlara doğru sıralayiniz.
===================================================================
*/

SELECT kitap_adi,yayin_yili FROM kitaplik
ORDER BY yayin_yili ASC ;

/*  
============================= SORU 2 =============================
    Kitaplik tablosundaki kitapların yayın yılına göre yeni olanlardan
    eski olanlara doğru sıralayiniz.
===================================================================
*/

SELECT kitap_adi,yayin_yili FROM kitaplik
ORDER BY yayin_yili DESC;


-- NOT!: Sıralama yaptıgımızda aynı tarihte olanların sıralaması database giriş sirasına göre düzenlendır
-- Yani 2 tane 1866 tarihli kitap varsa ,veritabanına ilk hangısı eklendıyse listede o ilk sırada gelir.
-- Fakat yayın ylına göre aynı yılda olanları database 1 sayıyor. Bu da devreye baska bir sorgulama yapmayı gerektiriyor.


/*  
============================= SORU 3 =============================
    Kitaplik tablosundaki "Fyodor Dostoyevski"nin kitaplarını yayın 
    yılına göre eskiden gunumuze sıralayiniz.
===================================================================
*/

SELECT kitap_adi, yayin_yili
FROM kitaplik
WHERE yazar = 'Fyodor Dostoyevski'
ORDER BY yayin_yili ASC;


/*  
============================= SORU 4  =============================
    Kitaplik tablosundaki yazar isimlerini ve kitaplarini 
    dogal sıralayiniz.
===================================================================
*/ 


SELECT yazar, kitap_adi
FROM kitaplik
ORDER BY yazar, kitap_adi;

/*  
============================= SORU 5 =============================
    Kitaplik tablosundaki ismi K harfi ile T harfi arasinda olan 
    yazarlarin isimlerini ters siralayiniz.
===================================================================
*/

SELECT yazar FROM kitaplik
WHERE yazar BETWEEN 'K' AND 'T'
ORDER BY yazar DESC;


/*  
============================= SORU 6 =============================
    Kitaplik tablosundaki "Lev Tolstoy" un kitaplarını isimlerine 
    göre dogal sırayiniz.
===================================================================
*/

SELECT * FROM kitaplik
WHERE yazar= 'Lev Tolstoy'
ORDER BY kitap_adi ;

/*
 Not!: Birinci OrderBy önce ayriştirma yapar , ayrıstıramadıkları üzerinde 2. ,işleme gecer
 1.'de ayrıstırdıklarını 2'nci işleme tabi, tutmaz. 1 VE 2 de ayriştirdıklarını da 3'ncü işleme tabi tutmaz
 Ve böylelikle ne kadar OrderBy varsa o kadar işleme devam eder.
*/