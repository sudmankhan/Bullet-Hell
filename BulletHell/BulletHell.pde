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
  player = new Player(600, 600, 3);
  mainEnemy = new Enemy(600, 50);
  enemiesInStage = new ArrayList<Enemy>();
  bulletsInStage = new ArrayList<Bullet>();
  enemyBulletsInStage = new ArrayList<Bullet>();
  playerC = color(0, 162, 255);
  enemyC = color(255, 0, 0);
  setupStage(1);
}

void mousePressed() {
  mouseHeld = true;
}

void mouseReleased() {
  mouseHeld = false;
}

void setupStage(int num) {
  switch(num) {
  case 1:
    enemiesInStage.add(new Enemy(200, 100));
    enemiesInStage.add(new Enemy(400, 100));
    enemiesInStage.add(new Enemy(600, 100));
    enemiesInStage.add(new Enemy(800, 100));
    enemiesInStage.add(new Enemy(1000, 100));
    break;
  case 2:
  case 3:
  case 4:
  case 5:
  }
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
  text(player.health, 20, 780);
  for (int i = 0; i < enemiesInStage.size(); i++) {
    if (!enemiesInStage.get(i).isDead()) {  
      enemiesInStage.get(i).display();
    }
  }
  circle(mouseX, mouseY, 5);
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

  fill(255);
  text(bulletsInStage.size(), 20, 20);
  text(mouseX + " " + mouseY, 20, 100);
  text(player.xPos + " " + player.yPos, 20, 120);

  player.shoot();

  for (int i = 0; i < enemiesInStage.size(); i++) {
    int enemycenterX = enemiesInStage.get(i).xPos + 15;
    int enemycenterY = enemiesInStage.get(i).yPos + 15;
    for (int j = 0; j < bulletsInStage.size(); j++) {
      Bullet temp = bulletsInStage.get(j);
      if (Math.abs(enemycenterX - temp.xpos) <= 15 && Math.abs(enemycenterY - temp.ypos) <= 15) {
        enemiesInStage.get(i).takeDamage();
        bulletsInStage.remove(temp);
      }
    }
  }

  for (int i = 0; i < enemiesInStage.size(); i++) {
    Enemy enemy = enemiesInStage.get(i);
    enemy.shoot(player);

    for (int j = 0; j < enemy.enemyBullet.size(); j++) {
      Bullet temp = enemy.enemyBullet.get(j);
      if (Math.abs(player.xPos - temp.xpos) <= 15 && Math.abs(player.yPos - temp.ypos) <= 15) {
        player.takeDamage();
        enemy.enemyBullet.remove(temp);
        print("hi");
      }
    }

    if (enemy.isDead()) {
      enemiesInStage.remove(i);
    }
  }
}
