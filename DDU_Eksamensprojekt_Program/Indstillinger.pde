class Indstillinger{
 
  billeder b;
  Indstillinger(billeder b) {
    this.b=b;
  }

  void display() {
    imageMode(CENTER);
    image(b.Indstillinger, 550, 350);
  }
}
