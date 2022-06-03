public class HomingEnemy extends Enemy{
    ArrayList<HomingBullet>homingBullets;
    int type = 1;
    
    public HomingEnemy(int x, int y) {
    super(x, y);
    health = 1;
    enemyBullet = new ArrayList<Bullet>();
    homingBullets = new ArrayList<HomingBullet>();
  } 
  
    void shootHoming(Character target) {
    if (!this.isDead()) {
      if (homingBullets.size() == 0) { //no bullets in stage
        homingBullets.add(new HomingBullet(xPos+15, yPos+15, mouseX, mouseY, color(255, 192, 103))); //add a pink bullet.
      } else if (homingBullets.size() > 0) { //if there are bullets
        if (homingBullets.get(homingBullets.size()-1).countdown == 0) { //if the countdown is 0, add bullet.
          homingBullets.add(new HomingBullet(xPos+15, yPos+15, target.xPos, target.yPos, color(255, 192, 103))); //add a pink bullet
          homingBullets.get(homingBullets.size()-1).countdown += 20;
        } else {
          homingBullets.get(homingBullets.size()-1).countdown--; //decrease the countdown
        }
      }  
  }
  }
}
