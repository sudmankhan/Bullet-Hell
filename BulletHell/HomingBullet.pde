public class HomingBullet extends Bullet {
  boolean homingOn = false;
  int bulletLife = 60;
  
  public HomingBullet(int x, int y) {
    super(x, y);
  }
  
    public HomingBullet(int x, int y, int targetX, int targetY, color colr) {
     super(x, y, targetX, targetY, colr); 
    }
    
    void display() {
    //stroke(1);
    bulletLife--;
    fill(clr);
    circle(xpos, ypos, 10);
    noStroke();
    fill(red(clr), green(clr), blue(clr),15);
    circle(xpos, ypos, 50);
    fill(red(clr), green(clr), blue(clr),30);
    circle(xpos, ypos, 25);
  }
  
}
