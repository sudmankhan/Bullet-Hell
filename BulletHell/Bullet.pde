int countdown;

public class Bullet {
  int xpos, ypos;
  int bulletXSpeed, bulletYSpeed;

  public Bullet(int x, int y) {
    xpos = x;
    ypos = y;
    bulletXSpeed = 10;
    bulletYSpeed = 5;
    countdown = 0;
  }
  
  void setCountdown(int a) {
    countdown = a;
  }
  
  int getCountdown() {
    return countdown;
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
