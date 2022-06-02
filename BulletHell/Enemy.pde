public class Enemy extends Character {
  int count;
  int score;
  int rng;
  ArrayList<Bullet> enemyBullet;
  boolean slowMode = true;
  int enemyTime = 0;
  int moveDirection = 0;

  public Enemy(int x, int y) {
    super(x, y);
    health = 1;
    enemyBullet = new ArrayList<Bullet>();
  } 

  void display() {
    enemyTime++;
    if (!dead) {
      fill(255);
      rect(xPos, yPos, 30, 30);
    }
  }

  void moveLeft() {
    if (xPos > 20) {
      if (slowMode) {
        xPos -= 3;
      } else {
        xPos -= 15;
      }
    }
  }

  void moveRight() {
    if (xPos < width - 20) {
      if (slowMode) {
        xPos += 3;
      } else {
        xPos += 15;
      }
    }
  }

  void moveUp() {
    if (yPos > 20) {
      if (slowMode) {
        yPos -= 3;
      } else {
        yPos -= 15;
      }
    }
  }

  void moveDown() { 
    if (yPos < height-20) { 
      if (slowMode) {
        yPos += 3;
      } else {
        yPos += 15;
      }
    }
  }


  void randomMovement() {
    if (enemyTime % 20 == 0) { //every second, updates move direction
      rng = (int) (Math.random() * 4); //random integer 0, 1, 2, or 3.
    }
    if (rng == 0) {
      moveLeft();
    }
    if (rng == 1) {
      moveRight();
    }
    if (rng == 2) {
      moveDown();
    }
    if (rng == 3) {
      moveUp();
    }
  }

  void shoot(Character target) {
    if (!this.isDead()) {
      if (enemyBullet.size() == 0) { //no bullets in stage
        enemyBullet.add(new Bullet(xPos+15, yPos+15, mouseX, mouseY, color(255,0,0))); //add a bullet.
      } else if (enemyBullet.size() > 0) { //if there are bullets
        if (enemyBullet.get(enemyBullet.size()-1).countdown == 0) { //if the countdown is 0, add bullet.
          enemyBullet.add(new Bullet(xPos+15, yPos+15, target.xPos, target.yPos, color(255,0,0)));
          enemyBullet.get(enemyBullet.size()-1).countdown += 20;
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
