//int countdown;
public class Bullet {
  int countdown;
  float xpos, ypos;
  float bulletXSpeed, bulletYSpeed;
  color clr;

  public Bullet(int x, int y) {
    xpos = x;
    ypos = y;
    bulletXSpeed = 10;
    bulletYSpeed = 1;
    countdown = 0;
  }

  public Bullet(int x, int y, int targetX, int targetY, color colr) {
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
      } else if ((targetY > ypos) && (targetX - xpos < 0)) {
        angle2 = PI + angle; 
        System.out.println("Angle2:" + (angle2 * 180 / PI));
      } else if ((targetY > ypos) && (targetX > xpos)) { //if shooting bottom right, 
        angle2 = 2 * PI - angle;
        System.out.println("Angle2:" + (angle2 * 180 / PI));
      } else {
        angle2 = angle;
      }
    }
    bulletXSpeed = 5 * cos(angle2);
    bulletYSpeed = -5 * sin(angle2);
    System.out.println("bulletYSpeed: " + bulletYSpeed);
    System.out.println("bulletXSpeed: " + bulletXSpeed);
    countdown = 0;
    clr = colr;
  }


  void display() {
    //stroke(1);
    fill(clr);
    circle(xpos, ypos, 10);
    noStroke();
    fill(red(clr), green(clr), blue(clr),15);
    circle(xpos, ypos, 50);
    fill(red(clr), green(clr), blue(clr),30);
    circle(xpos, ypos, 25);
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
