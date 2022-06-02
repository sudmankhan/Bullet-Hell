public class Boss extends Character {
  
  public Boss(int x, int y) {
    super(x,y);
  }
  
  void display() {
    fill(255,0,0);
    rect(xPos,yPos,50,40);
  }
}
