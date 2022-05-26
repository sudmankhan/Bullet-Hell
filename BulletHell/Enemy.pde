public class Enemy extends Character {
  int count;
  int score;

  public Enemy(int x, int y) {
    super(x, y);
    health = 1;
  } 

  void display() {
    if (health > 0) {
      rect(xPos, yPos, 30, 30);
    }
  }

  void shoot(Character target) {
  }
}
