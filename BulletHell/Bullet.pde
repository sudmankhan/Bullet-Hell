public class Bullet {
  int x, y;
  int bulletXSpeed, bulletYSpeed;

  public Bullet(int xPos, int yPos, int xSpeed, int ySpeed){
    x = xPos;
    y = yPos;
    bulletXSpeed = xSpeed;
    bulletYSpeed = ySpeed;
  }

  void shootUp() {
  }
  
  void setup() {

  }

  void display() {
    fill(0, 0, 0);
    circle(x, y, 10);
  }

  void move() {
   x += bulletXSpeed;
   y += bulletYSpeed;
  }
  
  void shootPlayer(Character player) {
    if (player.xPos != x) {
    }
    if (player.yPos != y) {
    }
  }
  
}
