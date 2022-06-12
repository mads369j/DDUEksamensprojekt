class Bjregler{

  billeder b;
  Bjregler(billeder b) {
    this.b=b;
  }

  void display() {
    imageMode(CENTER);
    image(b.bjregler, 550, 350);
  }
}
