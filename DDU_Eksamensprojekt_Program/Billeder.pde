class billeder {
  PImage[] billedearray = new PImage[52];
  
  PImage Startskaerm;
  PImage Hovedmenu;
  PImage bjbord;
  PImage kortbagside;
  PImage Indstillinger;
  PImage Statistik;
  PImage bjregler;
  
  PImage h1;
  PImage h2;
  PImage h3;
  PImage h4;
  PImage h5;
  PImage h6;
  PImage h7;
  PImage h8;
  PImage h9;
  PImage h10;
  PImage h11;
  PImage h12;
  PImage h13;
  
  PImage r1;
  PImage r2;
  PImage r3;
  PImage r4;
  PImage r5;
  PImage r6;
  PImage r7;
  PImage r8;
  PImage r9;
  PImage r10;
  PImage r11;
  PImage r12;
  PImage r13;
  
  PImage k1;
  PImage k2;
  PImage k3;
  PImage k4;
  PImage k5;
  PImage k6;
  PImage k7;
  PImage k8;
  PImage k9;
  PImage k10;
  PImage k11;
  PImage k12;
  PImage k13;
  
  PImage s1;
  PImage s2;
  PImage s3;
  PImage s4;
  PImage s5;
  PImage s6;
  PImage s7;
  PImage s8;
  PImage s9;
  PImage s10;
  PImage s11;
  PImage s12;
  PImage s13;
  
  
void loadBilleder() {
  Startskaerm = loadImage("Startskærm.jpg");
  Hovedmenu = loadImage("Hovedmenu.jpg");
  bjbord = loadImage("bjbord.jpg");
  kortbagside = loadImage("kortbagside.png");
  Indstillinger = loadImage("Indstillinger.jpg");
  Statistik = loadImage("Statistik.jpg");
  bjregler = loadImage("bjregler.jpg");
  
  }
  
void loadBilleder2(ArrayList<Spillekort> Kortbunke1){

  Kortbunke1.get(0).billede = loadImage("h1.png");
  Kortbunke1.get(1).billede = loadImage("h2.png");
  Kortbunke1.get(2).billede = loadImage("h3.png");
  Kortbunke1.get(3).billede = loadImage("h4.png");
  Kortbunke1.get(4).billede = loadImage("h5.png");
  Kortbunke1.get(5).billede = loadImage("h6.png");
  Kortbunke1.get(6).billede = loadImage("h7.png");
  Kortbunke1.get(7).billede = loadImage("h8.png");
  Kortbunke1.get(8).billede = loadImage("h9.png");
  Kortbunke1.get(9).billede = loadImage("h10.png");
  Kortbunke1.get(10).billede = loadImage("h11.png");
  Kortbunke1.get(11).billede = loadImage("h12.png");
  Kortbunke1.get(12).billede = loadImage("h13.png");
  
  Kortbunke1.get(13).billede = loadImage("r1.png");
  Kortbunke1.get(14).billede = loadImage("r2.png");
  Kortbunke1.get(15).billede = loadImage("r3.png");
  Kortbunke1.get(16).billede = loadImage("r4.png");
  Kortbunke1.get(17).billede = loadImage("r5.png");
  Kortbunke1.get(18).billede = loadImage("r6.png");
  Kortbunke1.get(19).billede = loadImage("r7.png");
  Kortbunke1.get(20).billede = loadImage("r8.png");
  Kortbunke1.get(21).billede = loadImage("r9.png");
  Kortbunke1.get(22).billede = loadImage("r10.png");
  Kortbunke1.get(23).billede = loadImage("r11.png");
  Kortbunke1.get(24).billede = loadImage("r12.png");
  Kortbunke1.get(25).billede = loadImage("r13.png");
  
  Kortbunke1.get(26).billede = loadImage("k1.png");
  Kortbunke1.get(27).billede = loadImage("k2.png");
  Kortbunke1.get(28).billede = loadImage("k3.png");
  Kortbunke1.get(29).billede = loadImage("k4.png");
  Kortbunke1.get(30).billede = loadImage("k5.png");
  Kortbunke1.get(31).billede = loadImage("k6.png");
  Kortbunke1.get(32).billede = loadImage("k7.png");
  Kortbunke1.get(33).billede = loadImage("k8.png");
  Kortbunke1.get(34).billede = loadImage("k9.png");
  Kortbunke1.get(35).billede = loadImage("k10.png");
  Kortbunke1.get(36).billede = loadImage("k11.png");
  Kortbunke1.get(37).billede = loadImage("k12.png");
  Kortbunke1.get(38).billede = loadImage("k13.png");
  
  Kortbunke1.get(39).billede = loadImage("s1.png");
  Kortbunke1.get(40).billede = loadImage("s2.png");
  Kortbunke1.get(41).billede = loadImage("s3.png");
  Kortbunke1.get(42).billede = loadImage("s4.png");
  Kortbunke1.get(43).billede = loadImage("s5.png");
  Kortbunke1.get(44).billede = loadImage("s6.png");
  Kortbunke1.get(45).billede = loadImage("s7.png");
  Kortbunke1.get(46).billede = loadImage("s8.png");
  Kortbunke1.get(47).billede = loadImage("s9.png");
  Kortbunke1.get(48).billede = loadImage("s10.png");
  Kortbunke1.get(49).billede = loadImage("s11.png");
  Kortbunke1.get(50).billede = loadImage("s12.png");
  Kortbunke1.get(51).billede = loadImage("s13.png");
  
}
  
void vishaand(ArrayList<Spillekort> haand, ArrayList<Spillekort> haand2, int tur, boolean split, ArrayList<Spillekort> splithaand){ // Display af spillekortene på blackjackbordet.
  
  for(int i = 0; i < haand.size(); i++){
  
  haand.get(i).display(480-80*i,470-80*i,100,144);
  
  }
  if(split == true){
  for(int i = 0; i < splithaand.size(); i++){
  
  splithaand.get(i).display(616+80*i,470-80*i,100,144);
  
  }
  
  }

 for(int i = 0 ; i < haand2.size();i++){ // Display af dealerens kort
  if(i == 0){
  haand2.get(i).display(480+136*i,120,100,144);
  }else if(tur > 1){
  haand2.get(i).display(480+136*i,120,100,144);
    
  }else{
  image(kortbagside,480+136*i,120,100,144);
  }
  
  
}

  }
}
