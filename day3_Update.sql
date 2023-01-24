use sys;
/* ====================================== UPDATE ========================================
Tabloda varolan herhangi bir record'a ait verinin degistirilmesi icin kullanilir.
-----Syntax-----
UPDATE table_name
SET field1=''
WHERE condition;
UPDATE islemlerinin yapilabilmesi icin Ayarlar -> SQL Editor -> "Safe Updates" check box'indaki
tik isaretini kaldirip kaydetmemiz gerekiyor, sonrasinda MySQL'i kapatip tekrar acmaliyiz
========================================================================================*/

/*--------------------------------------------------------------------------------------
1) Bir firmalar tablosu olusturun icinde id,
isim ve iletisim_isim field'lari olsun. 
Id ve isim'i beraber Primary Key yapin.
---------------------------------------------------------------------------------------*/

drop table firmalar;

create table firmalar(
id int,
isim varchar(10),
iletisim_isim varchar(20),
constraint id_isim_pk primary key(id,isim)
);

/*--------------------------------------------------------------------------------------
2) Icine 3 kayit ekleyin :
(1, 'ACB', 'Ali Can'), 
(2, 'RDB', 'Veli Gul'), 
(3, 'KMN', 'Ayse Gulmez').
---------------------------------------------------------------------------------------*/
insert into firmalar values
(1, 'ACB', 'Ali Can'), 
(2, 'RDB', 'Veli Gul'), 
(3, 'KMN', 'Ayse Gulmez');


select * from firmalar;
-- Id'si 3 olan firmanin ismini 'KRM' olarak guncelleyiniz.

update firmalar
set isim ='krm'
where id =3;

select * from firmalar;

-- Iletisim ismi Veli Gul olan firmanin id'sini 4, ismini FDS olarak guncelleyiniz.

update firmalar
set id= 4, isim ='FDS'
where iletisim_isim = 'Veli Gul';
select * from firmalar;

-- Ismi ACB olan firmanin iletisim ismini 'Osman Can' olarak guncelleyiniz.
update firmalar
set iletisim_isim= 'Osman Can'
where isim ='ACB';
select * from firmalar;

-- Iletisim ismi 'Osman Can' olan firmanin iletisim ismini 'Ayse Can' olarak guncelleyiniz.
update firmalar
set iletisim_isim='Ayse Can'
where iletisim_isim='Osman Can';
select * from firmalar;

