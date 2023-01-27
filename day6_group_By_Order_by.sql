/* ======================== ALIASES ===========================
   Aliases kodu ile tablo yazdirilirken, field isimleri sadece
   o cikti icin degistirilebilir.
===============================================================*/
CREATE TABLE employees
(
employee_id char(9),
employee_name varchar(50),
employee_birth_city varchar(50)
);
INSERT INTO employees VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO employees VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO employees VALUES(345678901, 'Mine Bulut', 'Izmir');

select * from employees;

SELECT employee_id AS id, employee_name AS name, employee_birth_city AS city
FROM employees;


/* ======================== GROUP BY CLAUSE ===========================
   Group By komutu sonuclari bir veya daha fazla sutuna gore
   gruplamak icin SELECT komutuyla birlikte kullanilir.
   
   GROUP BY komutu her grup basina bir satir dondurur.
   
   GROUP BY AGGREGATE fonksiyonlariyla birlikte kullanilir.
======================================================================*/  
CREATE TABLE manav (
    isim VARCHAR(50),
    urun_adi VARCHAR(50),
    urun_miktar INT
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);
INSERT INTO manav VALUES( 'Ali', null, 2);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 1);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 4);
INSERT INTO manav VALUES( 'Ayse', null, 3);
SELECT * FROM manav;
-- isme gore alinan urunlerin toplam kilosunu bulup,
-- isim sirasina  gore siralayin
select isim,sum(urun_miktar) as top_kg
from manav
group by isim
order by isim;

-- isme gore alinan urunlerin toplam kilosunu bulup,
-- isim sirasina  gore ters siralayin

select isim,sum(urun_miktar) as top_kg
from manav
group by isim
order by isim desc;
-- bunlari bir de kiloya gore ters sirali yapalim
select isim,sum(urun_miktar) as top_kg
from manav
group by isim
order by top_kg desc;

-- 4) Urun ismine gore, urunu alan toplam kisi sayisini,
-- kisi sayisina gore siralayiniz.
select urun_adi ,count(isim) as Kisi_sayisi
from manav
group by urun_adi
order by kisi_sayisi;


-- 5) Alinan kilo miktarina gore musteri sayisini listeleyiniz.
select urun_miktar, count(isim)as kisi_sayisi
from manav
group by urun_miktar;

-- 6) Satilan meyve turune (urun_adi) gore urun alan kisi sayisini
--  ürün adi NATURAL ORDER'a gore gosteren QUERY yaziniz.
-- NULL olarak girilen meyveyi listelemesin.

select urun_adi, count(isim) as kisi_sayisi
from manav
where urun_adi  is not null
group by urun_adi
order by urun_adi;
-- 7) Satilan meyvenin 4 harfli olmasina  (urun_adi) gore urun alan kisi sayisini
--  ürün adi NATURAL ORDER'a gore gosteren QUERY yaziniz.
-- NULL olarak girilen meyveyi listelemesin.
select urun_adi, count(isim) as kisi_sayisi
from manav
where urun_adi like '____'
group by urun_adi
order by urun_adi;

-- 8) Satilan meyve turune (urun_adi) gore satilan (urun_miktari)
-- MIN ve MAX urun miktarlarini, MAX urun miktarina gore siralayarak
-- listeleyen OUERY yaziniz.
-- NULL olarak girilen meyveyi listelemesin.
select urun_adi, max(urun_miktar) as max_kilo, min(urun_miktar) as min_kilo
from manav
where urun_adi is not null
group by urun_adi
order by max_kilo;
-- 9) Kisi ismine ve urun_adina gore satilan urunlerin toplamini
-- gruplandiran ve isime gore ters sirada listeleyen QUERY yaziniz.
select isim, urun_adi, sum(urun_miktar) as urun_toplami
from manav
group by isim , urun_adi
order by isim desc, urun_adi desc;




