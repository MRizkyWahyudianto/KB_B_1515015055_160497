PREDICATES %predicates adalah nama simbolikuntuk relasi 
nondeterm korban(symbol,symbol)
nondeterm rumah(long,symbol,symbol)
nondeterm seluruhnya(long,symbol,symbol)
nondeterm kantor(long,symbol,symbol)
nondeterm mall(long,symbol,symbol)
nondeterm taman(long,symbol,symbol)
nondeterm melakukan(symbol,symbol)

CLAUSES %clauses digunakan untuk mendefinisikan predikat
%pada clauses korban ini saya menggunakan fakta seorang korban dengan profesinya , contohnya tukimin yang berprofesi sebagai pelajar.
korban(tukimin,pelajar). 
korban(rizky,kantoran).
korban(paijo,guru).
korban(deswitha,guru).
korban(sandi,perawat).
korban(kape,guru).
korban(yoga,kasir).
korban(ulfi,perawat).
%pada fakta berikutnya merupakan tempat kejadian yang mana terdapat tanggal, tempat kejadian pastinya, dan hari kejadiannya 
rumah(02092016,jlkamboja,senin).
rumah(01082016,jlanggrek,selasa).
rumah(16042017,jlkemangi,selasa).
kantor(23072017,ut,sabtu).
kantor(21092015,gedunggadis,jumat).
kantor(11102017,gedungdpr,senin).
mall(06092017,lembuswana,kamis).
mall(30032015,scp,rabu).
mall(09122017,bigmall,rabu).
taman(19052014,tamanoval,minggu).
taman(01082017,tamanberlabuh,minggu).
taman(06092016,tamansempaja,sabtu).

seluruhnya(Tanggal,NamaLokasi,Hari):-
rumah(Tanggal,NamaLokasi,Hari);
kantor(Tanggal,NamaLokasi,Hari);
mall(Tanggal,NamaLokasi,Hari);
taman(Tanggal,NamaLokasi,Hari).
%yang selanjutnya adalah kasus yang terjadi seperti pembunuhan dan lain-lain serta bukti yang di dapat di tempat kejadian 
melakukan(pembunuhan,rekamancctv).
melakukan(pencurian,handphone).
melakukan(korupsi,uang).
melakukan(pemerkosaan,visum).
melakukan(selingkuh,pisau).
	
GOAL %goal adalah tempat pernyataan diberikan atau meminta prolog untuk mencapai tujuan yang dikehendaki
seluruhnya(Tanggal,NamaLokasi,Hari),
Hari=sabtu,
korban(Korban,Profesi),
Profesi=guru,
melakukan(Kasus,Bukti),
Kasus=selingkuh.
%pada goal kali ini saya ingin menunjukkan kasus perselingkuhan yang terjadi di hari sabtu dan korban yang berprofesi sebagai guru 