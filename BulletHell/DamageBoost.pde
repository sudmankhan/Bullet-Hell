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
    fill(255,0, 0); //Green
    rect(x, y, 50, 50);
    fill(0);
    textSize(12);
    text("DMG+", x+5,y+25);
    textSize(12);
  }
}
