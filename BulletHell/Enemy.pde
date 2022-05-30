public class Enemy extends Character {
  int count;
  int score;
  ArrayList<Bullet> enemyBullet;

  public Enemy(int x, int y) {
    super(x, y);
    health = 5;
    enemyBullet = new ArrayList<Bullet>();
  } 

  void display() {
    if (health > 0) {
      rect(xPos, yPos, 30, 30);
    }
  }

  void shoot(Character target) {
    if (!this.isDead()) {
      if (enemyBullet.size() == 0) { //no bullets in stage
        enemyBullet.add(new Bullet(xPos+15, yPos+15, mouseX, mouseY, enemyC)); //add a bullet.
      } else if (enemyBullet.size() > 0) { //if there are bullets
        if (enemyBullet.get(enemyBullet.size()-1).countdown == 0) { //if the countdown is 0, add bullet.
          enemyBullet.add(new Bullet(xPos+15, yPos+15, target.xPos, target.yPos, enemyC));
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
    text(enemyBullet.size(), 20, 40);
  }

  boolean hitTarget(Character x) {
    for (int i = 0; i < enemyBullet.size(); i++) {
      Bullet temp = enemyBullet.get(i);
      if (Math.abs(x.xPos - temp.xpos) >= 10 && Math.abs(x.yPos - temp.ypos) >= 10) {
        return true;
      }

    }
    return false;
  }
}
