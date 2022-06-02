public class StrongEnemy extends Enemy {

  public StrongEnemy(int x, int y) {
    super(x, y);
    health = 5;
  } 

  void display() {
    enemyTime++;
    if (!dead) {
      fill(190,0,0);
      rect(xPos, yPos, 30, 30);
    }
  }

  void shoot(Character target) {
    if (!this.isDead()) {
      if (enemyBullet.size() == 0) { //no bullets in stage
        enemyBullet.add(new StrongBullet(xPos+15, yPos+15, mouseX, mouseY, color(153, 0, 191))); //add a bullet.
      } else if (enemyBullet.size() > 0) { //if there are bullets
        if (enemyBullet.get(enemyBullet.size()-1).countdown == 0) { //if the countdown is 0, add bullet.
          enemyBullet.add(new StrongBullet(xPos+15, yPos+15, target.xPos, target.yPos, color(153, 0, 191)));
          enemyBullet.get(enemyBullet.size()-1).countdown += 25;
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

  boolean hitTarget(Character x) {
    for (int i = 0; i < enemyBullet.size(); i++) {
      Bullet temp = enemyBullet.get(i);
      if (Math.abs(x.xPos - temp.xpos) <= 10 && Math.abs(x.yPos - temp.ypos) <= 10) {
        return true;
      }
    }
    return false;
  }
}
