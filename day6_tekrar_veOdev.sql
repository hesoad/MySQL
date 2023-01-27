/* ======================== EXISTS CONDITION ===========================
EXISTS Condition subquery'ler ile kullanilir. IN ifadesinin kullanimina
benzer olarak, EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen 
degerlerin icerisinde bir degerin olmasi veya olmamasi durumunda islem 
yapilmasini saglar.
======================================================================*//*----------------------------------------------------------------
SORU 1 : Her iki ayda satilan urunlerin urun_id'lerini
ve urunleri mayis ayinda alanlarin isimlerini getiren bir query yaziniz.
----------------------------------------------------------------*/ 

select*from mayis_satislar;
select*from nisan_satislar;
SELECT urun_id, musteri_isim
FROM mayis_satislar
WHERE urun_id IN (SELECT urun_id
                  FROM nisan_satislar
                  WHERE mayis_satislar.urun_id = nisan_satislar.urun_id);
                  
SELECT urun_id, musteri_isim
FROM mayis_satislar
WHERE EXISTS (SELECT urun_id
              FROM nisan_satislar
              WHERE mayis_satislar.urun_id = nisan_satislar.urun_id);
/*----------------------------------------------------------------
SORU 2 : Her iki ayda da satilan urun_isimleri ayni urunlerin,
urun_isim'ini ve nisan ayinda  o urunu alan musterilerin isimlerini 
getiren bir Query yaziniz.
----------------------------------------------------------------*/ 

select*from mayis_satislar;
select*from nisan_satislar;

SELECT urun_isim, musteri_isim
FROM nisan_satislar
WHERE EXISTS (SELECT urun_isim
              FROM mayis_satislar
              WHERE mayis_satislar.urun_isim = nisan_satislar.urun_isim);
              
      /*----------------------------------------------------------------
SORU 3 : Nisan ayinda satilip mayis ayinda satilmayan urun ismini ve
satin alan kisiyi listeleyen bir QUERY yaziniz.
----------------------------------------------------------------*/        
SELECT urun_isim, musteri_isim
FROM nisan_satislar
WHERE NOT EXISTS (SELECT urun_isim
                 FROM mayis_satislar
                 WHERE mayis_satislar.urun_isim = nisan_satislar.urun_isim); 
                 
                /*----------------------------------------------------------------
SORU 4 : Mayis ayinda satilip nisan ayinda satilmayan urun id ve
satin alan kisiyi listeleyen bir QUERY yaziniz.
----------------------------------------------------------------*/
SELECT urun_id, musteri_isim
FROM mayis_satislar
WHERE NOT EXISTS (SELECT urun_id
                 FROM nisan_satislar
                 WHERE mayis_satislar.urun_isim = nisan_satislar.urun_isim); 
                 /* ======================== IS NULL CONDITION ===========================
    Arama yapilan field'da NULL degeri almis kayitlari getirir.
======================================================================*/
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

SELECT * 
FROM insanlar
WHERE isim IS NULL;

 UPDATE insanlar
SET isim = 'Isimsiz'
WHERE isim IS NULL;

/* ======================== ORDER BY ===========================
=> ORDER BY komutu belli bir field'a gore NATURAL ORDER olarak siralama
yapmak icin kullanilir.
=> ORDER BY komutu sadece SELECT komutu ile kullanilir.
=> ORDER BY komutuna ozel olarak, siralama yapacagimiz field ismi yerine 
field sirasini da yazabiliriz.
=> Isimleri natural order'a gore siralamak icin sorgunun sonuna 
 ORDER BY (field_name) yazmak yeterlidir.
=> Isimleri ters siralama ile yazdirmak isterseniz DESC yaziyoruz.
=> Ayni degerde olan kayitlari, tablodaki kayit sirasina gore getirir.
==============================================================*/

-- Soru 1: Insanciklar tablosundaki datalari adres'e gore siralayin :

SELECT *
FROM insanciklar
ORDER BY adres;
-- Soru 2: Isim' i Mine olanlari soyisim sirali olarak listeleyen Query yaziniz.
SELECT * FROM insanciklar;
select *
from insanciklar
where isim='Mine'
order by soyisim;

-- Soru 3: Insanciklar tablosundaki soyismi BULUT olanlari isim sirali olarak listeleyin.
SELECT *
FROM insanciklar
WHERE soyisim = 'Bulut'
ORDER BY isim;

-- Soru 4: Insanciklar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin.
SELECT *
FROM insanciklar
ORDER BY ssn DESC;

-- Soru 6: Insanciklar tablosundaki tum kayitlari Soyisimler ters sirali, 
-- isimler Natural sirali olarak listeleyin.
SELECT *
FROM insanciklar
ORDER BY soyisim DESC,isim ASC;

-- Soru 8: Insanciklar tablosundaki tum kayitlari adresler ters sirali, 
-- isimler ters sirali, soyisimler ters sirali olarak listeleyin.
select *
from insanciklar
order by adres desc,isim desc, soyisim desc;

/* ======================== GROUP BY CLAUSE ===========================
   Group By komutu sonuclari bir veya daha fazla sutuna gore
   gruplamak icin SELECT komutuyla birlikte kullanilir.
   
   GROUP BY komutu her grup basina bir satir dondurur.
   
   GROUP BY AGGREGATE fonksiyonlariyla birlikte kullanilir.
======================================================================*/
-- 1) Isme gore, alinan urunlerin toplam kilosunu bulup,
-- isim sirasina gore siralayin. 

-- 2) Isme gore, alinan urunlerin toplam kilosunu bulup,
-- isim sirasina gore ters siralayin. 
SELECT isim, SUM(urun_miktar) AS top_kg
FROM manav
GROUP BY isim
ORDER BY isim DESC;
-- 3) Bunlari bir de toplam kiloya gore ters sirali yapalim
SELECT isim, SUM(urun_miktar) AS top_kg
FROM manav
GROUP BY isim
ORDER BY top_kg DESC;
-- 4) Urun ismine gore, urunu alan toplam kisi sayisini, 
-- kisi sayisina gore siralayiniz.
SELECT urun_adi, COUNT(isim) kisi_sayisi
FROM manav
GROUP BY urun_adi
ORDER BY kisi_sayisi;
-- 5) Alinan kilo miktarina gore musteri sayisini, urun_miktar 
-- sirasina gore listeleyiniz.
SELECT urun_miktar, COUNT(urun_miktar) kisi_sayisi
FROM manav
GROUP BY urun_miktar
ORDER BY urun_miktar;
-- 6) Satilan meyve turune (urun_adi) gore urun alan kisi sayisini, 
-- urun_adi NATURAL ORDER'a gore gosteren QUERY yaziniz.
-- NULL olarak girilen meyveyi listelemesin.
SELECT urun_adi, COUNT(isim) kisi_sayisi
FROM manav
WHERE urun_adi IS NOT NULL
GROUP BY urun_adi
ORDER BY urun_adi;
-- 7) Satilan meyvenin 4 harfli olmasina (urun_adi) gore urun alan kisi sayisini, 
-- urun_adi NATURAL ORDER'a gore gosteren QUERY yaziniz.
SELECT urun_adi, COUNT(isim) kisi_sayisi
FROM manav
WHERE urun_adi LIKE '____'
GROUP BY urun_adi
ORDER BY urun_adi;
-- 8) Satilan meyve turune (urun_adi) gore satilan (urun_miktari)
-- MIN ve MAX urun miktarlarini, MAX urun miktarina gore siralayarak
-- listeleyen OUERY yaziniz.
-- NULL olarak girilen meyveyi listelemesin.
SELECT urun_adi, MAX(urun_miktar) max_kg, MIN(urun_miktar) min_kg
FROM manav
WHERE urun_adi IS NOT NULL
GROUP BY urun_adi
ORDER BY max_kg DESC;

-- 9) Kisi ismine ve urun_adina gore satilan urunlerin toplamini
-- gruplandiran ve isime gore ters sirada listeleyen QUERY yaziniz.
SELECT isim, urun_adi, SUM(urun_miktar) top_kg
FROM manav
GROUP BY isim, urun_adi
ORDER BY isim DESC, urun_adi;
CREATE TABLE isciler
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO isciler VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO isciler VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO isciler VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500,'Honda');
INSERT INTO isciler VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO isciler VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO isciler VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO isciler VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
-- 1) Isme gore toplam maaslari bulun

select isim , sum(maas) as top
from isciler
group by isim
order by isim;

-- 2) Sehre gore toplam isci sayisini bulun
 select sehir , count(isim) as Isci_sayisi
 from isciler
 group by sehir;
-- 3) Sirketlere gore maasi 5000 liradan fazla olan isci sayisini bulun

select sirket, count(isim)as Isci_sayisi
from isciler
where maas>5000
group by sirket;


-- 4) Her sirket icin Min ve Max maasi bulun
select sirket , max(maas) as En_fazla_alan,min(maas) as En_kucuk_alan
from isciler
group by sirket;