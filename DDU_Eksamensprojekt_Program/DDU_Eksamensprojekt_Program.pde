String[] kort={"h1", "h2", "h3", "h4", "h5", "h6", "h7", "h8", "h9", "h10", "h11", "h12", "h13", "r1", "r2", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "r10", "r11", "r12", "r13", "k1", "k2", "k3", "k4", "k5", "k6", "k7", "k8", "k9", "k10", "k11", "k12", "k13", "s1", "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11", "s12", "s13"};

ArrayList<Spillekort> Kortbunke1 = new ArrayList();
ArrayList<Spillekort> Kortbunke3 = new ArrayList();

ArrayList<String> Kortbunke=new ArrayList();
ArrayList<String> Kortbunke2=new ArrayList();

ArrayList<Spillekort> haand = new ArrayList();
ArrayList<Spillekort> haand3 = new ArrayList();
ArrayList<Spillekort> splithaand = new ArrayList();

ArrayList<String> haand1=new ArrayList();
ArrayList<String> haand2=new ArrayList();

ArrayList<PImage> vishaand1=new ArrayList();

boolean startafspil=true;
boolean split=false;

int skaerm;
int tur=1;
int splitcounter=1;
int counter = 0;

int saldo = 500;
int bet = 0;
int bet2 = 0;

int cvundet = 0;
int ctabt = 0;
int cdiff = cvundet - ctabt;

int vhaand = 0;

int haandvaerdi = 0;
int haandvaerdi2 = 0;
int splithaandvaerdi = 0;

billeder b = new billeder();

Startskaerm startskaerm = new Startskaerm(b);
Hovedmenu hovedmenu = new Hovedmenu(b);
Bjbord bjbord = new Bjbord(b);
Indstillinger indstillinger = new Indstillinger(b);
Statistik statistik = new Statistik(b);
Bjregler bjregler = new Bjregler(b);

void setup() {
  size(1100, 700);
  b.loadBilleder();
  rectMode(CENTER);
  loadarray();
  b.loadBilleder2(Kortbunke1);
  
}

void draw() { 
  clear();

  println(mouseX, mouseY);
  
  if (skaerm==0) {
   startskaerm.display();
   }
   
   if (skaerm==1) {
   hovedmenu.display();
      
   }
   
   if (skaerm==2) {
   bjbord.display();
   b.vishaand(haand, haand3, tur, split, splithaand);
   traekkort();
   displayvaerdi();
   dealer();
   bust();
   hoejst();
   
   
   
  fill(0, 0, 0);
  textSize(20);
  text("Bet:" + bet, 10, 65);
  text("Bet2:" + bet2, 10, 110);
  text("Saldo:" + saldo, 10, 20);
  
  
   }
   
  if (skaerm==3){
  statistik.display();
  cdiff = cvundet - ctabt;
  fill(0, 0, 0);
  textSize(20);
  text(vhaand, 575, 242);
  text(cvundet, 587, 412);
  text(ctabt, 560, 495);
  text(cdiff, 585, 328);
  
  }
  
  if (skaerm==4){
  indstillinger.display();
  
  }
  
  if (skaerm==5){
  bjregler.display();
  
  }
  
}

void mouseClicked() {

  if (skaerm==0&&mouseX>335&&mouseX<760&&mouseY>75&&mouseY<330) { //'START' - Startskærm --> Hovedmenu
  skaerm=1;
   }else
   
  if (skaerm==1&&mouseX>0&&mouseX<75&&mouseY>620&&mouseY<700) { //Hovedmenu <-- Startskærm
  skaerm=0;
   }else
   
  if (skaerm==1&&mouseX>370&&mouseX<730&&mouseY>190&&mouseY<265) { //Hovedmenu --> Blackjack bordet
  skaerm=2;
   }else
  
  if (skaerm==1&&mouseX>370&&mouseX<730&&mouseY>280&&mouseY<350) { //Hovedmenu --> Statistik
  skaerm=3;
   }else
   
  if (skaerm==1&&mouseX>370&&mouseX<730&&mouseY>365&&mouseY<435) { //Hovedmenu --> Indstillinger
  skaerm=4;
   }else
   
  if (skaerm==3&&mouseX>0&&mouseX<75&&mouseY>620&&mouseY<700) { //Hovedmenu <-- Statistik
  skaerm=1;
   }else
   
  if (skaerm==4&&mouseX>0&&mouseX<75&&mouseY>620&&mouseY<700) { //Hovedmenu <-- Indstillinger
  skaerm=1;
   }else
   
  if (skaerm==2&&mouseX>1025&&mouseX<1100&&mouseY>0&&mouseY<80) { //Hovedmenu <-- blackjack bordet
  skaerm=1;
   }else
   
  if (skaerm==4&&mouseX>375&&mouseX<7350&&mouseY>365&&mouseY<435) { //Indstillinger --> Bjregler
  skaerm=5;
   }else
  
  if (skaerm==5&&mouseX>0&&mouseX<75&&mouseY>620&&mouseY<700) { //Indstillinger <-- Bjregler
  skaerm=4;
   }else
   
  if (skaerm==2&&mouseX>45&&mouseX<130&&mouseY>610&&mouseY<700) { 
  bet += 10;
  saldo -= 10;
   }else
   
  if (skaerm==2&&mouseX>140&&mouseX<220&&mouseY>610&&mouseY<700) {
  bet += 25;
  saldo -= 25;
   }else
   
  if (skaerm==2&&mouseX>235&&mouseX<315&&mouseY>610&&mouseY<700) {
  bet += 50;
  saldo -= 50;
   }else
   
  if (skaerm==2&&mouseX>335&&mouseX<415&&mouseY>610&&mouseY<700) {
  bet += 100;
  saldo -= 100;
   }else
   
  if (skaerm==2&&mouseX>425&&mouseX<505&&mouseY>610&&mouseY<700) {
  bet += 250;
  saldo -= 250;
   }else
   
  if (skaerm==2&&mouseX>515&&mouseX<595&&mouseY>610&&mouseY<700) {
  bet += 500;
  saldo -= 500;
   }else
   
  if (skaerm==2&&mouseX>610&&mouseX<690&&mouseY>610&&mouseY<700) {
  bet += 1000;
  saldo -= 1000;
   }else
   
  if (skaerm==2&&mouseX>705&&mouseX<785&&mouseY>610&&mouseY<700) {
  bet += 1500;
  saldo -= 1500;
   }else
   
  if (skaerm==2&&mouseX>800&&mouseX<875&&mouseY>610&&mouseY<700) {
  bet += 2000;
  saldo -= 2000;
   }else
   
  if (skaerm==2&&mouseX>885&&mouseX<965&&mouseY>610&&mouseY<700) {
  bet += 5000;
  saldo -= 5000;
   }else
   
  if (skaerm==2&&mouseX>975&&mouseX<1055&&mouseY>610&&mouseY<700) {
  bet += 10000;
  saldo -= 10000;
   }else
   
  if (skaerm==2&&mouseX>795&&mouseX<895&&mouseY>370&&mouseY<475) {
  hit();
   }else
   
  if (skaerm==2&&mouseX>220&&mouseX<320&&mouseY>370&&mouseY<475) {
  stand();
   }else
   
  if (skaerm==2&&mouseX>900&&mouseX<1000&&mouseY>270&&mouseY<375&&saldo>=bet) {
   doubble();
   }else
   
  if (skaerm==2&&mouseX>95&&mouseX<195&&mouseY>270&&mouseY<375&&saldo>=bet) {
   splits();
   }

}

void keyPressed() {

  if (skaerm==0&&key=='s') { //s" --> Hovedmenu
  skaerm=1;
  }

}


void loadarray(){ //Alle kortene indsættes i kortbunken
  
  for(int i=0; i<52; i++){
  Kortbunke.add(kort[i]);}
  //println(Kortbunke);
  
  for(int i=0;i<52;i++){
  
    String kulor = ""; //Alle kortene for givet deres kulør.
      if(i<13){
      kulor = "h";
      }
      if(i>12&&i<26){
      kulor = "r";
      }
      if(i>25&&i<39){
      kulor = "k";
      }
      if(i>38&&i<52){
      kulor = "s";
      }
      
  Kortbunke1.add(new Spillekort(i%13 +1,kulor)); //Kortene for givet deres værdi på blackjackbordet og den starter forfra ved værdien 13.
  //println(Kortbunke1.get(i).Vaerdi);
  
  }
}

void dealer(){
  if(tur==2){
    if(counter % 200==0){ // 'dla' kan kun gøre noget hver 200 frame.
    if(haandvaerdi2 < 17){ // Hvis hånd værdi er under 17 vil dealeren hit, ellers gives turen videre.
    int kort1=(int)random(0,Kortbunke1.size()-1); //Der bliver trukket et random kort fra bunken, hit knappen
      Spillekort kort1String=Kortbunke1.get(kort1);
      //println(kort1 + Kortbunke.get(kort1));
      haand3.add(kort1String);
      Kortbunke1.remove(kort1);
   
   
   
    }else{
    tur = 3;
    counter = 0;
    
    }
  }
  counter++;
  
  }


}

void traekkort(){
  if(startafspil==true){
    
    for(int i=0; i<2; i++){ //Ved start af spil bliver der givet 2 random kort til spilleren og dealeren.
      int kort1=(int)random(0,Kortbunke1.size()-1);
      Spillekort kort1String=Kortbunke1.get(kort1);
      //println(kort1 + Kortbunke.get(kort1));
      haand.add(kort1String);
      Kortbunke1.remove(kort1);
      int kort2=(int)random(0,Kortbunke1.size()-1);
      Spillekort kort2String=Kortbunke1.get(kort2);
      haand3.add(kort2String);
      Kortbunke1.remove(kort2);
      //println(i);
  }
  
 // println(haand1);
  
  int startkort=(int)random(0,Kortbunke1.size()-1);
  Spillekort startkortString=Kortbunke1.get(startkort);
  Kortbunke3.add(startkortString);
      Kortbunke1.remove(startkort);
  startafspil=false;
  }
if(Kortbunke1.size()==0){ //Hvis der ikke er flere kort i kortbunken, bliver den resettet.
while(Kortbunke3.size()>1){
Spillekort kort=Kortbunke3.get(0);
Kortbunke1.add(kort);
Kortbunke3.remove(0);
    }
  }
}

void hit(){ // Der bliver trukket et tilfældigt kort fra bunken til ens eller dealerens hånd.
  if(tur==1&&haandvaerdi<21&&splitcounter==1){ 
      int kort1=(int)random(0,Kortbunke1.size()-1);
      Spillekort kort1String=Kortbunke1.get(kort1);
      //println(kort1 + Kortbunke.get(kort1));
      haand.add(kort1String);
      Kortbunke1.remove(kort1);

  }
  
  if(tur==1&&splithaandvaerdi<21&&splitcounter==2){ //Hvis man har splittet og trykker hit
      int kort1=(int)random(0,Kortbunke1.size()-1);
      Spillekort kort1String=Kortbunke1.get(kort1);
      //println(kort1 + Kortbunke.get(kort1));
      splithaand.add(kort1String);
      Kortbunke1.remove(kort1);

  }
  
}

void stand(){ // Turen bliver givet videre, hvsi du ikke har splittet. Derimod går den videre til den anden hånd, hvis man har splittet.
  if(split==true&&splitcounter==1){
    splitcounter = 2;
  
  } else{
  
tur=2;
 
  }
}

void doubble(){
   if(splitcounter==1){
   saldo-=bet;
   bet *=2;
   }
   
   if(splitcounter==2){
   saldo-=bet2;
   bet2 *=2;
   }
   
   hit();
   stand();
 
}

void vinder(){
saldo += bet*2;
cvundet += bet;
bet = 0;
bet2 = 0;

vhaand ++;

}

void bust(){
  if(haandvaerdi > 21&&split==false || haandvaerdi2 > 21&&split==false){ // Man buster hvis ens håndværdi er over 21, den kigger her på begge ens hænder hver for sig (hvis man har splittet).
    if(haandvaerdi2 > 21){
    vinder();
    }
  ctabt += bet;
  bet = 0;
  
  for(int i = 0; i < haand.size(); i++){ // De forskllige hænder bliver resettet og kortene bliver lagt tilbage i bunken
      Spillekort kort1String=haand.get(i);
      //println(kort1 + Kortbunke.get(kort1));
      Kortbunke1.add(kort1String);
      haand.remove(i);
      i--;
  }
  
  for(int i = 0; i < haand3.size(); i++){
  Spillekort kort1String=haand3.get(i);
      //println(kort1 + Kortbunke.get(kort1));
      Kortbunke1.add(kort1String);
      haand3.remove(i);
      i--;
  }
tur = 1;
startafspil = true;
traekkort();

//println("hh");
  }
  
  if(split==true){
    if(haandvaerdi > 21){
     bet = 0;
     ctabt += bet;
  
  for(int i = 0; i < haand.size(); i++){
      Spillekort kort1String=haand.get(i);
      //println(kort1 + Kortbunke.get(kort1));
      Kortbunke1.add(kort1String);
      haand.remove(i);
      i--;
      }
    }
  
  if(splithaandvaerdi > 21){
     bet2 = 0;
     ctabt += bet2;
  
  for(int i = 0; i < splithaand.size(); i++){
      Spillekort kort1String=splithaand.get(i);
      //println(kort1 + Kortbunke.get(kort1));
      Kortbunke1.add(kort1String);
      splithaand.remove(i);
      i--;
      }
      if(haand.size()==0){
      for(int i = 0; i < haand3.size(); i++){
  Spillekort kort1String=haand3.get(i);
      //println(kort1 + Kortbunke.get(kort1));
      Kortbunke1.add(kort1String);
      haand3.remove(i);
      i--;
  }
tur = 1;
startafspil = true;
traekkort();
split = false;
splitcounter=1;

      }else{
    tur=2;
      }  
  }
  if(counter % 200==0){
  if(haandvaerdi2 > 21){
  vinder();
  saldo += bet2*2;
  bet2=0;
  cvundet += bet2;
  
  for(int i = 0; i < haand.size(); i++){
      Spillekort kort1String=haand.get(i);
      //println(kort1 + Kortbunke.get(kort1));
      Kortbunke1.add(kort1String);
      haand.remove(i);
      i--;
  }
  
  for(int i = 0; i < haand3.size(); i++){
  Spillekort kort1String=haand3.get(i);
      //println(kort1 + Kortbunke.get(kort1));
      Kortbunke1.add(kort1String);
      haand3.remove(i);
      i--;
  }
  
  for(int i = 0; i < splithaand.size(); i++){
  Spillekort kort1String=splithaand.get(i);
      //println(kort1 + Kortbunke.get(kort1));
      Kortbunke1.add(kort1String);
      splithaand.remove(i);
      i--;
  }
tur = 1;
startafspil = true;
traekkort();
split = false;
splitcounter=1;
  
    }
  }
 }
}

void hoejst(){ // Den kigger ens hænder igennem og ser hvilken hånd der har den højeste værdig til sammenligning med ens egne og dealerens.
  if(tur==3){ 
    if(haandvaerdi > haandvaerdi2){
    vinder();
    
    }else if(haandvaerdi == haandvaerdi2){
    saldo += bet;
    bet = 0;
    
    }else{
    ctabt += bet;
    bet = 0;
    
    }
    
    if(splithaandvaerdi > haandvaerdi2){
    saldo += bet2*2;
    cvundet += bet2;
    
    }else if(splithaandvaerdi == haandvaerdi2){
    saldo += bet2;
    bet2 = 0;
    
    }else{
    bet2 = 0;
      
    }
  for(int i = 0; i < haand.size(); i++){
      Spillekort kort1String=haand.get(i);
      //println(kort1 + Kortbunke.get(kort1));
      Kortbunke1.add(kort1String);
      haand.remove(i);
      i--;
  }
  
  for(int i = 0; i < splithaand.size(); i++){
      Spillekort kort1String=splithaand.get(i);
      //println(kort1 + Kortbunke.get(kort1));
      Kortbunke1.add(kort1String);
      splithaand.remove(i);
      i--;
  }
  
  for(int i = 0; i < haand3.size(); i++){
  Spillekort kort1String=haand3.get(i);
      //println(kort1 + Kortbunke.get(kort1));
      Kortbunke1.add(kort1String);
      haand3.remove(i);
      i--;
  }
tur = 1;
startafspil = true;
traekkort();
split=false;
splitcounter = 1;

//println("pp");
  }

}

void splits(){ // Man splitter sin hånd, man skal have nok penge, 2 kort og man må ikke allerede have splittet. Den tager det ene kort og putter hen i den anden hånd. Kortet bliver altså sat ind i en ny array.
  if(tur==1&&haand.size()==2&&split==false&&saldo>=bet){
    split=true;
    Spillekort kort1String=haand.get(1);
      //println(kort1 + Kortbunke.get(kort1));
      splithaand.add(kort1String);
      haand.remove(1);
    saldo -= bet;
    bet2 = bet;
}

}


void displayvaerdi(){ //Vi displayer værdien af de forskellige hænder. Værdien bliver reset hver gang, inden den regnes ud.

  haandvaerdi = 0;
  
for(int i=0; i < haand.size(); i++){

  haandvaerdi += haand.get(i).Vaerdi;

}

text(haandvaerdi, 470, 355);

  haandvaerdi2 = 0;  
  
for(int i=0; i < haand3.size(); i++){
  if(tur > 1){
  haandvaerdi2 += haand3.get(i).Vaerdi;
    
    }
  if(tur==1&&i==0){
  haandvaerdi2 += haand3.get(i).Vaerdi;
  
  }
  }

text(haandvaerdi2, 540, 260);

splithaandvaerdi = 0;
  
for(int i=0; i < splithaand.size(); i++){

  splithaandvaerdi += splithaand.get(i).Vaerdi;

}

text(splithaandvaerdi, 605, 355);


}
