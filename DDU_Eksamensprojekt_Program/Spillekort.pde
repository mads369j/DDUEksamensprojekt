class Spillekort { // Kortene for givvet deres værdi, alle billedetkort giver 10 og es giver 11.

int Vaerdi;
String kulor;
PImage billede;
  Spillekort(int a, String b){
    if(a > 10){
    a = 10;
    }
    if(a==1){
    a=11;
    }
    Vaerdi=a;
    kulor=b;
    
  }

void display(int x, int y, int w, int h){
  
  image(billede,x,y,w,h);


}

}
