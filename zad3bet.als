abstract sig Osoba {
	rola: Rola
}
one sig Clayton, Forbes, Graham, Holgate, McFee, Warren
extends Osoba {}

abstract sig Rola {}
one sig Ofiara, Morderca, Świadek, Policjant, Sędzia, Kat
extends Rola {}

fact {
	//1 rola tylko
	Osoba.rola = Rola		
	
	//Pan McFee znał zarówno ofiarę, jak i mordercę.
	McFee.rola not in Ofiara + Morderca

	//W sądzie, sędzia zapytał pana Claytona o jego relację z przebiegu zdarzenia.
	Clayton.rola not in Sędzia + Ofiara + Kat

	//Pan Warren był ostatnią osobą, która widziała pana Forbesa żywego.
	(Warren.rola in Morderca and Forbes.rola in Ofiara)  or (Warren.rola in Kat and Forbes.rola in Morderca)

	//Policjant zeznał, że spotkał pana Grahama w pobliżu miejsca znalezienia ciała.
	//nie jest ani policjantem ani ofiarą
	Graham.rola in Świadek + Morderca + Kat

	//Panowie Holgate i Warren nigdy się nie spotkali.
	Holgate.rola + Warren.rola = Ofiara + Kat  or Holgate.rola + Warren.rola = Ofiara + Sędzia
}

run {}
