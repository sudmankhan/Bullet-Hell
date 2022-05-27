int stageNumber;
ArrayList<Enemy> enemiesInStage;
ArrayList<Bullet> bulletsInStage;
ArrayList<Bullet> enemyBulletsInStage;
Player player;
Enemy mainEnemy;
boolean[] keysPressed;
boolean mouseHeld;
int timer;

void setup() {
  size(1200, 800);
  background(255);
  keysPressed = new boolean[4]; 
  player = new Player(600, 600);
  mainEnemy = new Enemy(600, 50);
  //enemiesInStage.add(new Enemy(600,200));
  bulletsInStage = new ArrayList<Bullet>();
  enemyBulletsInStage = new ArrayList<Bullet>();
}

void mousePressed() {
  mouseHeld = true;
}

void mouseReleased() {
  mouseHeld = false;
}

void keyPressed() {
  if (key == 'w') {
    keysPressed[0] = true;
  }
  if (key == 'a') {
    keysPressed[1] = true;
  }
  if (key == 's') {
    keysPressed[2] = true;
  }
  if (key == 'd') {
    keysPressed[3] = true;
  }
}


void keyReleased() {
  if (key == 'w') {
    keysPressed[0] = false;
  }
  if (key == 'a') {
    keysPressed[1] = false;
  }
  if (key == 's') {
    keysPressed[2] = false;
  }
  if (key == 'd') {
    keysPressed[3] = false;
  }
}

//void keyPressed() {
//  //if (key == BACKSPACE) {
//  //   if (movementMode == 1) {
//  //      movementMode = 0; 
//  //   }
//  //   else {
//  //    movementMode = 1; 
//  //   }
//  //}
//  if (key == 'w') { //w
//    player.moveUp();
//  }
//  if (key == 'a') { //a
//    player.moveLeft();
//  }
//  if (key == 's') { //s
//    player.moveDown();
//  }
//  if (key == 'd') { //d
//    player.moveRight();
//  }
//  if (key == 'a' && key == 'w') { //d
//    player.moveUpLeft();
//  }
//}

void draw() {
  background(0);
  player.display();
  if (!mainEnemy.isDead()) {  
    mainEnemy.display();
  }
  circle(mouseX, mouseY, 5);
  //text(timer,20,50);

  mainEnemy.display();
  text(timer,20,50);
  //text("" + mouseX + "," +mouseY, mouseX, mouseY); //Coordinates at the mouse
  //text("" + player.xPos + "," + player.yPos, player.xPos + 10, player.yPos + 15); //Coordinates at the player.

  timer++;
  //for (int i = 0; i < bulletsInStage.size(); i++) {
  //  Bullet bullet = bulletsInStage.get(i);
  //  bullet.shootUp();
  //}
  //if (keysPressed[0] && keysPressed[1]) {
  //  player.moveUpLeft();
  //}
  if (keysPressed[0]) {
    player.moveUp();
  }
  if (keysPressed[1]) {
    player.moveLeft();
  }
  if (keysPressed[2]) {
    player.moveDown();
  }
  if (keysPressed[3]) {
    player.moveRight();
  }

  //enemyBulletsInStage.add(new Bullet(mainEnemy.xPos + 15, mainEnemy.yPos + 30, player.xPos, player.yPos)); //Enemy is a square so it bases it off the top left corner.

  //straightBulletsEnemy.add(new Bullet(mainEnemy.xPos + 15, mainEnemy.yPos + 30, player.xPos, player.yPos)); //Enemy is a square so it bases it off the top left corner.

  if (mouseHeld) {
    if (bulletsInStage.size() == 0) { //no bullets in stage
      bulletsInStage.add(new Bullet(player.xPos, player.yPos, mouseX, mouseY)); //add a bullet.
    } else if (bulletsInStage.size() > 0) { //if there are bullets
      Bullet prev = bulletsInStage.get(bulletsInStage.size()-1); //previous bullet is the last bullet shot.
      if (prev.countdown == 0) { //if the countdown is 0, add bullet.
        bulletsInStage.add(new Bullet(player.xPos, player.yPos, mouseX, mouseY));
        prev.countdown += 3;
      } else {
        prev.countdown--;
      }
      text(prev.countdown,20,40);
    }
  }



  for (int i = 0; i < bulletsInStage.size(); i++) {
    Bullet bullet = bulletsInStage.get(i);
    bullet.shoot();
    if (bullet.ypos <= 10 || bullet.ypos >= height-10 || bullet.xpos <= 20 || bullet.xpos >= width - 20) {
      bulletsInStage.remove(i);
    }
  }
  text(bulletsInStage.size(), 20, 20);


  //for (int j = 0; j < enemyBulletsInStage.size(); j++) {
  //  Bullet bullet = enemyBulletsInStage.get(j);
  //  if (timer % 10 != 0) {
  //    bullet.shoot();
  //    timer++;
  //  }
  //  if (bullet.ypos <= 10 || bullet.ypos >= height-10 || bullet.xpos <= 20 || bullet.xpos >= width - 20) {
  //    enemyBulletsInStage.remove(j);
  //  }
  //  //enemiesInStage.get(0).display();
  //}

//  for (int j = 0; j < straightBulletsEnemy.size(); j++) {
//    Bullet bullet = straightBulletsEnemy.get(j);
//    if (timer % 10 != 0) {
//      bullet.shootDown();
//      timer++;
//    }
//    if (bullet.ypos <= 10 || bullet.ypos >= height-10 || bullet.xpos <= 20 || bullet.xpos >= width - 20) {
//      straightBulletsEnemy.remove(j);
//    }
//  //enemiesInStage.get(0).display();
//}

}
