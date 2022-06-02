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
  
  void takeDamage(int dmg) {
    if (health > 0) {
      health -= dmg;
    }
    else if (health <= 0) {
      dead = true;
    }
  }
  
}
