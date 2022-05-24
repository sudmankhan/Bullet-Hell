int stageNumber;
ArrayList<Enemy> enemiesInStage;
Player player;
boolean[] keysPressed;

void setup() {
  size(1200, 800);
  background(255);
  keysPressed = new boolean[4]; 
  player = new Player(600, 600);
  //enemiesInStage.add(new Enemy(600,200));
}

void mouseClicked() {
  //enemiesInStage.add(new Enemy(600,200));
}


void keyPressed()
{
  if (key=='a')
    keys[0]=true;
  if (key=='b')
    keys[1]=true;
}
void keyReleased()
{
  if (key=='a')
    keys[0]=false;
  if (key=='s')
    keys[1]=false;
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
  background(255);
  player.display();
  //enemiesInStage.get(0).display();
}
