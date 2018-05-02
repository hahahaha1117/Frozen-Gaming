import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
PImage bg,intro, gameStart, gameOver, gameWin, start, startHovered, restart, restartHovered;
PImage rst,rsthover;
PImage pool1, pool2, pool3;
PImage piller, flake, clock;
PImage banner1, banner2, banner3, bannerSuc;
PImage blueMonster, whiteMonster;
PImage monsterBack, bmd;
PImage princeLife, blood, bbase,bml,mblood;
PImage coco;
PFont font;
PImage [] bigMonsters = new PImage[2];

final int GAME_START = 0, GAME_INTRO = 8;
final int GAMERUN_LEVEL1 = 1, GAMERUN_LEVEL1_RESTART = 2;
final int GAMERUN_LEVEL2 = 3, GAMERUN_LEVEL2_RESTART = 4;
final int GAMERUN_LEVEL3 = 5, GAMERUN_LEVEL3_RESTART = 6, GAME_WIN = 7;
final int GAME_INIT_TIMER = 3600;
int gameTimer = GAME_INIT_TIMER;
int gameState = 0;

final int START_BUTTON_WIDTH = 200;
final int START_BUTTON_HEIGHT = 100;
final int START_BUTTON_X = 220;
final int START_BUTTON_Y = 330;

int bannerX, bannerY , bannerSucX;
boolean bannerXpos;
//inital player pos 

float playerW=50;
float playerH=50;

//inital player pos 
int playerX, playerY;
//turn position's  array 
int[] xpos;
; 
int[] ypos;
//icehole use
boolean holeExist = false;
boolean arrayRecording = false;
//icehole start pos
int startPosnum;
//icehole end pos
int endPosnum;
//moving pic
PImage princeUp, princeLeft, princeRight, princeDown;
//moving boolean
boolean upPress=false, downPress=false, leftPress=false, rightPress=false;
//timecounter
int time=7200;
//
boolean moving;
//
int winningPausetime = 120;
//
final color holeColor = color(182, 217, 232);
int monstercount1 = 2 ;
int monstercount2 =4;
int monstercount3 = 2;






boolean isHit(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh) {
  if (ax+aw>bx&&// r1 right edge past r2 left
    ax<bx+bw&&
    ay<by+bh&&
    ay+ah>by) {
    return true;
  } else
    return false;
}
Player player;
Icehole icehole;
BlueMonster monster1;
BlueMonster monster2;
BlueMonster monster3;
BlueMonster monster4;
BlueMonster monster7;
WhiteMonster monster5;
WhiteMonster monster6;
WhiteMonster monster8;


BigMonster bigMonster;
Coco hotcoco1;
Coco hotcoco2;
Coco hotcoco3;
Coco hotcoco4;
Coco hotcoco5;
Coco hotcoco6;
//round3
Coco hotcoco7;
Coco hotcoco8;
Coco hotcoco9;
Coco hotcoco10;
Coco hotcoco11;

Clock clock1;
Clock clock2;
Clock clock3;
//round3
Clock clock4;
Clock clock5;
Clock clock6;

Minim minim;
AudioPlayer song;
void setup() {
  size(640, 480, P2D);
  minim=new Minim(this);
  song=minim.loadFile("Love Is an Open Door.mp3");
  song.play();
  song.loop();

  bg = loadImage("img/bg.png");
  intro = loadImage("img/intro.png");
  gameStart= loadImage("img/gamestart.png");
  gameOver=loadImage("img/gameover.png");
  gameWin=loadImage("img/gamewin.png");
  start=loadImage("img/start.png");
  startHovered=loadImage("img/starthovered.png");
  restart=loadImage("img/restart.png");
  restartHovered=loadImage("img/restarthovered.png");
  rst = loadImage("img/rst.png");
  rsthover = loadImage("img/rsthover.png");
  pool1=loadImage("img/pool1.png");
  pool2=loadImage("img/pool2.png");
  pool3=loadImage("img/pool3.png");
  piller=loadImage("img/piller.png");
  clock=loadImage("img/clock.png");
  flake=loadImage("img/flake.png");
  banner1=loadImage("img/banner1.png");
  banner2=loadImage("img/banner2.png");  
  banner3=loadImage("img/banner3.png");
  bannerSuc=loadImage("img/success.png");
  blueMonster = loadImage("img/monster2.png");
  whiteMonster = loadImage("img/monster1.png");
  monsterBack = loadImage("img/monsterback.png");
  bmd = loadImage("img/bmd.png");
  coco = loadImage("img/coco.png");

  princeUp = loadImage("img/princeback.png");
  princeLeft = loadImage("img/princeleft.png");
  princeRight = loadImage("img/princeright.png");
  princeDown = loadImage("img/prince.png");
  princeLife = loadImage("img/princelife.png");
  blood =  loadImage("img/blood.png");
  bbase = loadImage("img/bbase.png");
  bml = loadImage("img/bml.png");
  mblood = loadImage("img/mblood.png");
  for(int i=0; i<2 ; i++){
    bigMonsters[i] =loadImage("img/bigMonsterRight"+i+".png");
  }
  

  player = new Player();
  icehole = new Icehole();

  monster1 = new BlueMonster(70, 210, 1);
  monster2 = new BlueMonster(510, 210, 1);
  monster3 = new BlueMonster(50, 300, 1);
  monster4 = new BlueMonster(530, 270, 1);  
  monster5 = new WhiteMonster(230, 120, 1);
  monster6= new WhiteMonster(390, 250, 1);
  monster7 = new BlueMonster(510, 210, 1);
  monster8 = new WhiteMonster(220, 120, 1);
  bigMonster = new BigMonster();  
  
  hotcoco1 = new Coco(80, 120);
  hotcoco2 = new Coco(530,400);
  hotcoco3 = new Coco(80, 400);
  hotcoco4 = new Coco(80,190);
  hotcoco5 = new Coco(530,190);
  hotcoco6 = new Coco(80, 120);
  //round3
  hotcoco7 = new Coco(530,360);
  hotcoco8 = new Coco(70, 360);
  hotcoco9 = new Coco(70,210);
  hotcoco10 = new Coco(530,190);
  hotcoco11 = new Coco(400,110);
  //clock
  clock1= new Clock(300, 240);
  clock2= new Clock(300, 100);
  clock3= new Clock(300, 400);
  //round3
  clock4= new Clock(300, 240);
  clock5= new Clock(130, 150);
  clock6= new Clock(300, 400);
  //monster3 = new Monsters("img/monster1.png",50,210,1);
  font = createFont("font/font.ttf", 36);
  textFont(font);
  gameTimer = GAME_INIT_TIMER;
}

void draw() {
  //background
  image(bg, 0, 0);



  switch (gameState) {

  case GAME_START: // Start Screen
    image(gameStart, 0, 0);
    if (START_BUTTON_X + START_BUTTON_WIDTH > mouseX
      && START_BUTTON_X < mouseX
      && START_BUTTON_Y + START_BUTTON_HEIGHT > mouseY
      && START_BUTTON_Y < mouseY) {

      image(startHovered, START_BUTTON_X, START_BUTTON_Y);
      if (mousePressed) {
        gameState = GAME_INTRO;
        mousePressed = false;
      }
    } else {

      image(start, START_BUTTON_X, START_BUTTON_Y);
    }
    break;

  case GAME_INTRO:
  image(intro, 0, 0);  
  if (START_BUTTON_X + START_BUTTON_WIDTH > mouseX
      && START_BUTTON_X < mouseX
      && START_BUTTON_Y+50 + START_BUTTON_HEIGHT > mouseY
      && START_BUTTON_Y+50 < mouseY) {

      image(rsthover, START_BUTTON_X, START_BUTTON_Y+50);
      if (mousePressed) {
        gameState = GAMERUN_LEVEL1;
        mousePressed = false;
      }
    } else {

      image(rst, START_BUTTON_X, START_BUTTON_Y+50);
    }
    break;
  
  case GAMERUN_LEVEL1:

    //time
    fill(0);
    text("TIME", 52, 47);
    drawTimerUI();
    gameTimer--;


    //level1 pool
    image(pool1, 20, 85);
    //icehole display
    icehole.display();
    //monster1
    if (monster1.alive)monster1.movingHorizontally(70, 170);
    monster1.display();
    if (monster2.alive)monster2.movingHorizontally(410, 510);
    monster2.display();  


    //prince
    player.update();
    player.display();


    //collisioncheck
    monster1.checkCollision(player);
    monster2.checkCollision(player);

    if (player.health<=0) {
      gameState = GAMERUN_LEVEL1_RESTART;
    }

    //health
    image(bbase, 39, 49, 261, 23);
    for (int i=0; i<player.health; i++) { 
      image(blood, 45+i*25, 52);
    };
      image(princeLife, 10, 35);
      
    
    if (gameTimer<=0) {
      gameState=GAMERUN_LEVEL1_RESTART;
    }
    if (monstercount1 == 0) {
      if (winningPausetime==120)
      bannerSucX= 0;
      player.exhausted=true;
      image(bannerSuc, bannerSucX, 150);
      bannerSucX+=4;
      winningPausetime --;
      if (winningPausetime == 0) {
        gameTimer=3600;
        gameState=GAMERUN_LEVEL2;
        bannerX=0;
        initplayer();
        initicehole();          
        monstercount2 = 4;
        winningPausetime= 120;
      }
    }
    //item
    hotcoco1.display();
    hotcoco2.display();
    
    hotcoco1.checkCollision(player);
    hotcoco2.checkCollision(player);
    
    
    //clock
    clock1.display();
    clock1.checkCollision(player);


    //level1 banner
    image(banner1, bannerX, 150);
    bannerX+=4;
    
    break;

  case GAMERUN_LEVEL1_RESTART:
    gameTimer=3600;
    //reset health,time and monster
    player.health=6;
    //health
    image(bbase, 39, 49, 261, 23);
    for (int i=0; i<player.health; i++) { 
      image(blood, 45+i*25, 52);
    };
      image(princeLife, 10, 35);
    image(gameOver, 0, 0);
    if (START_BUTTON_X + START_BUTTON_WIDTH > mouseX
      && START_BUTTON_X < mouseX
      && START_BUTTON_Y + START_BUTTON_HEIGHT > mouseY
      && START_BUTTON_Y < mouseY) {

      image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
      if (mousePressed) {
        bannerX=0;
        initplayer();
        initicehole();
        monstercount1 = 2;
        gameTimer = 3600;
        monster1.alive = true;
        monster1.x = 70;
        monster1.y = 210;
        monster2.alive = true;
        monster2.x = 510;
        monster2.y = 210;
        gameState = GAMERUN_LEVEL1;
        hotcoco1.isAlive = true;
        hotcoco2.isAlive = true;
        clock1.isAlive = true;

        mousePressed = false;
      }
    } else {

      image(restart, START_BUTTON_X, START_BUTTON_Y);
    }
    println (monster1.alive);


    break;

  case GAMERUN_LEVEL2:
    //time
    fill(0);
    text("TIME", 52, 47);
    drawTimerUI();
    gameTimer--;

    //level2 pool
    image(pool2, 20, 85);
    
    //icehole
    icehole.display();

    //prince
    player.update();
    player.display();
    
    //monster
    if (monster3.alive)monster3.movingHorizontally(50, 150);
    monster3.display();
    if (monster4.alive)monster4.movingHorizontally(430, 530);
    monster4.display(); 
    if (monster5.alive)monster5.movingVertically(110, height-70);
    monster5.display();
    if (monster6.alive)monster6.movingVertically(110, height-70);
    monster6.display();


    //health
    image(bbase, 39, 49, 261, 23);
    for (int i=0; i<player.health; i++) { 
      image(blood, 45+i*25, 52);
    };
      image(princeLife, 10, 35);
    if (gameTimer<=0) {
      gameState=GAMERUN_LEVEL2_RESTART;
    }
 
        if (monstercount2 == 0) {
      if (winningPausetime==120)
      
      bannerSucX=0;
      player.exhausted=true;
      image(bannerSuc, bannerSucX, 150);
      bannerSucX+=4;
      winningPausetime --;
      if (winningPausetime == 0) {
        gameTimer=3600;
        gameState=GAMERUN_LEVEL3;
        bannerX=0;
        initplayer();
        initicehole();
        monstercount3 = 2;
        winningPausetime= 120;
      }
    }
       
    println(player.health);
    //collisioncheck
    monster3.checkCollision(player);
    monster4.checkCollision(player);
    monster5.checkCollision(player);
    monster6.checkCollision(player);


    if (player.health<=0) {
      gameState = GAMERUN_LEVEL2_RESTART;
    }

    //item
    hotcoco2.display();
    hotcoco3.display();
    hotcoco4.display();
    hotcoco5.display();
    
    hotcoco2.checkCollision(player);
    hotcoco3.checkCollision(player);
    hotcoco4.checkCollision(player);
    hotcoco5.checkCollision(player);
    
    clock2.display();
    clock2.checkCollision(player);
    clock3.display();
    clock3.checkCollision(player);



    //level2 banner
    image(banner2, bannerX, 150);
    bannerX+=4;
    break;


  case GAMERUN_LEVEL2_RESTART:

    image(gameOver, 0, 0);
    if (START_BUTTON_X + START_BUTTON_WIDTH > mouseX
      && START_BUTTON_X < mouseX
      && START_BUTTON_Y + START_BUTTON_HEIGHT > mouseY
      && START_BUTTON_Y < mouseY) {

      image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
      if (mousePressed) {
        gameState = GAMERUN_LEVEL2;
     //health
    image(bbase, 39, 49, 261, 23);
    for (int i=0; i<player.health; i++) { 
      image(blood, 45+i*25, 52);
    };
      image(princeLife, 10, 35);
        bannerX=0;
        initplayer();
        initicehole();
        gameTimer = 3600;
        monster3.alive = true;
        monster4.alive = true;
        monster5.alive = true;
        monster6.alive = true;
        monster3.x=50;
        monster3.y=300;
        monster4.x = 530;
        monster4.y= 270;  
        monster5.x= 240;
        monster5.y= 120;
        monster6.x = 390;
        monster6.y = 250;
        hotcoco2.isAlive = true;
        hotcoco3.isAlive = true;
        hotcoco4.isAlive = true;
        hotcoco5.isAlive = true;
        clock2.isAlive = true;
        clock3.isAlive = true;
        monster3.dropIntime = 120;
        monster4.dropIntime = 120;
        monster5.dropIntime = 120;
        monster6.dropIntime = 120;
        monstercount2 = 4;
        mousePressed = false;
      }
    } else {

      image(restart, START_BUTTON_X, START_BUTTON_Y);
    }
    break;

  case GAMERUN_LEVEL3:
    //time
    fill(0);
    text("TIME", 52, 47);
    drawTimerUI();
    gameTimer--;
    
    //level3 pool
    image(pool3, 20, 85);

    //icehole
    icehole.display();
    
    //prince
    player.update();
    player.display();
    
    //bigmonster
    bigMonster.moving();
    bigMonster.display();
    bigMonster.checkCollision(player);
    
    //bigmonsterhealth
    image(bbase, 520, 443, 85, 23);
   for (int i=0; i<bigMonster.monsterLife; i++) { 
    image(mblood, 526+i*25, 446);
    };
    image(bml,490,430);
    
    //monsters
    if (monster7.alive)monster7.movingHorizontally(350, 510);
    monster7.display();  
    if (monster8.alive)monster8.movingVertically(110, height/2-15);
    monster8.display();
    
    
    //health
    image(bbase, 39, 49, 261, 23);
   for (int i=0; i<player.health; i++) { 
      image(blood, 45+i*25, 52);
    };
      image(princeLife, 10, 35);
      

    
    
    
    if (gameTimer<=0) {
      gameState=GAMERUN_LEVEL3_RESTART;
    }
    if (monstercount3 <= 0 && bigMonster.monsterLife ==0) {
      if (winningPausetime==120)
      player.exhausted=true;
      winningPausetime --;
      if (winningPausetime == 0) {
        gameState=GAME_WIN;
        
        
      }
    }
    
    //cpllisioncheck
    monster7.checkCollision(player);
    monster8.checkCollision(player);
    
    if (player.health<=0) {
      gameState = GAMERUN_LEVEL3_RESTART;
    }
    
    //hotcoco
    hotcoco7.display();
    hotcoco8.display();
    hotcoco9.display();
    hotcoco10.display();
    hotcoco11.display();
    
    hotcoco7.checkCollision(player);
    hotcoco8.checkCollision(player);
    hotcoco9.checkCollision(player);
    hotcoco10.checkCollision(player);
    hotcoco11.checkCollision(player);
    
    //clock
    clock4.display();
    clock5.display();
    clock6.display();
    
    clock6.checkCollision(player);
    clock4.checkCollision(player);
    clock5.checkCollision(player);
    
    //level3 banner
    image(banner3, bannerX, 150);
    bannerX+=4;

    break;    

  case GAMERUN_LEVEL3_RESTART:
  
    for (int i=0; i<player.health; i++) { 
      image(blood, 45+i*25, 52);
    };
    if (gameTimer<=0) {
      gameState=GAMERUN_LEVEL3_RESTART;
    }
    image(gameOver, 0, 0);
    if (START_BUTTON_X + START_BUTTON_WIDTH > mouseX
      && START_BUTTON_X < mouseX
      && START_BUTTON_Y + START_BUTTON_HEIGHT > mouseY
      && START_BUTTON_Y < mouseY) {

      image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
      if (mousePressed) {
        gameState = GAMERUN_LEVEL3;
            //health
       image(bbase, 39, 49, 261, 23);
      for (int i=0; i<player.health; i++) { 
      image(blood, 45+i*25, 52);
       };
      image(princeLife, 10, 35);
      //bigmonsterhealth
      image(bbase, 520, 443, 85, 23);
      for (int i=0; i<bigMonster.monsterLife; i++) { 
      image(mblood, 526+i*25, 446);
      };
        bigMonster.display();
        bigMonster.moving();
        gameTimer = 3600;
        monster7.alive = true;
        monster8.alive = true;
        bigMonster.alive = false;
        bigMonster.monsterLife = 3;
        
        monster7.x=510;
        monster7.y=210;
        monster8.x = 220;
        monster8.y= 120;  
        bigMonster.x =width/2;
        bigMonster.y =height/2+50;
        hotcoco7.isAlive = true;
        hotcoco8.isAlive = true;
        hotcoco9.isAlive = true;
        hotcoco10.isAlive = true;
        hotcoco11.isAlive = true;
        clock4.isAlive = true;
        clock5.isAlive = true;
        clock6.isAlive = true;
        monster7.dropIntime = 120;
        monster8.dropIntime = 120;
        bigMonster.dropIntime = 120;
        monstercount3 = 2;
        bannerX=0;
        initplayer();
        initicehole();
        mousePressed = false;
        
      }
    } else {

      image(restart, START_BUTTON_X, START_BUTTON_Y);
    }
    break;

  case GAME_WIN:
    image(gameWin, 0, 0);
    if (START_BUTTON_X + START_BUTTON_WIDTH > mouseX
      && START_BUTTON_X < mouseX
      && START_BUTTON_Y + START_BUTTON_HEIGHT > mouseY
      && START_BUTTON_Y < mouseY) {

      image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
      if (mousePressed) {
        gameState = GAME_START;
         bannerX=0;
        initplayer();
        initicehole();
        monstercount1 = 2;
        gameTimer = 3600;
        monster1.alive = true;
        monster1.x = 70;
        monster1.y = 210;
        monster2.alive = true;
        monster2.x = 510;
        monster2.y = 210;
        gameState = GAMERUN_LEVEL1;
        hotcoco1.isAlive = true;
        hotcoco2.isAlive = true;
        clock1.isAlive = true;

        mousePressed = false;
      }
    } else {

      image(restart, START_BUTTON_X, START_BUTTON_Y);
    }
    break;
  }
}
void drawTimerUI() {
  String timeString = convertFramesToTimeString(60); //  // Requirement #4: Get the mm:ss string using String convertFramesToTimeString(int frames)

  textAlign(LEFT, BOTTOM);

  // Time Text Shadow Effect - You don't have to change this!
  fill(#ececec);
  text(timeString, 124, 48);


  // Actual Time Text
  color timeTextColor =#21406d ;     // Requirement #5: Get the correct color using color getTimeTextColor(int frames)
  fill(timeTextColor);
  text(timeString, 122, 47);
}
String convertFramesToTimeString(int frames) {  // Requirement #4

  int second = int(gameTimer/frames);

  String sec = nf(second, 2);
  return sec;
}
void addTime(float seconds) { 
  gameTimer += 60*seconds; 
  // Requirement #2
}
color getTimeTextColor(int frames) {        // Requirement #5
  return #ffffff;
}

void initplayer() {
  xpos = new int[150];
  ypos = new int[150];
  playerX=width/2;
  playerY=height/2;
  for (int i = 0; i<xpos.length-1; i++) {
    xpos[i]=width/2;
    ypos[i]=height/2;
  }

  player.health=6;
}
void initicehole() {
  icehole.vertices = new PVector[xpos.length];
  holeExist = false;
}

void keyPressed() {
  if (key==CODED);
  switch(keyCode) {
  case UP:
    upPress=true;
    break;
  case DOWN:
    downPress=true;
    break;
  case LEFT:
    leftPress=true;
    break;
  case RIGHT:
    rightPress=true;
    break;
  }
}

void keyReleased() {
  if (key==CODED);
  switch(keyCode) {
  case UP:
    upPress=false;
    break;
  case DOWN:
    downPress=false;
    break;
  case LEFT:
    leftPress=false;
    break;
  case RIGHT:
    rightPress=false;
    break;
  }
}