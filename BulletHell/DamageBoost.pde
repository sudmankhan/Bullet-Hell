public class DamageBoost{
  float x;
  float y;
  int addedDamage;
  boolean avaliable = false;
  
  public DamageBoost(int xPos, int yPos, int added) {
    x = xPos;
    y = yPos;
    addedDamage = added;
  }
  
  void display() {
    timer++;
    fill(255, 0, 0); //Red
    rect(x, y, 50, 50);
  }
}
