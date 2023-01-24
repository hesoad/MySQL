-- UNIQUE olarak belirledigimiz bir field'a istedigimiz kadar NULL deger kaydedebiliriz
-- ancak data tipi String ise hiclik ifadesini sadece 1 kere kaydeder,
-- diger kayitlarda duplicate hatasi verir.

/* ----------------------------------------------
Q1 : okul_no int, isim , adres, derece fieldlari olan 
anadolu lisesi table olusturun. okul_no CHAR ve UNIQUE, 
isim NOT NULL olacak
------------------------------------------------- */

use sys;
create table Anadolu_Lisesi(
okul_NO varchar(25) unique,
isim varchar(25) not null ,
adres varchar(50),
derece double,
son_degisiklik_tarihi date
); 

insert into anadolu_lisesi1 values('101','Hasan Adiguzel','van',4.4);
insert into anadolu_lisesi1 values('102','ayten Adiguzel','malatya',4.5);
insert into anadolu_lisesi1 values('103','nilgun Adiguzel','mugla',5.4);
insert into anadolu_lisesi1 values('104','melek Nalan Adiguzel','Artuklu ',7.4);
insert into anadolu_lisesi1 values('105','ebrar  Adiguzel','van',4.4);

select * from anadolu_lisesi1;
drop table anadolu_lisesi