public class HealthPack{
  float x;
  float y;
  int timer = 0;
  
  public HealthPack(int xPos, int yPos) {
    x = xPos;
    y = yPos;
  }
  
  void display() {
    timer++;
    fill(0,255, 0); //Green
    rect(x, y, 50, 50);
  }
}
