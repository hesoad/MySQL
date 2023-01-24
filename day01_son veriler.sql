/*--------------------------------------------------------
Q2: "tedarikciler" table'indan "tedarikci_ismi" ve
 "ulasim_tarihi" field'lari olan "tedarikciler_son" 
 isimli yeni bir table olusturun.
---------------------------------------------------------*/

use sys; 

CREATE TABLE tedarikciler_son
AS
SELECT tedarikci_ismi,ulasim_tarihi
FROM tedarikci;
select * from tedarikciler_son;







