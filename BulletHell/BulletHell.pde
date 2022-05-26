int stageNumber;
ArrayList<Enemy> enemiesInStage;
ArrayList<Bullet> bulletsInStage;
Player player;
boolean[] keysPressed;
boolean mouseHeld;
int countdown;

void setup() {
  size(1200, 800);
  background(255);
  keysPressed = new boolean[4]; 
  player = new Player(600, 600);
  //enemiesInStage.add(new Enemy(600,200));
  bulletsInStage = new ArrayList<Bullet>();
}

void mousePressed() {
  //enemiesInStage.add(new Enemy(600,200));
  //bulletsInStage.add(new Bullet(player.xPos,player.yPos-20));
  mouseHeld = true;
  if (countdown == 0) {
    //1 second timer
    countdown+=60;
  }
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
  if (mouseHeld) {
    bulletsInStage.add(new Bullet(player.xPos, player.yPos-20));
  }
  for (int i = 0; i < bulletsInStage.size(); i++) {
    Bullet bullet = bulletsInStage.get(i);
    bullet.shootUp();
  }
  stroke(0, 255, 255);
  text(countdown, 20, 20);
  //enemiesInStage.get(0).display();
}
