public class HealthPack{
  float x;
  float y;
  int timer = 0;
  boolean avaliable = false;
  
  public HealthPack(int xPos, int yPos) {
    x = xPos;
    y = yPos;
  }
  
  void display() {
    timer++;
    fill(0,255, 0); //Green
    rect(x, y, 50, 50);
    fill(0);
    textSize(20);
    text("HP+", x+5,y+25);
    textSize(12);
  }
}
