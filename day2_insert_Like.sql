/*================================== SELECT-IN ===========================================
IN birden fazla mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla yazabilme
imkani verir. IN icerisine yazacagimiz sartlar ayni field'a ait olmali.
-----Syntax-----
SELECT field1,field2,...
FROM table_name
WHERE field_name IN (deger1,deger2,...);
=========================================================================================*/
/*-------------------------------------------------------------------------
Q11: Id'si 10001, 10005 ya da 10008 olan personel isimlerini listeleyin
---------------------------------------------------------------------------*/

select isim
from personel
where id 
in ('10001','10005','10008');

select *
from personel
where maas
in(7000,12000);

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
from personel
where isim Like 'a%'; 

select *
from personel
where isim like '%ayse%';


select *
from personel
where isim like '%n';
/*-------------------------------------------------------------------------
Q18: Isminin 2. harfi e olup diger harflerinde y olan personeli listeleyiniz
---------------------------------------------------------------------------*/

select *
from personel
where isim like '_e%';
/*-------------------------------------------------------------------------
Q18: Isminin 2. harfi e olup diger harflerinde y olan personeli listeleyiniz
---------------------------------------------------------------------------*/


select *
from personel
where isim like '_e%' and isim like '%y%';

/*-------------------------------------------------------------------------
Q18: Isminde  a  harfi olmayan  personeli listeleyiniz
---------------------------------------------------------------------------*/

select *
from personel
where isim not like '%a%' ;

/*-------------------------------------------------------------------------
Q20: Maasi 5 haneli olan personeli listeleyiniz
bes karekter icin bes alt tire giriyoruz 
---------------------------------------------------------------------------*/
select *
from personel
where maas  like '_____';

/*-------------------------------------------------------------------------
Q21: isminin 1. harfi a ve 7. harfi a olan personeli listeleyiniz
---------------------------------------------------------------------------*/

select *
from personel
where isim like 'a_____a%';







