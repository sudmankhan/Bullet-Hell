public class HomingEnemy extends Enemy {

  public HomingEnemy(int x, int y) {
    super(x, y);
  }

  void shoot(Character target) {
    if (!this.isDead()) {
      if (enemyBullet.size() == 0) { //no bullets in stage
        enemyBullet.add(new HomingBullet(xPos+15, yPos+15, color(0, 255, 0))); //add a bullet.
      } else if (enemyBullet.size() > 0) { //if there are bullets
        if (enemyBullet.get(enemyBullet.size()-1).countdown == 0) { //if the countdown is 0, add bullet.
          enemyBullet.add(new HomingBullet(xPos+15, yPos+15, color(0, 255, 0)));
          enemyBullet.get(enemyBullet.size()-1).countdown += 10;
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
}
