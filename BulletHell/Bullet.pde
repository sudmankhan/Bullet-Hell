int countdown;

public class Bullet {
  int xpos, ypos;
  float bulletXSpeed, bulletYSpeed;

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
