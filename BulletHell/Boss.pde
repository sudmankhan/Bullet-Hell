public class Boss extends Enemy {
  float angle;
  float angle2;
  float angle3;
  float angle4;

  public Boss(int x, int y) {
    super(x, y);
    health = 500;
    angle = 270;
    angle2 = 90;
    angle3 = 0;
    angle4 = 180;
  }

  void display() {
    fill(255, 0, 0);
    rect(xPos, yPos, 50, 40);
  }

  void displayHealthBar() {
  }

  void shootSpiral() {
    xPos = 600;
    yPos = 400;
    if (!this.isDead()) {
      if (enemyBullet.size() == 0) { //no bullets in stage
        enemyBullet.add(new Bullet(xPos+25, yPos+20, angle, color(255, 0, 0)));
        enemyBullet.add(new Bullet(xPos+25, yPos+20, angle2, color(255, 0, 0)));
        enemyBullet.add(new Bullet(xPos+25, yPos+20, angle3, color(255, 0, 0)));
        enemyBullet.add(new Bullet(xPos+25, yPos+20, angle4, color(255, 0, 0)));
        angle += 1;
        angle2 += 1;
        angle3 += 1;
        angle4 += 1;
        enemyBullet.get(enemyBullet.size()-1).countdown += 5;
      } else if (enemyBullet.size() > 0) { //if there are bullets
        if (enemyBullet.get(enemyBullet.size()-1).countdown == 0) { //if the countdown is 0, add bullet.
          enemyBullet.add(new Bullet(xPos+25, yPos+20, angle, color(255, 0, 0)));
          enemyBullet.add(new Bullet(xPos+25, yPos+20, angle2, color(255, 0, 0)));
          enemyBullet.add(new Bullet(xPos+25, yPos+20, angle3, color(255, 0, 0)));
          enemyBullet.add(new Bullet(xPos+25, yPos+20, angle4, color(255, 0, 0)));
          angle += 10;
          angle2 += 10;
          angle3 += 10;
          angle4 += 10;
          enemyBullet.get(enemyBullet.size()-1).countdown += 5;
        } else {
          enemyBullet.get(enemyBullet.size()-1).countdown--;
        }
      }
    }


    for (int i = 0; i < enemyBullet.size(); i++) {
      Bullet bullet = enemyBullet.get(i);
      bullet.shoot();
      if (bullet.ypos <= 0 || bullet.ypos >= height || bullet.xpos <= 0 || bullet.xpos >= width) {
        enemyBullet.remove(i);
      }
    }
    //text(enemyBullet.size(), 20, 40);
  }
  //shootLaser()
  //summonMinion()
  //shield()
  //bulletRain()
}
