use sys;
/* ============================= DELETE - TRUNCATE - DROP ================================   
  
  => TRUNCATE TABLE komutu tablodaki tum datalari kalici olarak siler
  => Truncate ve Delete komutlarinin ikisi de bir tabloda bulunan recordlari silmek icin kullanilir.
  => Iki komut da sadece belirtilen tablodaki kayitlari siler.
  => En belirgin farki ise Delete komutu ile belirli bir araligi silebilirken,
  => Truncate komutu tablodaki tum verileri siler.
  
  1-) TRUNCATE komutu DELETE komutu gibi bir tablodaki verilerin tamamini siler.
    Ancak, secmeli silme yapamaz. Cunku Truncate komutu DML degil DDL komutudur.*/ 
    
       TRUNCATE TABLE ogrenciler; -- dogru yazim
       drop table ogrenciler;
       delete from ogrenciler;
    
   /* 2-) DELETE komutu beraberinde WHERE cumlecigi kullanilabilir. TRUNCATE ile 
    kullanilmaz.
    
        TRUNCATE TABLE ogrenciler
        WHERE veli_isim='Hasan';  .....yanlis yazim
        
-- TRUNCATE komutu tablo yapisini degistirmeden, 
-- tablo icinde yer alan tum verileri tek komutla silmenizi saglar.
        
    3-) Delete komutu ile silinen veriler ROLLBACK Komutu ile kolaylikla geri 
    alinabilir.
    
    4-) Truncate ile silinen veriler geri alinmasi daha zordur. Ancak
    Transaction yontemi ile geri alinmasi mumkun olabilir.
    
    5-) DROP komutu da bir DDL komutudur. Ancak DROP veriler ile tabloyu da 
    siler. 
    
    -- Tablodaki kayitlari silmek ile tabloyu silmek farkli islemlerdir.
    -- Silme komutlari da iki basamaklidir, biz genelde geri getirilebilecek sekilde sileriz. 
    -- Ancak bazen guvenlik gibi sebeplerle geri getirilmeyecek sekilde silinmesi istenebilir.
==============================================================================*/ 
select*from cocuk;
SAVEPOINT KIRAZ;
delete from cocuk;
ROLLBACK TO KIRAZ;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/*============================== ON DELETE CASCADE ================================
  Her defasinda once child tablodaki verileri silmek yerine ON DELETE CASCADE
  silme ozelligini aktif hale getirebiliriz.
  
  Bunun icin FK olan satirin en sonuna ON DELETE CASCADE komutunu yazmak yeterli
  
===================================================================================*/
CREATE TABLE talebeler
    (
        id CHAR(3) primary key,
        isim VARCHAR(50),
        veli_isim VARCHAR(50),
        yazili_notu int
    );
    INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
	INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO talebeler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
	INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);
     CREATE TABLE dereceler
    (
    talebe_id char(3),
	ders_adi varchar(30),
	yazili_notu int,
	CONSTRAINT DERECELER_fk FOREIGN KEY (talebe_id)
	REFERENCES talebeler(id) ON DELETE CASCADE
	);
	INSERT INTO dereceler VALUES ('123','Kimya',75);
    INSERT INTO dereceler VALUES ('124', 'Fizik',65);
    INSERT INTO dereceler VALUES ('125', 'Tarih',90);
	INSERT INTO dereceler VALUES ('126', 'Matematik',90);
	INSERT INTO dereceler VALUES ('127', 'Matematik',23);
    SELECT * FROM talebeler;
    SELECT * FROM dereceler;
  
  delete from  talebeler
  where id>123;

drop table  talebeler;
drop table  dereceler;
-- ======================== WHERE ile SUBQUERY ===========================
/*----------------------------------------------------------------
 1) Personel sayisi 15.000'den cok olan sirketlerin isimlerini
 ve bu sirkette calisan personelin isimlerini listeleyin
----------------------------------------------------------------*/



/*================================= SUBQUERY =================================
	Sorgu icinde calisan sorguya SUBQUERY (ALT SORGU) denir.
============================================================================*/

use sys;
drop table personel;
CREATE TABLE personel
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO personel VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Honda');
INSERT INTO personel VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Hyundai');
INSERT INTO personel VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Honda');
CREATE TABLE sirketler
(
sirket_id int,
sirket varchar(20),
personel_sayisi int
);
INSERT INTO sirketler VALUES(100, 'Honda', 12000);
INSERT INTO sirketler VALUES(101, 'Ford', 18000);
INSERT INTO sirketler VALUES(102, 'Hyundai', 10000);
INSERT INTO sirketler VALUES(103, 'Toyota', 21000);
SELECT * FROM personel;
SELECT * FROM sirketler;
-- ======================== WHERE ile SUBQUERY ===========================
/*----------------------------------------------------------------
 1) Personel sayisi 15.000'den cok olan sirketlerin isimlerini
 ve bu sirkette calisan personelin isimlerini listeleyin
----------------------------------------------------------------*/

-- 1. adim 
select sirket
from sirketler
where personel_sayisi>15000;

-- 2. adim 

select isim , sirket
from personel
where sirket in ('toyota','ford');


-- 3.adim ikisinin tek bir yonteme cevirme 

select isim ,sirket
from personel
where sirket in (select sirket
                 from sirketler
                 where personel_sayisi>15000);
                 
  -- honda sirketinin personel sayiyini 16.000 olarak günceleyiniz 
  update sirketler
  set personel_sayisi= 16000
  where sirket = 'Honda';
/*----------------------------------------------------------------
 2) Sirket_id'si 101'den buyuk olan sirketlerin 
 maaslarini ve sehirlerini listeleyiniz
----------------------------------------------------------------*/

select maas, sehir
from personel
where  sirket in (select sirket
                 from sirketler
                 where sirket_id>101);


select personel_sayisi,sirket_id
from sirketler
where sirket  in (select sirket
                  from personel
                   where sehir='Ankara' );


select personel_sayisi, sirket
from sirketler
where sirket  in (select sirket
                  from personel
                   where isim ='veli yilmaz' );
/* ======================== SELECT ile SUBQUERY ===========================
  SELECT ile SUBQUERY kullanimi :
  
-- SELECT -- hangi sutunlari(field) getirsin
-- FROM -- hangi tablodan(table) getirsin
-- WHERE -- hangi sati±rlari(record) getirsin
  
 * Yazdigimiz QUERY'lerde SELECT satirinda field isimleri kullaniyoruz.
  Dolayisiyla eger SELECT satirinda bir SUBQUERY yazacaksak sonucun
  tek bir field donmesi gerekir.
  
  * SELECT satirinda SUBQUERY yazacaksak SUM, COUNT, MIN, MAX ve AVG gibi 
  fonksiyonlar kullanilir. Bu fonksiyonlara AGGREGATE FUNCTION denir.
=> Interview Question : Subquery'i Select satirinda kullanirsaniz ne ile 
kullanmaniz gerekir?
=========================================================================*/
/*----------------------------------------------------------------
 SORU 1- Her sirketin ismini, personel sayisini ve personelin 
 ortalama maasini listeleyen bir QUERY yazin.
----------------------------------------------------------------*/

select sirket, personel_sayisi, (select avg(maas) from personel where sirketler.sirket=per)
from sirketler;


/*----------------------------------------------------------------
SORU 2- Her sirketin ismini ve personelin aldigi max. maasi 
listeleyen bir QUERY yazin.
----------------------------------------------------------------*/

select sirket, (select max(maas) from personel where sirketler.sirket=personel.sirket)
from sirketler;

/*----------------------------------------------------------------
SORU 3- Her sirketin id'sini, ismini ve toplam kac sehirde 
bulundugunu listeleyen bir QUERY yaziniz.
----------------------------------------------------------------*/
select sirket, sirket_id, (select count(sehir) from personel where sirketler.sirket=personel.sirket)
from sirketler;
/*----------------------------------------------------------------
SORU 4- ID'si 101'den buyuk olan sirketlerin id'sini, ismini ve 
toplam kac sehirde bulundugunu listeleyen bir QUERY yaziniz.
----------------------------------------------------------------*/
select sirket, sirket_id, (select count(sehir) from personel where sirketler.sirket=personel.sirket)
from sirketler
where sirket_id>101;
/*----------------------------------------------------------------
SORU 5- Her sirketin ismini,personel sayisini ve personelin 
aldigi max. ve min. maasi listeleyen bir QUERY yazin.
----------------------------------------------------------------*/    
select sirket, personel_sayisi, (select max(maas) from personel where sirketler.sirket=personel.sirket) 
as max_maas,(select min(maas) from personel where sirketler.sirket=personel.sirket) as min_maas
from sirketler;
/*----------------------------------------------------------------
SORU 6- Her sirketin ismini ve personel sayisini ve iscilere
odedigi toplam maasi listeleyen bir QUERY yazin.
----------------------------------------------------------------*/
select sirket, personel_sayisi, (select sum(maas) from personel where sirketler.sirket=personel.sirket) toplam_Maas
from sirketler;







