class Bjbord{

  billeder b;
  Bjbord(billeder b) {
    this.b=b;
  }

  void display() {
    imageMode(CENTER);
    image(b.bjbord, 550, 350);
  }
}
