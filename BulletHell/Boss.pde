public class Boss extends Enemy {
  float angle;
  float angle2;
  float angle3;
  float angle4;
  float maxHealth;
  int enemyCountdown;
  int phaseCountdown;
  boolean shieldOn;
  int shieldHealth;
  float maxShieldHealth;

  public Boss(int x, int y) {
    super(x, y);
    maxHealth = 250;
    health = (int) maxHealth;
    maxShieldHealth = 100;
    shieldHealth = (int) maxShieldHealth;
    angle = 270;
    angle2 = 90;
    angle3 = 0;
    angle4 = 180;
    phaseCountdown = 1000;
    shieldOn = false;
  }

  void display() {
    if (shieldOn) {
      fill(66, 182, 245);
      rect(xPos-5, yPos-5, 60, 50);
    }
    fill(255, 0, 0);
    rect(xPos, yPos, 50, 40);
  }

  void displayHealthBar(float hel) {
    fill(255, 0, 0);
    rect(20, 20, 1160, 20);
    fill(0, 255, 0);
    rect(20, 20, hel, 20);
    if (shieldOn) {
      fill(66, 182, 245);
      rect(20, 50, boss.shieldHealth * (1160.0/boss.maxShieldHealth), 10);
    }
  }

  void shootCircle() {
    int randRed = (int) (Math.random() * (255));
    int randGreen = (int) (Math.random() * (255));
    int randBlue = (int) (Math.random() * (255));
    color rand = color(randRed, randGreen, randBlue);
    if (!this.isDead()) {
      if (enemyBullet.size() == 0) { //no bullets in stage
        xPos = (int) (Math.random() * (1100-10) + 10);
        yPos = (int) (Math.random() * (700-10) + 10);
        enemyBullet.add(new Bullet(xPos+25, yPos+20, 0, rand));
        enemyBullet.add(new Bullet(xPos+25, yPos+20, 30, rand));
        enemyBullet.add(new Bullet(xPos+25, yPos+20, 60, rand));
        enemyBullet.add(new Bullet(xPos+25, yPos+20, 90, rand));
        enemyBullet.add(new Bullet(xPos+25, yPos+20, 120, rand));
        enemyBullet.add(new Bullet(xPos+25, yPos+20, 150, rand));
        enemyBullet.add(new Bullet(xPos+25, yPos+20, 180, rand));
        enemyBullet.add(new Bullet(xPos+25, yPos+20, 210, rand));
        enemyBullet.add(new Bullet(xPos+25, yPos+20, 240, rand));
        enemyBullet.add(new Bullet(xPos+25, yPos+20, 270, rand));
        enemyBullet.add(new Bullet(xPos+25, yPos+20, 300, rand));
        enemyBullet.add(new Bullet(xPos+25, yPos+20, 330, rand));
        enemyBullet.get(enemyBullet.size()-1).countdown += 50;
      } else if (enemyBullet.size() > 0) { //if there are bullets
        if (enemyBullet.get(enemyBullet.size()-1).countdown == 0) { //if the countdown is 0, add bullet.
          xPos = (int) (Math.random() * (1100-10) + 10);
          yPos = (int) (Math.random() * (700-10) + 10);
          enemyBullet.add(new Bullet(xPos+25, yPos+20, 0, rand));
          enemyBullet.add(new Bullet(xPos+25, yPos+20, 30, rand));
          enemyBullet.add(new Bullet(xPos+25, yPos+20, 60, rand));
          enemyBullet.add(new Bullet(xPos+25, yPos+20, 90, rand));
          enemyBullet.add(new Bullet(xPos+25, yPos+20, 120, rand));
          enemyBullet.add(new Bullet(xPos+25, yPos+20, 150, rand));
          enemyBullet.add(new Bullet(xPos+25, yPos+20, 180, rand));
          enemyBullet.add(new Bullet(xPos+25, yPos+20, 210, rand));
          enemyBullet.add(new Bullet(xPos+25, yPos+20, 240, rand));
          enemyBullet.add(new Bullet(xPos+25, yPos+20, 270, rand));
          enemyBullet.add(new Bullet(xPos+25, yPos+20, 300, rand));
          enemyBullet.add(new Bullet(xPos+25, yPos+20, 330, rand));
          enemyBullet.get(enemyBullet.size()-1).countdown += 50;
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
  void summonMinion() {
    if (enemyCountdown == 0) {
      enemiesInStage.add(new Enemy((int) (Math.random() * (1100-10) + 10), (int) (Math.random() * (700-10) + 10)));
      enemyCountdown += 500;
    } else {
      enemyCountdown--;
    }
  }
  void shield() {
    if (health == 125 && shieldHealth != 0) { 
      shieldOn = true;
    }
  }
  //bulletRain()
}
