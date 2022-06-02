int stageNumber;
ArrayList<Enemy> enemiesInStage;
ArrayList<Bullet> bulletsInStage;
ArrayList<Bullet> enemyBulletsInStage;
Player player;
boolean[] keysPressed;
boolean mouseHeld;
static int timer;
color playerC;
//color enemyC;
int gameState;
boolean godMode;
Boss boss;

void setup() {
  size(1200, 800);
  background(0);
  keysPressed = new boolean[5]; 
  player = new Player(600, 600, 5);
  enemiesInStage = new ArrayList<Enemy>();
  bulletsInStage = new ArrayList<Bullet>();
  enemyBulletsInStage = new ArrayList<Bullet>();
  playerC = color(0, 162, 255);
  //enemyC = color(255, 0, 0);
  stageNumber = 0;
  gameState = 1;
  godMode = false;
  boss = new Boss(550, 75);
}

void mousePressed() {
  if (!player.isDead()) {
    mouseHeld = true;
  }
}

void mouseReleased() {
  if (!player.isDead()) {
    mouseHeld = false;
  }
}

void setupStage(int num) {
  switch(num) {
  case 1:
    enemiesInStage.add(new Enemy(200, 50));
    enemiesInStage.add(new Enemy(400, 50));
    enemiesInStage.add(new StrongEnemy(600, 50));
    enemiesInStage.add(new Enemy(800, 50));
    enemiesInStage.add(new Enemy(1000, 50));
    break;
  case 2:
    enemiesInStage.add(new Enemy(200, 50));
    enemiesInStage.add(new Enemy(400, 50));
    enemiesInStage.add(new StrongEnemy(600, 50));
    enemiesInStage.add(new Enemy(800, 50));
    enemiesInStage.add(new Enemy(1000, 50));

    enemiesInStage.add(new Enemy(300, 100));
    enemiesInStage.add(new Enemy(500, 100));
    enemiesInStage.add(new Enemy(700, 100));
    enemiesInStage.add(new Enemy(900, 100));
    break;
  case 3: //NEED TO ADD MORE STAGES
    enemiesInStage.add(new Enemy(100, 100));
    enemiesInStage.add(new Enemy(100, 200));
    enemiesInStage.add(new Enemy(100, 300));
    enemiesInStage.add(new StrongEnemy(100, 400));
    enemiesInStage.add(new Enemy(100, 500));
    enemiesInStage.add(new Enemy(100, 600));
    enemiesInStage.add(new Enemy(100, 700));
    break;
  case 4:
    enemiesInStage.add(new Enemy(100, 100));
    enemiesInStage.add(new Enemy(100, 200));
    enemiesInStage.add(new Enemy(100, 300));
    enemiesInStage.add(new StrongEnemy(100, 400));
    enemiesInStage.add(new Enemy(100, 500));
    enemiesInStage.add(new Enemy(100, 600));
    enemiesInStage.add(new Enemy(100, 700));

    enemiesInStage.add(new Enemy(1150, 100));
    enemiesInStage.add(new Enemy(1150, 200));
    enemiesInStage.add(new Enemy(1150, 300));
    enemiesInStage.add(new StrongEnemy(1150, 400));
    enemiesInStage.add(new Enemy(1150, 500));
    enemiesInStage.add(new Enemy(1150, 600));
    enemiesInStage.add(new Enemy(1150, 700));
    break;
  case 5:
    enemiesInStage.add(new Enemy(50, 50));
    enemiesInStage.add(new StrongEnemy(50, 100));
    enemiesInStage.add(new Enemy(100, 50));

    enemiesInStage.add(new Enemy(50, 750));
    enemiesInStage.add(new StrongEnemy(50, 700));
    enemiesInStage.add(new Enemy(100, 750));

    enemiesInStage.add(new Enemy(1150, 50));
    enemiesInStage.add(new StrongEnemy(1100, 50));
    enemiesInStage.add(new Enemy(1150, 100));

    enemiesInStage.add(new Enemy(1150, 750));
    enemiesInStage.add(new StrongEnemy(1100, 750));
    enemiesInStage.add(new Enemy(1150, 700));
    break;
  }
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
  if (key == ' ') {
    keysPressed[4] = true;
  }
  if (key == 'g') {
    godMode = !godMode;
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
  if (key == ' ') {
    keysPressed[4] = false;
  }
}

void reset() {
  player.health = 10;
  player.dead = false;
  player.xPos = 600;
  player.yPos = 600;
  enemiesInStage.clear();
  stageNumber = 0;
}

void draw() {
  if (gameState == 1) {
    background(0);
    fill(255);
    textSize(20);
    text("arrow keys to move", 20, 700);
    text("mouse to aim", 20, 740);
    text("hold spacebar to go slower and dodge better", 20, 780);
    text("welcome to", 525, 315);
    textSize(100);
    text("gaem", 450, 400);
    textSize(20);
    text("click anywhere to begin", 475, 475);
    if (stageNumber < 5) {
      if (enemiesInStage.size() == 0) {
        stageNumber++;
        setupStage(stageNumber);
      }
    }
    player.display();
    for (int i = 0; i < enemiesInStage.size(); i++) {
      if (!enemiesInStage.get(i).isDead()) {  
        enemiesInStage.get(i).display();
      }
    }
    if (mousePressed) {
      gameState = 2;
    }
  }


  if (gameState == 2) {

    if (player.isDead()) {
      gameState = 3;
    }
    //timer++;
    background(0);
    if (godMode) {
      fill(255);
      text("God Mode", 20, 760);
    }
    if (stageNumber < 5) {
      if (enemiesInStage.size() == 0) {
        stageNumber++;
        setupStage(stageNumber);
        //text("NO", 500,500);
      }
    }
    fill(255);
    textSize(25);
    text("Stage " + stageNumber, 20, 40);
    textSize(12);
    player.display();
    if (player.health > 0) {
      text("Player HP: " + player.health, 20, 780);
    }
    //text("In-game Timer: " + timer, 20, 760);
    if (player.health <= 0) {
      text("You died!", 20, 780);
    }
    for (int i = 0; i < enemiesInStage.size(); i++) {
      if (!enemiesInStage.get(i).isDead()) {  
        enemiesInStage.get(i).display();
        text("HP: " + enemiesInStage.get(i).health, enemiesInStage.get(i).xPos, enemiesInStage.get(i).yPos); //Text.
        if (enemiesInStage.get(i).health <= 0) { //Putting this here because of a weird glitch with isDead.
          enemiesInStage.remove(i);
        }
      }
    }
    circle(mouseX, mouseY, 5);
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

    player.slowMode = keysPressed[4];

    fill(255);
    //text(bulletsInStage.size(), 20, 20);
    //text(mouseX + " " + mouseY, 20, 100);
    //text(player.xPos + " " + player.yPos, 20, 120);

    player.shoot();

    for (int i = 0; i < enemiesInStage.size(); i++) {
      int enemycenterX = enemiesInStage.get(i).xPos + 15;
      int enemycenterY = enemiesInStage.get(i).yPos + 15;
      for (int j = 0; j < bulletsInStage.size(); j++) {
        Bullet temp = bulletsInStage.get(j);
        if (Math.abs(enemycenterX - temp.xpos) <= 15 && Math.abs(enemycenterY - temp.ypos) <= 15) {
          enemiesInStage.get(i).takeDamage(1);
          if (enemiesInStage.get(i).isDead()) { //testing isDead
            enemiesInStage.remove(i);
          }
          bulletsInStage.remove(temp);
        }
      }
    }


    for (int i = 0; i < enemiesInStage.size(); i++) {
      Enemy enemy = enemiesInStage.get(i);
      if (!player.isDead()) {
        enemy.shoot(player);
      }
      //text("Enemy Timer: " + enemy.countdown, 20, 760);
      enemy.randomMovement(); //random Movement...?
      print(enemy.enemyBullet.size());
      for (int j = 0; j < enemy.enemyBullet.size(); j++) {
          Bullet temp = enemy.enemyBullet.get(j);
          if (Math.abs(player.xPos - temp.xpos) <= 15 && Math.abs(player.yPos - temp.ypos) <= 15) {
            if (!godMode) {
              player.takeDamage(temp.damage);
            }
            enemy.enemyBullet.remove(temp);
          }
        }

        //if (enemy.isDead()) {
        //  enemiesInStage.remove(i);
        //}
        //enemy.shoot(player);
      }
      //print(enemiesInStage.size());
    if (gameState == 3) {
      background(0);
      fill(255, 0, 0);
      textSize(100);
      text("You Died", 375, 400);
      textSize(20);
      text("press r to start over", 500, 500);
      textSize(12);
      if (key == 'r') {
        reset();
        gameState = 1;
      }
    }
  }
}
