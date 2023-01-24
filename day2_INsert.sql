/*========================================
               VERI GIRISI
========================================*/
-- INSERT INTO + tablo adi + VALUES + (std_id CHAR(4),std_name VARCHAR(25),std_age int)
-- Degerleri girerken dikkat edilmesi gereken Tabloyu 
-- olustururken degerleri atadigimiz veri cinsinden olmasi
-- String ifadeleri tek tirnak icinde yaziyoruz.
-- Date data tipi de String gibi tek tirnak icine yazilir,
-- ayrica MySQL 'in default tarih formati YYYY-MM-DD seklindedir.
/*******************************************************
-> Bir field'a kaydedilecek verileri UNIQUE yapmak icin 
 table olustururken field isminin yanina UNIQUE yaziyoruz.
-> Bir field'a kaydedilecek verilerde null olmasin istiyorsak 
table olustururken field isminin yanina NOT NULL yaziyoruz.
*********************************************************/
-- Fen Lisesi ogrencilerinin okul no , isim , derece, adres ve 
-- son degisiklik tarihi field'lari olan tablosunu hazirlayalim.
-- okul no field'i UNIQUE olmali, isim field'i da bos birakilmasin.
use sys;
create table fen_Lisesi(
okul_No int unique,
isim varchar(25),
derece double,
adres varchar(50) not null,
son_degisiklik_tarihi date
);

/*Insert into fen_lisesi values(101,'Sahabettin kara',4.5, 'van', '2023-01-20');
Insert into fen_lisesi values(102, 'hasan Adiguzel',5.0, 'Ankara', '2023-01-21');
Insert into fen_lisesi values(103, 'ayten Adiguzel',4.5, 'Malatya', '2023-01-12');
insert into fen_lisesi values(104, 'Nilgun adiguzel',5.0, 'Mugla ', '2023-01-13');
insert into fen_lisesi values(105, 'Melek Nalan Adiguzel',5.0, 'Artuklu', '2023-03-24');
insert into fen_lisesi values(null, 'Melek Nalan Adiguzel',5.0, 'Artuklu', '2023-03-24');
insert into fen_lisesi(isim, adres)values('HASAN Adiguzel','van');
select *from fen_lisesi;
drop table fen_lisesi;*/

Insert into fen_lisesi values(101, 'Hasan Adiguzel', 5.0,'Van','2023-12-12') ;
insert into fen_lisesi values(103, 'ayten Adiguzel',4.5, 'Malatya', '2023-01-12');
insert into fen_lisesi values(104, 'Nilgun adiguzel',5.0, 'Mugla ', '2023-01-13');
insert into fen_lisesi values(null, 'Melek Nalan Adiguzel',5.0, 'Artuklu', '2023-03-24');

insert into fen_lisesi(isim, adres, okul_No)values('ahmet', 'istanbul', 110);


select * from fen_lisesi;

-- UNIQUE olarak belirledigimiz bir field'a istedigimiz kadar NULL deger kaydedebiliriz
-- ancak data tipi String ise hiclik ifadesini sadece 1 kere kaydeder, 
-- diger kayitlarda duplicate hatasi verir.
/* ----------------------------------------------
Q1 : okul_no , isim , adres, derece fieldlari olan 
anadolu lisesi table olusturun. okul_no CHAR ve UNIQUE, 
isim NOT NULL olacak
------------------------------------------------- */
create table Anadolu_lisesi(
okul_No char(4) unique,
isim varchar(25),
adres varchar(100),
derece double,
son_Degisiklik_tarihi date
);
drop table anadolu_lisesi;
select * from anadolu_lisesi;
INSERT INTO anadolu_lisesi VALUES ('1002','Zafer Bey','Ankara',4.6,'2023-11-01' );
INSERT INTO anadolu_lisesi VALUES ('1003','Furkan Veli Inal','Istanbul',3.9 ,'2023-11-01');
INSERT INTO anadolu_lisesi VALUES ('1004','Humeyra Uysal','Izmir',4.8,'2023-11-01');
INSERT INTO anadolu_lisesi VALUES ('1005','Mehmet Harun','Istanbul',3.8,'2023-11-01');
INSERT INTO anadolu_lisesi VALUES ('','Berivan Gencdal','Izmir',4.8,'2023-11-01');
INSERT INTO anadolu_lisesi VALUES ('1111','Ilyas Bey','Istanbul',3.8,'2023-11-01');
INSERT INTO anadolu_lisesi VALUES ('1006','Neo Bey','Istanbul',3.8,'2023-11-01');
INSERT INTO anadolu_lisesi (isim, adres) VALUES ('Berrin Hanim','Ankara'); 
INSERT INTO anadolu_lisesi (okul_no, isim, derece) VALUES ('1007','Ersin Bey',4.9); 

/*==================================SELECT-WHERE=============================================
Verileri SELECT komutu ile veritabanindan cekerken filtreleme yapmak icin : 
 
SELECT ile birlikte WHERE komutu kullanilabilir.
-----Syntax----- :
SELECT field1, field2 
FROM tablo_adi 
WHERE kosul;
-- SELECT -- hangi sutunlari(field) getirsin
-- FROM -- hangi tablodan(table) getirsin
-- WHERE -- hangi satirlari(record) getirsin
=========================================================================================*/

create table meslek_lisesi(
okul_no char(4) unique,
isim varchar(50) not null,
derece double,
adres varchar(100),
son_degisiklik_tarihi date
);

select * from meslek_lisesi;

INSERT INTO meslek_lisesi VALUES('1001','Fatih Oz', 89,'Ankara', '2022-11-23');      
INSERT INTO meslek_lisesi VALUES('1002','Fatih Yildiz', 94,'Istanbul', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1003','Bora Sverige', 78,'Izmir', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1004','Nevzat Celik', 69,'Ankara', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1005','Gursel Unal', 90,'Istanbul', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1006','Soner Karatasoglu ', 85,'Istanbul', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1007','Talha Kurt', 75,'Ankara', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1008','Yakup Lejon', 79,'Izmir', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1009','Ilhan Gurbetci', 80,'Izmir', '2022-11-23');
select * from meslek_lisesi;

-- Q1 : Derecesi 90'dan yuksek olan ogrencilerin tum bilgilerini getirin.

select *
from meslek_lisesi 
where derece>90;

select isim, derece
from meslek_lisesi
where derece <80;

-- Q3 : Adresi Ankara olan ogrencilerin isim ve derece bilgilerini listeleyin.
select isim, derece
from meslek_lisesi
where adres='Ankara';
-- Q4 : okul_no'su 1005 olan ogrencinin isim ve adres bilgisini listeleyin.

select isim, adres
from meslek_lisesi
where okul_no= '1005';
-- Q5 : Derecesi 70 ile 80 arasinda olan ogrencilerin okul_no ve adreslerini listeleyin.

select okul_no,adres
from meslek_lisesi
where derece <80 and derece>70;

-- *************************************************************************

create table  ogretmen_lisesi(
id int,
isim varchar(50),
adres varchar(100),
sinav_Notu double 
); 


INSERT INTO ogretmen_lisesi VALUES (111, 'Emine Yucel', 'Ankara', 75);
INSERT INTO ogretmen_lisesi VALUES (112, 'Muhammet Talha Kurt', 'Istanbul', 85);
INSERT INTO ogretmen_lisesi VALUES (113, 'Ilhan Sahin', 'Ankara', 70);
INSERT INTO ogretmen_lisesi VALUES (114, 'Kadir Corumlu', 'Corum', 90);
INSERT INTO ogretmen_lisesi VALUES (115, 'Selman Kasabali', 'Ankara',70);
INSERT INTO ogretmen_lisesi VALUES (116, 'Murat Aycicek', 'Izmir', 85);
INSERT INTO ogretmen_lisesi VALUES (117, 'Tugba Ozsoy', 'Bolu', 85);
SELECT * FROM ogretmen_lisesi;
/*-------------------------------------------------------------------------
Q1: Sinav notu 80'den buyuk olan ogrencilerin tum bilgilerini listeleyin.
---------------------------------------------------------------------------*/
select *

from ogretmen_lisesi

where sinav_Notu>80;
/*-------------------------------------------------------------------------
Q2: Adresi Ankara olan ogrencilerin isim ve adres bilgilerini listeleyin.
---------------------------------------------------------------------------*/

select isim,adres
from ogretmen_lisesi
where adres = 'Ankara';

/*-------------------------------------------------------------------------
Q3: id'si 114 olan ogrencilerin tum bilgilerini listeleyin.
---------------------------------------------------------------------------*/

select *

from ogretmen_lisesi
where id =114;
/*================================== SELECT-BETWEEN =============================================
BETWEEN iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla 
yazabilme imkani verir, yazdigimiz iki sinirda araliga dahildir.
-----Syntax-----
SELECT field1,field2,...
FROM table_name
WHERE field_name 
BETWEEN deger1 AND deger2;
=========================================================================================*/
/*==========================AND (ve) Operatoru kullanimi==================================
=> And ile belirtilen sartlarin tamami gerceklesiyorsa o kayit listelenir,
Sartlardan bir tanesi bile tutmazsa listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50  sinav2 < 50
Bu ornekte hem sinav1 hem de sinav2 field'i 50'den kucuk olan kayitlar listelenecektir.

/*-------------------------------------------------------------------------
Q4: Sinav notu 70'ten buyuk 80'den kucuk olan ogrencilerin tum bilgilerini listeleyin.
---------------------------------------------------------------------------*/
-- +++++++++++++ 1. YOL +++++++++++++++
select * 
from ogretmen_lisesi
where sinav_Notu>=70 and sinav_Notu<=80;
-- +++++++++++++ 2. YOL +++++++++++++++

select *

from ogretmen_lisesi

where sinav_Notu

between 70 and 80;
-- yazdigimiz iki sinirda araliga dahildir.
/*-------------------------------------------------------------------------
Q5: Muhammet Talha ve Murat arasinda olan ogrencilerin isimlerini listeleyin.
---------------------------------------------------------------------------*/

select isim
from ogretmen_lisesi

where isim

between 'Muhammet Talha' AND 'Murat';


-- NOT : String ifadeleri BETWEEN komutu ile kiyaslamak istedigimizde bize
-- sonucu ASCII degerlerine gore siralayarak gonderir.
/*-------------------------------------------------------------------------
Q6: Ankara ile Corum arasinda olan ogrencilerin isimlerini listeleyin.
---------------------------------------------------------------------------*/

select isim,adres
from ogretmen_lisesi
where adres
between 'ankara' and 'corum';


-- **************************************************************

create table personel(
id char(5),
isim varchar(50),
maas int);

insert into personel values('10001','Ahmet Aslan',7000);
INSERT INTO personel VALUES('10002','Mehmet Yilmaz',12000);
INSERT INTO personel VALUES('10003','Meryem',7215);
INSERT INTO personel VALUES('10004','Veli Han',5000);
INSERT INTO personel VALUES('10005','Mustafa Ali',5500);
INSERT INTO personel VALUES('10006','Ayse Can',5600);
INSERT INTO personel VALUES('10010','Ayse',4700);
INSERT INTO personel VALUES('10009','Ayse Cemile',4000);
INSERT INTO personel VALUES('10008','Ayse Cano',4300);
INSERT INTO personel VALUES('10007','Can Ayse',7700);
INSERT INTO personel VALUES('10011','Yeliz Alina',12700);

select * from personel;
/*-------------------------------------------------------------------------
Q8: Ismi Mehmet Yilmaz ile Veli arasinda olan personel bilgilerini listeleyin
---------------------------------------------------------------------------*/
select *
from personel
where isim
between 'Mehmet Yilmaz' and 'veli';

/*-------------------------------------------------------------------------
Q7: id'si 10005 ile 10009 arasinda olan personelin bilgilerini listele
---------------------------------------------------------------------------*/

select *
from personel
where id
between '10005' and '10009';

/*-------------------------------------------------------------------------
Q10: Maasi 7000 ya da ismi Ayse olan personel id'lerini listeleyin
---------------------------------------------------------------------------*/

select id 
from personel

where maas= 7000 or isim ='ayse';

/*-------------------------------------------------------------------------
Q9: Ismi Ahmet ile Ayse Cano arasinda olan personel bilgilerini listeleyin
---------------------------------------------------------------------------*/

select *
from personel
where isim
between 'Ahmet' and 'Ayse cano';

/*-------------------------------------------------------------------------
Q11: Id'si 10001, 10005 ya da 10008 olan personel isimlerini listeleyin
---------------------------------------------------------------------------*/

select isim, id 
from personel
where id = '10001' or id= '10005' or id= '10008';

/*================================== SELECT-IN ===========================================
IN birden fazla mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla yazabilme
imkani verir. IN icerisine yazacagimiz sartlar ayni field'a ait olmali.
-----Syntax-----
SELECT field1,field2,...
FROM table_name
WHERE field_name IN (deger1,deger2,...);
=========================================================================================*/
/*-------------------------------------------------------------------------
Q12: Id'si 10001, 10005 ya da 10008 olan personel isimlerini listeleyin
---------------------------------------------------------------------------*/

select isim, id

from personel

where id in(10001, 10005, 10008);

/*-------------------------------------------------------------------------
Q13: Maasi sadece 7000 veya 12000 olan personelin bilgilerini listele
---------------------------------------------------------------------------*/

select *
from personel
where maas
in ('7000','12000');


/*================================== SELECT-LIKE =============================================
LIKE keyword sorgulama yaparken belirli patternleri kullanabilmemize olanak saglar.
-----Syntax-----
 SELECT field1,field2,...
 FROM table_name
 WHERE field LIKE pattern
 
 ----------------
 Pattern icin :
 % ---> 0 veya daha fazla karakteri belirtir
 _ ---> Tek bir karakteri temsil eder.
=========================================================================================*/

/*-------------------------------------------------------------------------
Q14: Ismi A ile baslayan personeli listeleyiniz
---------------------------------------------------------------------------*/
select *
from  personel
where isim Like 'a%';

/*-------------------------------------------------------------------------
Q15: Isminde Ayse olan personelin isimlerini listeleyiniz
---------------------------------------------------------------------------*/

select *
from personel
where isim like '%Ayse%';

/*-------------------------------------------------------------------------
Q16: Ismi n harfi ile biten personeli listeleyiniz
---------------------------------------------------------------------------*/

select *
from personel
where isim like '%n';

/*-------------------------------------------------------------------------
Q17: Isminin 2. harfi e olan personeli listeleyiniz
---------------------------------------------------------------------------*/

select *
from personel
where isim like '_e%';

/*-------------------------------------------------------------------------
Q18: Isminin 2. harfi e olup diger harflerinde y olan personeli listeleyiniz
---------------------------------------------------------------------------*/
select *
from personel

where isim like '_e%' and ism like  '%y%';

/*-------------------------------------------------------------------------
Q19: Isminde a harfi olmayan personeli listeleyiniz
---------------------------------------------------------------------------*/

select *
from personel

where isim not like '%a%';


/*-------------------------------------------------------------------------
Q20: Maasi 5 haneli olan personeli listeleyiniz
---------------------------------------------------------------------------*/
select *
from personel
where maas like '_____';

/*-------------------------------------------------------------------------
Q21: 1. harfi a ve 7. harfi a olan personeli listeleyiniz
---------------------------------------------------------------------------*/

select *
from personel
where isim like '%a_____a%';




















