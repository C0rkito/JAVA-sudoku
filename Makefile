# Variable
JCFLAGS = -encoding UTF-8 -implicit:none
JC = javac
JVM = java
JVMFLAGS = 


all: MainJeu.class MainModif.class 

MainJeu.class : MainJeu.java Menu.class 
	${JC}  MainJeu.java $(JCFLAGS) 

MainModif.class : MainModif.java Menu.class
	${JC} MainModif.java  $(JCFLAGS) 

CaseVue.class : CaseVue.java Case.class
	${JC} CaseVue.java  $(JCFLAGS) 

Case.class : Case.java 
	${JC} Case.java  $(JCFLAGS) 

Grille.class : Grille.java Case.class
	${JC} Grille.java $(JCFLAGS) 

GameButtonListener.class : GameButtonListener.java Grille.class Fenetre_message.class
	${JC} GameButtonListener.java $(JCFLAGS) 

CaseListener.class : CaseListener.java Case.class Grille.class CaseVue.class 
	${JC} CaseListener.java $(JCFLAGS) 

GrilleEditeur.class : GrilleEditeur.java CaseListener.class CaseVue.class GameButtonListener.class Grille.class
	${JC} GrilleEditeur.java $(JCFLAGS) 

MenuButtonListener.class : MenuButtonListener.java GrilleEditeur.class Grille.class Fenetre_message.class 
	${JC} MenuButtonListener.java $(JCFLAGS) 

Menu.class : Menu.java MenuButtonListener.class
	${JC}  Menu.java $(JCFLAGS) 

Fenetre_message.class : Fenetre_message.java
	${JC}  Fenetre_message.java $(JCFLAGS) 










run:
	${JVM} ${JVMFLAGS} MainJeu
	
run_edit:
	${JVM} ${JVMFLAGS} MainModif 

clear:
	rm -rf *.class