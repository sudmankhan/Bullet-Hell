public class Player extends Character {
  int health;
  float shootingSpeed; 
  
  public Player(int x, int y){
    super(x,y);
  }
  
  void setup() {
    circle(xPos, yPos, 30);
  }
  
  void display() {
    circle(xPos, yPos, 30);
    mouseMove();
  }
  
  void shoot(int x, int y) {
  
  }
  
  void moveLeft() {
  
  }
  
  void moveRight() {
    
  }
  
  void moveUp() {
  
  }
  
  void moveDown() { 
  
  }
  
  //Sometimes, bullethell wasd controls can be jerky and hard to control and mouse controls are preferred as an alternative.
  void mouseMove() {
    if (super.xPos != mouseX || super.yPos != mouseY) {
      super.xPos = mouseX;
      super.yPos = mouseY;
    }
  }

}
