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
  
  void keyPressed() {
    if (key == BACKSPACE) {
       if (movementMode == 1) {
          movementMode = 0; 
       }
       else {
        movementMode = 1; 
       }
    }
    if (key == 'w') { //w
      moveUp();
      System.out.println("hi");
    }
    if (key == 'a') { //a
      moveLeft();
    }
    if (key == 's') { //s
      moveDown();
    }
    if (key == 'd') { //d
      moveRight();
    }
  }
  
  void display() {
    fill(255, 255, 255);
    circle(xPos, yPos, 30);
    textSize(20);
    fill(0,0,0);
    text("Movement Mode: " + movementMode, 20, 20);
    if (movementMode == 0){
      mouseMove();
    }
  }
  
  void shoot(int x, int y) {
  
  }
  
  void moveLeft() {
    super.xPos -= 30;
  }
  
  void moveRight() {
    super.xPos += 30;
  }
  
  void moveUp() {
    super.yPos -= 30;
  }
  
  void moveDown() { 
    super.yPos += 30;
  }
  
  //Sometimes, bullethell wasd controls can be jerky and hard to control and mouse controls are preferred as an alternative.
  void mouseMove() {
    if (super.xPos != mouseX || super.yPos != mouseY) {
      super.xPos = mouseX;
      super.yPos = mouseY;
    }
  }

}
