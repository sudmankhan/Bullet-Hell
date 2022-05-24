int stageNumber;
ArrayList<Enemy> enemiesInStage;
Player player;

void setup() {
  size(1200,800);
  background(255);
  player = new Player(600,600);
  //enemiesInStage.add(new Enemy(600,200));
}

void mouseClicked() {
  //enemiesInStage.add(new Enemy(600,200));
}

void draw() {
  background(255);
  player.display();
  //enemiesInStage.get(0).display();
}
