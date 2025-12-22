use aboutdatabase;

/*
===============================================
              LIMIT - OFFSET
===============================================
*/
/*
LIMIT ifadesi, bir sorgu sonucundan döndürülecek 
maksimum satır sayısını belirlemenizi sağlar. 
 Eğer bir sorgu sonucu çok sayıda satır döndürüyorsa
 ve siz sadece bir kısmını görmek istiyorsanız, 
 LIMIT kullanabilirsiniz.
*/

/*
*************** SYNTAX ***************
SELECT * FROM tablo_adi
LIMIT 10;           
 -- Bana sonuc kumesindeki ilk 10 satiri bana goster
*/

/*
Kısa Bir Ornek:Bir listede 1,2 ve 3. sıradakiler değil; 4,5 ve 6. sıradakiler görmek istenir.
Oncelikle ilk 1,2,3 u -LIMIT 3- yazarak aldık.Geri kalan 4,5 ve 6 nasıl alabilirim?
LIMIT 6 dedğim anda liste yine basında 1,2,3,4,5,6 verir.
4,5, ve 6'yı alabilmek için OFFSET'i 3 ve 4 arasına koynamız gerekir.
OFFSET bir baslangıc noktası belirtir ve ;
OFFSET'in belirttiği yerden sonra LIMIT calısır.
/*



/*
 OFFSET ifadesi, sorgu sonucu setinde bir başlangıç
 noktası belirler. 
 Bu, özellikle sayfalama işlemlerinde faydalıdır. 
 OFFSET genellikle LIMIT ile birlikte kullanılır.
*/

/*
*************** SYNTAX ***************
SELECT * FROM tablo_adi
LIMIT 10 OFFSET 20;  -- 20. satirin bitimine baslangıc noktası koy.


-- 20 ile 30 arasindaki degerleri goster.
-- İlk 20 satırı atla sonrakı 10 satırı getir.
-- Yani; 21,22,23,24,25,26,27,28,29,30. satirlari getir.
*/



SELECT * FROM kitaplik;

/*
=============================  SORU 1  =============================
    Kitaplik tablosundan ilk 5 Kitabı listeleyiniz.
===================================================================
 */

SELECT kitap_adi
FROM kitaplik
LIMIT 5; 

/*
=============================  SORU 2  =============================
    Kitaplik tablosundaki en yeni 3 Kitabı listeleyiniz.
===================================================================
 */

SELECT * FROM kitaplik
ORDER BY yayin_yili DESC
LIMIT 3; 

/*
=============================  SORU 3  =============================
    Kitaplik tablosundan rastgele 3 kitap seçip listeleyiniz.
===================================================================
 */


SELECT * FROM kitaplik
ORDER BY RAND()
LIMIT 3; 

-- RAND() fonksiyonu, özellikle bir tablodan rastgele kayıtlar seçmek için kullanılır.
-- ORDER BY RAND() ifadesi, tablonun satırlarını rastgele bir sıraya sokar.
-- Bu yöntem, özellikle küçük ve orta ölçekli tablolar için uygundur.
-- Ancak, büyük veri setleri için performans sorunlarına yol açabilir.


/*
=============================  SORU 4  =============================
    Kitaplik tablosundaki yayın yılına göre sıralanmış
    kitapların 3. sayfasını listeleyiniz.
    (Her sayfanin boyutu 3 kitap ile sinirlidir.)
    (yani bizden 7.,8. ve 9. kitaplar isteniyor)
===================================================================
*/

SELECT * FROM kitaplik
LIMIT 3
OFFSET 6;


/*
=============================  SORU 5 =============================
    Kitaplik tablosundaki alfabetik siralanmis kitaplarin 4. sayfasını listeleyiniz.
    (Her sayfanin boyutu 2 kitap ile sinirlidir.)
===================================================================
*/

SELECT kitap_adi FROM kitaplik
ORDER BY kitap_adi ASC
LIMIT 2
OFFSET 6 ;

/*
=============================  SORU 6  =============================
    Kitaplik tablosundan yazari 'Fyodor Dostoyevski' olan kitapları
    en fazla 2 tane olacak sekilde eskiden yeniye dogru sirali olarak listeleyiniz.
===================================================================
*/

SELECT kitap_adi FROM kitaplik
WHERE yazar = 'Fyodor Dostoyevski'
ORDER BY yayin_yili
LIMIT 2 ;


/*
=============================  SORU 7 =============================
    Kitaplik tablosundan yazari 'Fyodor Dostoyevski' olan kitapların 2.sayfasını listeleyiniz.
    (Her sayfanın boyutu 1 kitap ile sınırlıdır.)
===================================================================
*/

SELECT * FROM kitaplik
WHERE yazar= 'Fyodor Dostoyevski'
LIMIT 1 OFFSET 1;











