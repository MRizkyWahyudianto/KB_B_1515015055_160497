/*****************************************************************************

		Copyright (c) 1984 - 2000 Prolog Development Center A/S

 Project:  
 FileName: CH04E12.PRO
 Purpose: 
 Written by: PDC
 Modifyed by: Eugene Akimov
 Comments: 
******************************************************************************/

trace
domains
  name,sex,occupation,object,vice,substance = symbol %mendefinisikan name,sexoccupation,object,vice,dan substance bertipe symbol
  age=integer %mendefinisikan age bertipe integer

predicates %predikat merupakan nama simbolik untuk suatu relasi, yang dikelompokkan dalam predikat biasanya berupa relasi yang akan di Clauses-kan(klausa)
%Kata nondeterm pada section predicates berfungsi untuk memberi tahu compiler bahwa predikat tersebut mempunyai lebih dari satu kemungkinan jawaban (non-deterministik)
%Kata person, had_affair, killed_with, killed, killer, motive, smeared_in, owns, operates_identically, owns_probably, dan suspect disebut relasi, dan yang berada di dalam tanda kurung merupakan objek dan disebut argument. 
  person(name,age,sex,occupation) - nondeterm (o,o,o,o), nondeterm (i,o,o,i), nondeterm (i,o,i,o) %relasi person memiliki argumen age,name,sex,occupation
  had_affair(name,name) - nondeterm (i,i), nondeterm (i,o)		%relasi had_affair memiliki argumen name
  killed_with(name,object) - determ (i,o)				%relasi killed_with memiliki argumen name dan object
  killed(name) - procedure (o)						%relasi killed memiliki argumen name
  killer(name) - nondeterm (o)						%relasi killer memiliki argumen name
  motive(vice) - nondeterm (i)						%relasi motive memiliki argumen vice
  smeared_in(name,substance) - nondeterm (i,o), nondeterm (i,i)		%relasi smeared_in memiliki argumen name and subtance
  owns(name,object) - nondeterm (i,i)					%relasi owns memiliki argumen name dan object
  operates_identically(object,object) - nondeterm (o,i)			%relasi operates_identically memiliki argumen object dan object
  owns_probably(name,object) - nondeterm (i,i)				%relasi owns_probably memiliki argumen name dan object
  suspect(name) - nondeterm (i)						%relasi suspect memiliki argumen name

/* * * Facts about the murder * * */ 
%fakta yang ada dalam kasus pembunuhan ini 
clauses %klausa berisikan suatu fakta dan aturan yang membentuk keseluruhan program. Bagian fakta biasanya dituliskan sebelum bagian aturan. Fakta atau aturan yang mempunyai relasi yang sama harus dituliskan berkelompok.
  person(bert,55,m,carpenter). 		%arti dari line ini adalah bert adalah orang yang memiliki umur 55 tahun, laki-laki dan memiliki pekerjaan carpenter 
  person(allan,25,m,football_player).	%arti dari line ini adalah allan adalah orang yang memiliki umur 25 tahun, laki-laki dan memiliki pekerjaan football_player
  person(allan,25,m,butcher).		%arti dari line ini adalah allan adalah orang yang memiliki umur 25 tahun, laki-laki dan memiliki pekerjaan butcher
  person(john,25,m,pickpocket).		%arti dari line ini adalah john adalah orang yang memiliki umur 25 tahun, laki-laki dan memiliki pekerjaan pencopet

  had_affair(barbara,john).		%barbara berselingkuh dengan john
  had_affair(barbara,bert).		%barbara berselingkuh dengan bert
  had_affair(susan,john).		%susan berselingkuh dengan john

  killed_with(susan,club).	%menerangkan bahwa korban susan terbunuh dengan pentungan
  killed(susan).		%menerangkan bahwa korban adalah susan

  motive(money). %terdapat 3 motif pembunuhan yang ada yaitu karena uang , cemburu  , dan dendam
  motive(jealousy).
  motive(righteousness).

%di tempat kejadian di temukan beberapa orang yang berlumuran :
  smeared_in(bert,blood). 		%bert berlumuran darah
  smeared_in(susan,blood).		%susan berlumuran darah
  smeared_in(allan,mud).		%allan berlumuran lumpur
  smeared_in(john,chocolate).		%john berlumuran coklat
  smeared_in(barbara,chocolate).	%barbara berlumuran coklat

  owns(bert,wooden_leg).		%bert memiliki kaki kayu
  owns(john,pistol).			%john memiliki pistol

/* * * Background knowledge * * */

  operates_identically(wooden_leg, club).		%berikut ini merupakan barang bukti yang mana pertama kaki kayu yang memiliki cara kerja mirip pentungan
  operates_identically(bar, club).			%balok cara kerja mirip pentungan
  operates_identically(pair_of_scissors, knife).	%gunting cara kerja mirip pisau
  operates_identically(football_boot, club).		%sepatu bola cara kerja mirip pentungan
%berikut di bwah ini merupakan kemungkinan-kemungkinan mengenai barang bukti yang ditemukan
  owns_probably(X,football_boot):-			%X kemungkinan memiliki sepatu bola 
	person(X,_,_,football_player).			%X orang yang memiliki profesi sebagai pemain bola
  owns_probably(X,pair_of_scissors):-			%X kemungkinan memiliki sepatu gunting
	person(X,_,_,hairdresser).			%X orang yang memiliki profesi sebagai pekerja salon
  owns_probably(X,Object):-				%X kemungkinan memiliki benda
	owns(X,Object).					%X memiliki benda

/* * * * * * * * * * * * * * * * * * * * * * *
 * Suspect all those who own a weapon with   *
 * which Susan could have been killed.       *
 * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-					%dicurigai adalah X
	killed_with(susan,Weapon) ,		%susan dibunuh dengan senjata
	operates_identically(Object,Weapon) ,	%benda memiliki cara kerja mirip senjata
	owns_probably(X,Object).		%X kemungkinan memiliki benda

/* * * * * * * * * * * * * * * * * * * * * * * * * *
 * Suspect men who have had an affair with Susan.  *
 * * * * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-				%dicurigai adalah X
	motive(jealousy),		%X memiliki motif cemburu
	person(X,_,m,_),		%X merupakan laki-laki 
	had_affair(susan,X).		%susan selingkuh dengan X

/* * * * * * * * * * * * * * * * * * * * *
 * Suspect females who have had an       *
 * affair with someone that Susan knew.  *
 * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-				%dicurigai adalah X
	motive(jealousy),		%memiliki motif cemburu
	person(X,_,f,_),		%X merupakan seorang perempuan
	had_affair(X,Man),		%X selingkuh dengan Laki-laki
	had_affair(susan,Man).		%Susan selingku dengan laki-laki , jadi di sini susan berselingkuh dengan laki-laki yang sama dengan X

/* * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Suspect pickpockets whose motive could be money.  *
 * * * * * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-				%dicurigai adalah X
	motive(money),			%memiliki motif Uang
	person(X,_,_,pickpocket).	%dicurigai X seorang pencopet

  killer(Killer):- %Dari fakta pembunuh ini terdapat pernyataan syarat dan prolog akan melakukan unifikasi terhadap pernyataan syarat-syarat tersebut.
	person(Killer,_,_,_),			%tersangka merupakan seseorang 
	killed(Killed),				%sedangkan korban adalah Susan
	Killed <> Killer, /* It is not a suicide */  %Korban bukan bunuh diri
	suspect(Killer),			%Tersangkanya adalah Killer
	smeared_in(Killer,Goo),			%Tersangka berlumuran sesuatu dan korbanpun berlumuran sesuatu yang sama dengan tersangka .
	smeared_in(Killed,Goo).

goal %GOAL merupakan pertanyaan yang ditanyakan kepada hasil yang diingikan. Dengan kata lain goal dapat juga digunakan untuk membuktikan aturan-aturan(rule) yang ada diatas. 
%tujuan dari program ini adalah mencari pelaku pembunuhan ini
  killer(X). 
  %bert terpilih sebagai tersangka karena fakta pertama pembunuh merupakan seseorang
  %pernyataan syarat pertama adalah siti dibunuh dengan senjata .Prolog akan memanggil fakta terbunuh_dengan untuk mengetahui senjata yang dipakai.Fakta yang didapat adalah siti terbunuh dengan pentungan Kemudian prolog akan mencari fakta dari benda yang kerjanya mirip senjata.
  %Lalu prolog akan memanggil fakta cara kerja mirip untuk mengetahui benda apa yang cara kerjanya mirip pentungan. Fakta yang didapat adalah kaki kayu yang cara kerja mirip pentungan. 
  %selanjutnya adalah sesuai benda yang di temukan prolog akan mencari siapa yang memiliki benda tersebut dari pernyataan dan fakta yang ada dicari bahwa siapa pemilik kaki kayu ini dan di dapat adalah bert .
  %Lalu prolog akan memanggil fakta berlumuran untuk melihat apa yang menodai bert, dan didapat fakta bahwa bert berlumuran darah. setelah itu prolog akan memeriksa fakta terakir yaitu Berlumuran(Terbunuh, Zat) dan didapat fakta bahwa berlumuran(Susan, Darah). Dari fakta ini ditemukan bahwa susan mempunyai noda yang sama dengan bert, berdasarkan kecocokan dari fakta-fakta diatas dari awal hingga akhir, sehingga prolog menetapkan bahwa pembunuh Susan adalah bert.
