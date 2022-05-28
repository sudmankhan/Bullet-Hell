int stageNumber;
ArrayList<Enemy> enemiesInStage;
ArrayList<Bullet> bulletsInStage;
ArrayList<Bullet> enemyBulletsInStage;
Player player;
Enemy mainEnemy;
boolean[] keysPressed;
boolean mouseHeld;
int timer;
color playerC;
color enemyC;

void setup() {
  size(1200, 800);
  background(255);
  keysPressed = new boolean[5]; 
  player = new Player(600, 600,3);
  mainEnemy = new Enemy(600, 50);
  //enemiesInStage.add(new Enemy(600,200));
  bulletsInStage = new ArrayList<Bullet>();
  enemyBulletsInStage = new ArrayList<Bullet>();
  playerC = color(0, 162, 255);
  enemyC = color(255, 0, 0);
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
  if (key == ' ') {
    keysPressed[4] = true;
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
  if (key == ' ') {
    keysPressed[4] = false;
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

  //text(timer,20,60);
  //text("" + mouseX + "," +mouseY, mouseX, mouseY); //Coordinates at the mouse
  //text("" + player.xPos + "," + player.yPos, player.xPos + 10, player.yPos + 15); //Coordinates at the player.

  //timer++;
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

  player.slowMode = keysPressed[4];



  //if (mouseHeld) {
  //  if (bulletsInStage.size() == 0) { //no bullets in stage
  //    bulletsInStage.add(new Bullet(player.xPos, player.yPos, mouseX, mouseY, playerC)); //add a bullet.
  //  } else if (bulletsInStage.size() > 0) { //if there are bullets
  //    if (bulletsInStage.get(bulletsInStage.size()-1).countdown == 0) { //if the countdown is 0, add bullet.
  //      bulletsInStage.add(new Bullet(player.xPos, player.yPos, mouseX, mouseY, playerC));
  //      bulletsInStage.get(bulletsInStage.size()-1).countdown += 2;
  //    } else {
  //      bulletsInStage.get(bulletsInStage.size()-1).countdown--;
  //    }
  //  }
  //}



  //for (int i = 0; i < bulletsInStage.size(); i++) {
  //  Bullet bullet = bulletsInStage.get(i);
  //  bullet.shoot();
  //  if (bullet.ypos <= 0 || bullet.ypos >= height || bullet.xpos <= 0 || bullet.xpos >= width) {
  //    bulletsInStage.remove(i);
  //  }
  //}
  fill(255);
  text(bulletsInStage.size(), 20, 20);
  text(mainEnemy.enemyBullet.size(),20,40);
  player.shoot();
  mainEnemy.shoot(player);
}
