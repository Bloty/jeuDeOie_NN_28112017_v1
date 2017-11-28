{ALGORITHME Jeu_de_l_oie
BUT : Jeu de l'oie : le jeu se joue seul. Le joueur est caractérisé par un nombre : place 
(variable), avec des cases comprises entre 0 et 66, qui situe sa position sur le plateau.
Après un jet des 2 dés, on applique règles suivantes : 
- On avance du nombre de cases indiquées par la somme des dés.
- Si on arrive pile sur la case 66, le jeu est terminé, sinon, on recule.
- Une oie toute les neuf cases, sauf en 63, double le déplacement en cours (le joueur
ne finira jamais son tour sur un multiple de 9).
- Une tête de mort à la case 58 renvoie à la position de départ case 0.

On s'efforcera d'utiliser au maximum l'emploie de constantes.
Production d'un algo et d'un programme lisible et clair (avec commentaires).
Vérifier que le jet de dé est valide.
Modulo pour test multiple de 9.

Modifs possibles :
-Randomn pour jets de dés. 
ENTREES : Valeur des dés
SORTIE : La victoire
CONST
	crane <- 58 : ENTIER
	arriver <- 66 : ENTIER
VAR
	choix, de1, de2, sommeDes, place, recul : ENTIER
DEBUT
//Menu
ECRIRE "Jeu de l oie"
ECRIRE "choix du lancer des des"
ECRIRE "1 = Saisi manuelle"
ECRIRE "2 = Lancer aleatoire"
LIRE choix
CAS choix PARMI
//Choix 1 manuelle
	1:REPETER
		ECRIRE "Entrer la valeur du premier dé."
		LIRE de1
		ECRIRE "Entrer la valeur du second dé."
		LIRE de2
//Déplacement du joueur
		SI ((de1 > 0 ET de1 <= 6) ET (de2 > 0 ET de2 <= 6)) ALORS
			sommeDes <- de1 + de2
			ECRIRE "La somme des dés est : ", sommeDes
			place <- place + sommeDes
		SINON
			ECRIRE "Veyez entrer une valeur de dé valide svp"
		FINSI

//Protocole des ois
		TANQUE (place <> 63) ET (place MOD 9 = 0) ET (place <= arriver) FAIRE
				ECRIRE "Cool vous etes sur une case oie"
				place <- place + sommeDes
		FINTANQUE
//Protocole du crane
		SI (place = crane) ALORS
			ECRIRE "Dommage"
			place <- 0
		FINSI
//Protocole pour l'arrivée
		SI (place > arriver) ALORS
			DEBUT
				recul <- place - arriver
				place <- arriver - recul
			FIN
		FINSI

		ECRIRE "Vous etes a la case : ", place
		
	JUSQU'A (place = arriver)
//Choix 2 aleatoire
	2:REPETER
		ECRIRE "Lancer les des en appuient sur entrer"
		de1 <- ALEATOIRE (1 A 6)
		de2 <- ALEATOIRE (1 A 6)
//Déplacement du joueur
			sommeDes <- de1 + de2
			ECRIRE "La somme des dés est : ", sommeDes
			place <- place + sommeDes
		SINON
			ECRIRE "Veyez entrer une valeur de dé valide svp"
		FINSI

//Protocole des ois
		TANQUE (place <> 63) ET (place MOD 9 = 0) ET (place <= arriver) FAIRE
				ECRIRE "Cool vous etes sur une case oie"
				place <- place + sommeDes
		FINTANQUE
//Protocole du crane
		SI (place = crane) ALORS
			ECRIRE "Dommage"
			place <- 0
		FINSI
//Protocole pour l'arrivée
		SI (place > arriver) ALORS
			DEBUT
				recul <- place - arriver
				place <- arriver - recul
			FIN
		FINSI

		ECRIRE "Vous etes a la case : ", place
		
	JUSQU'A (place = arriver)
PARDEFAUT ECRIRE "Choix invailde"
FINCASPARMIS

	SI (place = arriver) ALORS
		ECRIRE "BRAVO!!! vous avez GAGNE"
	FINSI
FIN}

PROGRAM Jeu_de_l_oie;

USES crt;

CONST
	crane=58;
	arriver=66;
VAR
	choix, de1, de2, sommeDes, place, recul : INTEGER;
BEGIN
clrscr;
//menu
writeln('Jeu de l oie');
writeln;
writeln('Choix du lancer des des');
writeln;
writeln('1 = Saisi manuelle');
writeln('2 = Lancer aleatoire');
readln(choix);
case choix of
//Manuelle
	1:repeat
		begin
//Déplacement du joueur avec une saisi manuelle
			writeln('Entrer la valeur du premier de');
			readln(de1);
			writeln('Entrer la valeur du second de');
			readln(de2);

			if ((de1>=1) and (de1<=6)) and ((de2>=1) and (de2<=6)) then
				begin
				sommeDes:=de1+de2;
				writeln('La somme des des est : ', sommeDes);
				place:=place+sommeDes
				end
			else
				writeln('Veyez entrer une valeur de de valide svp');
//Protocole des oies					
			while (place<>63) and (place mod 9=0) and (place<=arriver) do
				begin
				writeln('Cool vous etes sur une case oie');
				place:=place+sommeDes
				end;
//Protocle du crane
			if (place=crane) then
				begin
				writeln('Dommage');
				place:=0
				end;
//Protocole pour l'arrivée
			if (place > arriver) then
				begin
				recul:=place-arriver;
				place:=arriver-recul
				end;
//Position du joueur
			writeln('Vous etes a la case : ', place);
			writeln;
		end;
	until place=arriver;
//Aleatoire
	2:repeat
		begin
//Déplacement du joueur avec aleatoire
			writeln ('Lancer les des en appuient sur entrer');
			readln;
			clrscr;
			randomize;
			de1:=random(5)+1;
			writeln ('La valeur du premier est de : ', de1);
			de2:=random(5)+1;
			writeln ('La valeur du second est de : ', de2);
			
			sommeDes:=de1+de2;
			writeln('La somme des des est : ', sommeDes);
			place:=place+sommeDes;

//Protocole des oies					
			while (place<>63) and (place mod 9=0) and (place<=arriver) do
				begin
				writeln('Cool vous etes sur une case oie');
				place:=place+sommeDes
				end;
//Protocle du crane
			if (place=crane) then
				begin
				writeln('Dommage');
				place:=0
				end;
//Protocole pour l'arrivée
			if (place > arriver) then
				begin
				recul:=place-arriver;
				place:=arriver-recul
				end;
//Position du joueur
			writeln('Vous etes a la case : ', place);
			writeln;
		
		end;
	until place=arriver;
else writeln('Choix invailde')
end;

if (place=arriver) then
	writeln('BRAVO!!! vous avez GAGNE');

readln;
END.