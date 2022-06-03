public class HomingBullet extends Bullet {
  boolean homingOn = false;
  int bulletTrack = 60;
  int type = 1;
  float angle;
  float angle2;

  public HomingBullet(int x, int y) {
    super(x, y);
    bulletTrack = 60;
  }

  public HomingBullet(int x, int y, color colr) {
    super(x, y, player.xPos, player.yPos, colr); 
    bulletTrack = 300;
    xpos = x;
    ypos = y;
    float angle = PI / 2; //In the event that some weird glitch happens, let's hope that the bullets will at least shoot up.
    float angle2 = angle;
    if (type == 1) {
      System.out.println("I CAN SEE THIS");
      while (player.xPos - xpos != 0 && bulletTrack != 0) {
        angle = atan(Math.abs((player.yPos - ypos))/Math.abs((player.xPos - xpos))); //finds a first quadrant angle.
        //System.out.println("Angle:" + (angle * 180 / PI));
        if ((player.yPos < ypos) && (player.xPos < xpos)) { //if shooting top left...?
          angle2 = PI - angle;
          //System.out.println("Angle2:" + (angle2 * 180 / PI));
        } else if ((player.yPos > ypos) && (player.xPos - xpos < 0)) {
          angle2 = PI + angle; 
          //System.out.println("Angle2:" + (angle2 * 180 / PI));
        } else if ((player.yPos > ypos) && (player.xPos > xpos)) { //if shooting bottom right, 
          angle2 = 2 * PI - angle;
          //System.out.println("Angle2:" + (angle2 * 180 / PI));
        } else {
          angle2 = angle;
        }
        bulletTrack--;
      }
      System.out.println("I CAN SEE THIS 2");
      bulletXSpeed = 5 * cos(angle2);
      bulletYSpeed = -5 * sin(angle2);
      //System.out.println("bulletYSpeed: " + bulletYSpeed);
      //System.out.println("bulletXSpeed: " + bulletXSpeed);
      countdown = 0;
      clr = colr;
      System.out.println("I CAN SEE THIS 3");
      damage = 1;
    }
  }
  
  void shoot() {
    while (player.xPos - xpos != 0 && bulletTrack != 0) {
        angle = atan(Math.abs((player.yPos - ypos))/Math.abs((player.xPos - xpos))); //finds a first quadrant angle.
        //System.out.println("Angle:" + (angle * 180 / PI));
        if ((player.yPos < ypos) && (player.xPos < xpos)) { //if shooting top left...?
          angle2 = PI - angle;
          //System.out.println("Angle2:" + (angle2 * 180 / PI));
        } else if ((player.yPos > ypos) && (player.xPos - xpos < 0)) {
          angle2 = PI + angle; 
          //System.out.println("Angle2:" + (angle2 * 180 / PI));
        } else if ((player.yPos > ypos) && (player.xPos > xpos)) { //if shooting bottom right, 
          angle2 = 2 * PI - angle;
          //System.out.println("Angle2:" + (angle2 * 180 / PI));
        } else {
          angle2 = angle;
        }
        bulletTrack--;
      }
      System.out.println("I CAN SEE THIS 2");
      bulletXSpeed = 5 * cos(angle2);
      bulletYSpeed = -5 * sin(angle2);
    xpos += bulletXSpeed; //go right by xspeed
    ypos += bulletYSpeed; //go down by yspeed
    display();
  }
  
  void display() {
    if (bulletTrack!= 0) {
      //stroke(1);
      bulletTrack--;
      fill(clr);
      circle(xpos, ypos, 10);
      noStroke();
      fill(red(clr), green(clr), blue(clr), 15);
      circle(xpos, ypos, 50);
      fill(red(clr), green(clr), blue(clr), 30);
      circle(xpos, ypos, 25);
    }
  }
}
