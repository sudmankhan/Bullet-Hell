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
    fill(0);
    circle(xpos, ypos, 10);
  }

  void shootUp() {
    ypos -= bulletYSpeed;
    display();
  }
}
