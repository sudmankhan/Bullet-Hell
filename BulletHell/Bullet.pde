//int countdown;
public class Bullet {
  int countdown;
  int xpos, ypos;
  float bulletXSpeed, bulletYSpeed;

  public Bullet(int x, int y) {
    xpos = x;
    ypos = y;
    bulletXSpeed = 10;
    bulletYSpeed = 1;
    countdown = 0;
  }

  public Bullet(int x, int y, int targetX, int targetY) {
    xpos = x;
    ypos = y;
    float angle = PI / 2; //In the event that some weird glitch happens, let's hope that the bullets will at least shoot up.
    if (targetX - xpos != 0) {
      angle = atan(Math.abs((targetY - ypos))/Math.abs((targetX - xpos)));
      if ((targetY - ypos > 0) && (targetX - xpos < 0)) {
        angle = PI - angle;
      }
      if ((targetY - ypos < 0) && (targetX - xpos < 0)) {
        angle = PI + angle;
      }
      if ((targetY - ypos < 0) && (targetX - xpos > 0)) {
          angle = atan((targetY-ypos)/(targetX - xpos));
      }
    }
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


  void shootDown() {
    if (ypos < height - 10) {
      ypos += bulletYSpeed;
      display();
    }
  }
}
