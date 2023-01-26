/*========================================
    TABLO OLUSTURMA 1 (CRUD - Create)
========================================*/
-- id, isim, not ortalamasi, adres ve son degistirme tarihi
-- fieldlari iceren bir ogrenciler table'i olusturunuz.
CREATE TABLE ogrenciler1(
id CHAR(4),
isim VARCHAR(25),
not_ortalamasi DOUBLE,
adres VARCHAR(100),
son_degistirme_tarihi DATE
);
DROP TABLE ogrenciler1;
SELECT * FROM ogrenciler1;
-- create tablo olustururken kullanilir
-- select tabloyu secmek veya gormek icin

create table lise_son1
as
select adres, derece
from lise;
select * from lise;
select * from lise_son1;



/*1) Personel sayisi 15.000'den cok olan sirketlerin isimlerini
 ve bu sirkette calisan personelin isimlerini listeleyin
----------------------------------------------------------------*/
use sys;
SELECT isim , sirket 
FROM personel
WHERE sirket IN (SELECT sirket
                FROM sirketler
                WHERE personel_sayisi>15000);
                

/*----------------------------------------------------------------
 2) Sirket_id'si 101'den buyuk olan sirketlerin 
 maaslarini ve sehirlerini listeleyiniz
----------------------------------------------------------------*/
select * from personel;
select * from sirketler;

SELECT maas, sehir
FROM personel
WHERE sirket IN (SELECT sirket
                FROM sirketler
                WHERE sirket_id>101);
                
/*----------------------------------------------------------------                
  3) Ankara'daki sirketlerin sirket id ve personel 
  sayilarini listeleyiniz.
----------------------------------------------------------------*/
SELECT sirket_id, personel_sayisi
FROM sirketler
WHERE sirket IN (SELECT sirket
                 FROM personel
                 WHERE sehir = 'Ankara');

/*----------------------------------------------------------------                
  4) Veli Yilmaz isimli personelin calistigi sirketlerin sirket 
  ismini ve personel sayilarini listeleyiniz.
----------------------------------------------------------------*/
select * from personel;
select * from sirketler;

SELECT sirket, personel_sayisi
FROM sirketler
WHERE sirket IN (SELECT sirket
                 FROM personel
                 WHERE isim = 'Veli Yilmaz');
select * from personel;
select * from sirketler;
/* SORU 1- Her sirketin ismini, personel sayisini ve personelin 
 ortalama maasini listeleyen bir QUERY yazin.
----------------------------------------------------------------*/
SELECT sirket, personel_sayisi, (SELECT AVG(maas) 
                                 FROM personel
                                 WHERE sirketler.sirket = personel.sirket)
FROM sirketler;

select * from personel;
select * from sirketler;
/*----------------------------------------------------------------
SORU 2- Her sirketin ismini ve personelin aldigi max. maasi 
listeleyen bir QUERY yazin.
----------------------------------------------------------------*/
SELECT sirket,  (SELECT max(maas) 
				FROM personel
			    WHERE sirketler.sirket = personel.sirket) as en_fazla_maas_alani
FROM sirketler;

/*----------------------------------------------------------------
SORU 4- ID'si 101'den buyuk olan sirketlerin id'sini, ismini ve 
toplam kac sehirde bulundugunu listeleyen bir QUERY yaziniz.
----------------------------------------------------------------*/
select * from personel;
select * from sirketler;
SELECT sirket_id, sirket, (SELECT COUNT(sehir)
                           FROM personel
                           WHERE sirketler.sirket = personel.sirket) as top_sehir
FROM sirketler 
WHERE sirket_id>101;

/*----------------------------------------------------------------
SORU 5- Her sirketin ismini,personel sayisini ve personelin 
aldigi max. ve min. maasi listeleyen bir QUERY yazin.
----------------------------------------------------------------*/   
select sirket, personel_sayisi, (select max(maas) from personel where sirketler.sirket= personel.sirket) max_maas,(select min(maas) from personel where sirketler.sirket= personel.sirket) min_maas

from sirketler;

 
