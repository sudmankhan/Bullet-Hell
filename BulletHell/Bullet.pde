public class Bullet {
  int xpos, ypos;
  int bulletXSpeed, bulletYSpeed;

  public Bullet(int x, int y) {
    xpos = x;
    ypos = y;
    bulletXSpeed = 10;
    bulletYSpeed = 5;
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
  
  void shootDown() {
    if (ypos < height - 10) {
      ypos += bulletYSpeed;
      display();
    }
  }

}
