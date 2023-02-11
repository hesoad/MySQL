use sys;
-- ====================== UNION ======================
/*
    Iki farkli sorgulamanin sonucunu birlestiren islemdir.
    Iki veya daha fazla Sorgu ifadesinin sonuc kumelerini
    birlestirerek tek bir sonuc kumesi olusturur.
    2.sorgunun sonuna ORDER BY komutunu kullanirsaniz
    tum tabloyu istediginiz siralamaya gore siralar.
    NOT: Secilen Field SAYISI ve DATA TYPE’i ayni olmalidir.
    Syntax:
    ----------
    SELECT sutun_adi,sutun_adi2, .. FROM tablo_adi1
    UNION
    SELECT sutun_adi1, sutun_adi2, .. FROM tablo_adi2;
    NOT: UNION operatoru SADECE benzersiz degerleri alir.
    Benzer verileri almak icin UNION ALL kullanilir.
======================================================*/
CREATE TABLE personel2(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO personel2 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel2 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel2 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500,'Honda');
INSERT INTO personel2 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel2 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel2 VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel2 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
INSERT INTO personel2 VALUES(345678902, 'Mehmet Ozturk', 'Izmir', 3500,'Honda');

select*from personel2;
-- 1) Honda ve Tofas’ta calisan benzersiz isimdeki personelleri listeleyin
select isim from personel where sirket=‘Honda’ union Select isim from personel where sirket=‘Tofas’;
-- 2) Honda, Ford ve Tofas’ta calisan benzersiz isimdeki personelleri listeleyin
select isim from personel2 where sirket=‘Honda’ union
Select isim from personel2 where sirket=‘Tofas’ union
Select isim from personel2 where sirket=‘Ford’;
-- 3) Honda, Ford ve Tofas’ta calisan butun personelleri listeleyin
select isim from personel2 where sirket=‘Honda’ union all
Select isim from personel2 where sirket=‘Tofas’ union all
Select isim from personel2 where sirket=‘Ford’;
-- 4) Maasi 4000'den fazla olan isci isimlerini ve 5000'den fazla
-- maas alinan sehirleri gosteren sorguyu yaziniz
select isim, maas from personel2 where maas >4000 union
select sehir, maas from personel2 where maas >5000;

-- 5) Mehmet Ozturk ismindeki personellerin aldigi maaslari ve Istanbul'daki
-- personelin maaslarini bir tabloda gosteren sorgu yaziniz

select isim as isci_sehir, maas
from personel2
where isim = 'Mehmet Ozturk'
union
select sehir, maas
from personel2
where sehir='Istanbul';

-- 6) Mehmet Ozturk ismindeki personellerin aldigi maaslari ve Istanbul'daki
-- personelin maaslarini en yuksekten dusuge dogru siralayarak bir
-- tabloda gosteren sorguyu yaziniz.
 select maas, isim as isim_sehir
 from personel2
 where isim= 'Mehmet Ozturk' 
 union
 select maas, sehir 
 from personel2
 where sehir= 'Istanbul'
 order by maas desc;




