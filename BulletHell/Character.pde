public class Character {
  int xPos, yPos;
  int health;
  boolean dead;
  
  public Character(int x, int y) {
    xPos = x;
    yPos = y;
  }
  
  boolean isDead() {
    return dead;
  }
  
  void takeDamage() {
    if (health > 0) {
      health--;
    }
    else if (health == 0) {
      dead = true;
    }
  }
  
}
