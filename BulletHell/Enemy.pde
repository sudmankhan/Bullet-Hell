public class Enemy extends Character {
  int health;
  int count;
  int score;
  
  public Enemy(int x, int y){
    super(x,y);
  } 
  
  void display(){
    rect(xPos, yPos, 30, 30);
  }
<<<<<<< HEAD
=======
  void shoot(Character target) {
    
  }
>>>>>>> Sudman
  
}
