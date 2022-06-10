public class ScatterShot extends Bullet {

  public ScatterShot(int x, int y,color colr){
    super(x,y,colr);
  }
  
  void shoot() {
    xpos += 5 * cos(PI/2);
    ypos += 5 * sin(PI/2);
  }
}
