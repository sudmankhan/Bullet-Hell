int stageNumber;
ArrayList<Enemy> enemiesInStage;
//ArrayList<ScatterEnemy> scatterEnemiesInStage;
ArrayList<Bullet> bulletsInStage;
ArrayList<Bullet> enemyBulletsInStage;
Player player;
boolean[] keysPressed;
boolean mouseHeld;
int timer = 0;
color playerC;
//color enemyC;
int gameState;
boolean godMode;
Boss boss;
int shootrng = 0;
boolean healthCollected = false;
boolean damageCollected = false;
int skipStageCountdown;
int keyCountdown;
boolean canSkip;
int timeBetweenStages;
int textx;
int poweruprng = 0;
int extraDamage;

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
  godMode = false; //Godmode
  boss = new Boss(550, 75);
  skipStageCountdown = 0;
  canSkip = false;
  keyCountdown = 0;
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
  case 1: //TESTING
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
  if (key == 'q') {
    canSkip = true;
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
  healthCollected = false;
  timer = 0;
  canSkip = false;
  boss.health = 250;
  boss.dead = false;
  boss.phaseCountdown = 100;
}

void draw() {
  //println(stageNumber);
  timer++;
  shootrng = (int) (Math.random() * 2); //Picks random integer 0 or 1
  if (gameState == 1) {
    background(0);
    fill(255);
    textSize(20);
    text("arrow keys to move", 20, 700);
    text("mouse to aim", 20, 740);
    text("hold spacebar to go slower and dodge better", 20, 780);
    text("press c to see cheat menu", 20, 660);
    text("welcome to", 525, 315);
    textSize(100);
    text("gaem", 450, 400);
    textSize(20);
    text("click anywhere to begin", 475, 475);

    //If the state number is less than 5 and there are no more enemies in a stage, increase the stageNumber and setup the next stage.
    if (stageNumber < 5) { 
      if (enemiesInStage.size() == 0) {
        stageNumber++;
        setupStage(stageNumber);
      }
    }

    //Display the enemies that aren't dead and display the player
    player.display();
    for (int i = 0; i < enemiesInStage.size(); i++) {
      if (!enemiesInStage.get(i).isDead()) {  
        enemiesInStage.get(i).display();
      }
    }
    if (mousePressed) {
      gameState = 2;
    }
    if (key == 'c') {
      gameState = 6;
    }
  }
  //Start the game. If the player dies, switch game state to 3.
  if (gameState == 2) {
    if (player.isDead()) {
      //System.out.println("You die instantly"); //Debug code.
      gameState = 3;
    }

    //timer++;
    background(0);
    if (godMode) {
      fill(255);
      textSize(20);
      text("God Mode", 1080, 760);
    }
    if (stageNumber <= 5) {
      if (enemiesInStage.size() == 0) {
        gameState = 4;
        //text("stage" + stageNumber+1,400,600);
        //delay(500);
        //text("stage" + stageNumber+1,400,600);
        //stageNumber++;
        //setupStage(stageNumber);
        //text("NO", 500,500);
      }
      if (canSkip && skipStageCountdown == 0) {
        enemiesInStage.clear();
        stageNumber++;
        setupStage(stageNumber);
        skipStageCountdown += 10;
        canSkip = false;
      } else if (skipStageCountdown > 0) {
        skipStageCountdown -= 1;
      }
    }
    fill(255);
    textSize(25);
    text("Stage " + stageNumber, 20, 40);
    textSize(12);
    player.display();

    //Health and Health Packs and Damage Boosts
    if (player.health > 0) {
      text("Player HP: " + player.health, 20, 780);
      text("Timer: " + timer, 20, 740);
      text("Seconds till next pack: " + (60 - (timer / 60) % 60), 20, 760); //Health pack timer. 1 every 60 seconds.
      text("Damage Boost: " + extraDamage, 20, 720);
    }
    poweruprng = (int) (Math.random() * 1); //Picks random integer 0, 1, 2, 3, ..., 3600. Set to  * 60 for testing. Must change it back to * 3600 later.
    //there is a 1/3600 chance the powerup spawns per frame so it statistically spawns about once every minute.
    DamageBoost boost = new DamageBoost(300, 375, (int) Math.random() * 2 + 1); //1 or 2
    HealthPack health = new HealthPack(575, 375);
    if (poweruprng == 0) { //DAMAGE BOOST DROPPED 1/5 OF THE TIME (currently 1/1)
      boost.avaliable = true;
      health.avaliable = false;
    }
    if (boost.avaliable && !damageCollected) {
      boost.display();
    }
    if (player.xPos >= boost.x && player.xPos <= boost.x + 50 && player.yPos >= boost.y && player.yPos <= boost.y + 50 && !damageCollected) {
      extraDamage += boost.addedDamage;
      damageCollected = true;
    }
    if (timer % 3600 == 0) {
      healthCollected = false;
    }
    if (((timer / 60) % 60) <= 5) {
      health.avaliable = true;
      boost.avaliable = false;
      damageCollected = false;
      extraDamage = 0;
      //healthCollected = false;
    }
    if (player.xPos >= health.x && player.xPos <= health.x + 50 && player.yPos >= health.y && player.yPos <= health.y + 50 && !healthCollected) {
      player.health++;
      healthCollected = true;
      boost.avaliable = true;
    }
    if (health.avaliable && !healthCollected) {
      boost.avaliable = false;
      health.display();
    }
    if (player.health <= 0) {
      text("You died!", 20, 780);
      player.dead = true;
    }

    //Enemies
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

      //So long as the player isn't dead, shoot it.
      if (!player.isDead()) {
        //if (shootrng == 0) {
        enemy.shoot(player);
        //}
        //if (shootrng == 1) {
        //enemy.shootHoming(player);
        //System.out.println("SHOOTING HOMING");
        //}
      }
      //text("Enemy Timer: " + enemy.countdown, 20, 760);
      enemy.randomMovement(); //random Movement...?
      //print(enemy.enemyBullet.size());
      for (int j = 0; j < enemy.enemyBullet.size(); j++) {
        Bullet temp = enemy.enemyBullet.get(j);
        if (Math.abs(player.xPos - temp.xpos) <= 15 && Math.abs(player.yPos - temp.ypos) <= 15) {
          if (!godMode) {
            player.takeDamage(temp.damage);
          }
          enemy.enemyBullet.remove(temp);
        }
      }
    }

    //for (int i = 0; i < scatterEnemiesInStage.size(); i++) {
    //  Enemy enemy = scatterEnemiesInStage.get(i);

    //  //So long as the player isn't dead, shoot it.
    //  if (!player.isDead()) {
    //    //if (shootrng == 0) {
    //    enemy.shoot(player);
    //    //}
    //    //if (shootrng == 1) {
    //    //enemy.shootHoming(player);
    //    //System.out.println("SHOOTING HOMING");
    //    //}
    //  }
    //  //text("Enemy Timer: " + enemy.countdown, 20, 760);
    //  enemy.randomMovement(); //random Movement...?
    //  //print(enemy.enemyBullet.size());
    //  for (int j = 0; j < enemy.enemyBullet.size(); j++) {
    //    Bullet temp = enemy.enemyBullet.get(j);
    //    if (Math.abs(player.xPos - temp.xpos) <= 15 && Math.abs(player.yPos - temp.ypos) <= 15) {
    //      if (!godMode) {
    //        player.takeDamage(temp.damage);
    //      }
    //      enemy.enemyBullet.remove(temp);
    //    }
    //  }
    //}

    if (stageNumber == 6) {
      if (!boss.isDead()) {
        if (key == 'b' && boss.health > 125) {
          boss.health = 125;
        }
        boss.phaseCountdown--;
        boss.display();
        if (boss.health == 125 && boss.shieldHealth != 0) { 
          boss.shieldOn = true;
        }
        if (boss.shieldHealth <= 0) {
          boss.shieldOn = false;
        }
        float hel = boss.health * (1160.0/boss.maxHealth);
        boss.displayHealthBar(hel);
        fill(255);
        if (boss.phaseCountdown > 0) {
          boss.shootCircle();
        } else {
          boss.shootSpiral();
          if (enemiesInStage.size() < 10) {
            boss.summonMinion();
          }
        }
        for (int j = 0; j < bulletsInStage.size(); j++) {
          int enemycenterX = boss.xPos + 25;
          int enemycenterY = boss.yPos + 20;
          Bullet temp = bulletsInStage.get(j);
          if (Math.abs(enemycenterX - temp.xpos) <= 25 && Math.abs(enemycenterY - temp.ypos) <= 20) {
            if (boss.shieldOn) {
              boss.shieldHealth--;
            } else {
              boss.takeDamage(1);
            }
            //if (enemiesInStage.get(i).isDead()) { //testing isDead
            //  enemiesInStage.remove(i);
            //}
            bulletsInStage.remove(temp);
          }
        }
        for (int j = 0; j < boss.enemyBullet.size(); j++) {
          Bullet temp = boss.enemyBullet.get(j);
          if (Math.abs(player.xPos - temp.xpos) <= 15 && Math.abs(player.yPos - temp.ypos) <= 15) {
            if (!godMode) {
              player.takeDamage(1);
            }
            boss.enemyBullet.remove(temp);
          }
        }
      } else {
        gameState = 5;
      }
    }
  }


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

  if (gameState == 4) {
    background(0);
    textSize(25);
    //alpha += 50;
    fill(255);
    if (stageNumber == 5) {
      fill(255, 0, 0);
      textSize(100);
      text("Boss", textx, 400);
      fill(255);
    } else {
      text("Stage " + (stageNumber + 1), textx, 400);
    }
    textx += 5;
    textSize(12);
    player.display();
    bulletsInStage.clear();
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
    if (timeBetweenStages == 0) {
      timeBetweenStages += 250;
    } else {
      timeBetweenStages -= 1;
    }
    if (timeBetweenStages == 0) {
      stageNumber += 1;
      setupStage(stageNumber);
      gameState = 2;
      textx = 0;
    }
  }

  if (gameState == 5) {
    background(255);
    fill(0);
    textSize(100);
    text("You Won!", 375, 400);
    textSize(20);
    text("press r to play again", 500, 500);
    textSize(12);
    if (key == 'r') {
      reset();
      gameState = 1;
    }
  }

  if (gameState == 6) {
    background(255);
    fill(0);
    textSize(25);
    text("g: god mode", 450, 350);
    text("q: skip stage", 450, 400);
    text("b: deplete half of boss health", 450, 450);
    text("z: go back", 450, 500);
    if (key == 'z') {
      gameState = 1;
    }
    textSize(12);
  }
  //timeBetweenStages -= 1;
}
