public class StrongBullet extends Bullet {

  public StrongBullet(int x, int y, color colr) {
    super(x,y,colr);
    damage = 2;
  }

  public StrongBullet(int x, int y, int targetX, int targetY, color colr) {
    super(x,y,targetX,targetY,colr);
    damage = 2;
  }
  
}
