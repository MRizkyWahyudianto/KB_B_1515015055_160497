predicates %predicates adalah nama simbolikuntuk relasi
  pekerjaan(symbol,symbol) - nondeterm (o,i), nondeterm (i,i)

clauses
%clauses digunakan untuk mendefinisikan predikat
  pekerjaan(kiwa,gubernur).
  pekerjaan(rizky,rt).
  pekerjaan(wahyu,lurah).
  pekerjaan(kiki,lurah).
  pekerjaan(reza,walikota).
  pekerjaan(tarik,gubernur).
  pekerjaan(eza,gubernur).
 %saya memakai fakta yang contohnya "kiwa bekerja sebagai gubernur"

goal
%goal adalah tempat pernyataan diberikan atau meminta prolog untuk mencapai tujuan yang dikehendaki
  pekerjaan(Person1,gubernur),
  pekerjaan(Person,walikota).
  %goal yang saya tuju adalah memilih gubernur dan walikota