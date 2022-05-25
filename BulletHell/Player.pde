public class Player extends Character {
  int health;
  float shootingSpeed; 
  int movementMode;
  
  public Player(int x, int y){
    super(x,y);
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
    fill(255, 255, 255);
    circle(xPos, yPos, 30);
    //textSize(20);
    //fill(0,0,0);
    //text("Movement Mode: " + movementMode, 20, 20);
    //if (movementMode == 0){
    //  mouseMove();
    //}
  }
  
  void shoot(int x, int y) {
  
  }
  
  void moveLeft() {
    if (xPos > 20) {
      xPos -= 15;
    }
  }
    
  void moveRight() {
    if (xPos < width - 20) {
    xPos += 15;
    }
  }
  
  void moveUp() {
    if (yPos > 20) {
    yPos -= 15;
    }
  }
  
  void moveDown() { 
    if (yPos < height-20) { 
    yPos += 15;
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
