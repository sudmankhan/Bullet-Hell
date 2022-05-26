int countdown;

public class Bullet {
  int xpos, ypos;
  float bulletXSpeed, bulletYSpeed;


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
  

  public Bullet(int x, int y) {
    xpos = x;
    ypos = y;
    bulletXSpeed = 5;
    bulletYSpeed = 5;
    countdown = 0;
  }

  public Bullet(int x, int y, int targetX, int targetY) {
    xpos = x;
    ypos = y;

    float angle = atan((targetY - ypos)/(targetX - xpos));
    bulletXSpeed = 5 * cos(angle);
    bulletYSpeed = 5 * sin(angle);
    countdown = 0;
  }

  void display() {
    fill(245, 215, 66);
    circle(xpos, ypos, 10);
  }

  void shootUp() {
    if (ypos > 10) {
      ypos -= bulletYSpeed;
      display();
    }
  }

  void shoot() {
    xpos += bulletXSpeed;
    ypos += bulletYSpeed;
    display();
  }
}
