int countdown;

public class Bullet {
  int xpos, ypos;
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
  

  public Bullet(int x, int y) {
    xpos = x;
    ypos = y;
    bulletXSpeed = 10;
    bulletYSpeed = 5;
  }
  
  void setCountdown(int a) {
    countdown = a;
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
}
