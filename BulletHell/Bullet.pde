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
    float angle = PI / 2; //In the event that some weird glitch happens, let's hope that the bullets will at least shoot up.
    float angle2 = angle;
    if (targetX - xpos != 0) {
      angle = atan(Math.abs((targetY - ypos))/Math.abs((targetX - xpos))); //finds a first quadrant angle.
      System.out.println("Angle:" + (angle * 180 / PI));
      if ((targetY < ypos) && (targetX < xpos)) { //if shooting top left...?
        angle2 = PI - angle;
        System.out.println("Angle2:" + (angle2 * 180 / PI));
      }
      else if ((targetY > ypos) && (targetX - xpos < 0)) {
         angle2 = PI + angle; 
         System.out.println("Angle2:" + (angle2 * 180 / PI));
      }
      else if ((targetY > ypos) && (targetX > xpos)) { //if shooting bottom right, 
         angle2 = 2 * PI - angle;
         System.out.println("Angle2:" + (angle2 * 180 / PI));
      }
      else {
       angle2 = angle; 
      }
    }
    bulletXSpeed = 5 * cos(angle2);
    bulletYSpeed = -5 * sin(angle2);
    System.out.println("bulletYSpeed: " + bulletYSpeed);
    System.out.println("bulletXSpeed: " + bulletXSpeed);
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
    xpos += bulletXSpeed; //go right by xspeed
    ypos += bulletYSpeed; //go down by yspeed
    display();
  }


  void shootDown() {
    if (ypos < height - 10) {
      ypos += bulletYSpeed;
      display();
    }
  }
}
