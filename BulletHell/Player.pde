public class Player extends Character {
  int shootingSpeed; 
  int movementMode;
  boolean slowMode;

  public Player(int x, int y,int shootSpeed) {
    super(x, y);
    shootingSpeed = shootSpeed;
    health = 10;
  }

  void setup() {
    circle(xPos, yPos, 30);
    movementMode = 0;
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
  //    moveUp();
  //  }
  //  if (key == 'a') { //a
  //    moveLeft();
  //  }
  //  if (key == 's') { //s
  //    moveDown();
  //  }
  //  if (key == 'd') { //d
  //    moveRight();
  //  }
  //}

  void display() {
    fill(255);
    circle(xPos, yPos, 30);
    fill(89, 255, 0);
    circle(xPos, yPos, 10);
    fill(255);
    //textSize(20);
    //fill(0,0,0);
    //text("Movement Mode: " + movementMode, 20, 20);
    //if (movementMode == 0){
    //  mouseMove();
    //}
  }

  void shoot() {
    if (mouseHeld) {
      if (bulletsInStage.size() == 0) { //no bullets in stage
        bulletsInStage.add(new Bullet(player.xPos, player.yPos, mouseX, mouseY, playerC)); //add a bullet.
      } else if (bulletsInStage.size() > 0) { //if there are bullets
        if (bulletsInStage.get(bulletsInStage.size()-1).countdown == 0) { //if the countdown is 0, add bullet.
          bulletsInStage.add(new Bullet(player.xPos, player.yPos, mouseX, mouseY, playerC));
          bulletsInStage.get(bulletsInStage.size()-1).countdown += shootingSpeed;
        } else {
          bulletsInStage.get(bulletsInStage.size()-1).countdown--;
        }
      }
    }

    for (int i = 0; i < bulletsInStage.size(); i++) {
      Bullet bullet = bulletsInStage.get(i);
      bullet.shoot();
      if (bullet.ypos <= 0 || bullet.ypos >= height || bullet.xpos <= 0 || bullet.xpos >= width) {
        bulletsInStage.remove(i);
      }
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

  //Sometimes, bullethell wasd controls can be jerky and hard to control and mouse controls are preferred as an alternative.
  void mouseMove() {
    if (xPos != mouseX || yPos != mouseY) {
      xPos = mouseX;
      yPos = mouseY;
    }
  }
}
