DOMAINS
yes = symbol
jum = long

PREDICATES %predicates adalah nama simbolikuntuk relasi 
nondeterm kelompok(yes,yes,jum)
nondeterm seluruhnya(yes,yes)
nondeterm samarinda(yes,yes)
nondeterm tarakan(yes,yes)
nondeterm kotabangun(yes,yes)
nondeterm kegiatan(yes,yes)

CLAUSES %clauses digunakan untuk mendefinisikan predikat
%pada clauses korban ini saya menggunakan fakta seorang korban dengan profesinya , contohnya tukimin yang berprofesi sebagai pelajar dan berumur 15 tahun.
kelompok(fkti_A_2015,mahasiswa,50). 
kelompok(fkti_B_2015,mahasiswa,45).
kelompok(fkti_C_2015,mahasiswa,48).
kelompok(fkti_D_2015,mahasiswa,40).
kelompok(telkom_A,perusahaan,22).
kelompok(telkom_B,perusahaan,37).
kelompok(telkomsel,provider,25).
kelompok(indosat,provider,79).

%pada fakta berikutnya merupakan tempat kejadian yang mana terdapat tempat kejadian pastinya, dan hari kejadiannya 
samarinda(sempaja,senin).
samarinda(bengkuring,selasa).
samarinda(juanda,selasa).
kotabangun(kedangipil,sabtu).
kotabangun(desaloleng,jumat).
kotabangun(desasukabumi,senin).
tarakan(kampung4,kamis).
tarakan(amal,rabu).
tarakan(juata,rabu).

seluruhnya(NamaLokasi,Hari):-
samarinda(NamaLokasi,Hari);
kotabangun(NamaLokasi,Hari);
tarakan(NamaLokasi,Hari).


%yang selanjutnya adalah kasus yang terjadi seperti pembunuhan dan lain-lain serta pelaku dan bukti yang di dapat di tempat kejadian 
kegiatan(rizky,pengaruh_Hoax).
kegiatan(vita,pengenalan_internet).
kegiatan(vandt,memperluas_jaringan).
kegiatan(radhit,microsoft_office_dasar).
	
GOAL %goal adalah tempat pernyataan diberikan atau meminta prolog untuk mencapai tujuan yang dikehendaki
write("~~~~~~~~~~KEGIATAN KOMPUTER MASYARAKAT~~~~~~~~~~"),nl,
seluruhnya(NamaLokasi,Hari),
Hari=senin,nl,
kelompok(Kelompok,Profesi,Peserta),
Kelompok=fkti_B_2015,
kegiatan(Ketua_kegiatan,Kegiatan),
Kegiatan=memperluas_jaringan.