class Player {
  boolean exhausted;
  int exhaustedTime; 
  int playerMovingspeed;
  color tester;
  boolean hittester;
  int monsterX, monsterY, monsterW, monsterH;
  //moving var
  int health=6;
  final int PLAYER_MAX_HEALTH =10;

  void update() {
    tester = get(playerX, playerY);
    if (tester ==  holeColor)exhausted= true;
    //exhausted timer
    if (exhausted) {      
      exhaustedTime --;
      fill(182,217,232,150);
      rect(-5,-5,660,490);
      if (exhaustedTime == 0)exhausted= false;
      if (exhaustedTime == 0)exhaustedTime=180;
    }
    //int the path
    xpos[xpos.length-1] = playerX;
    ypos[xpos.length-1] = playerY;

    for (int i= 0; i <xpos.length-1; i++) {
      xpos[i]= xpos[i+1];
      ypos[i]= ypos[i+1];
    }

    if (moving) {
      for (int i=0; i<xpos.length-1; i ++) {
    stroke(188,232,232);
    
        line(xpos[i], ypos[i], xpos[i+1], ypos[i+1]);
      }
    }
    //creating the polygon
    for (int i= 0; i <xpos.length-1; i++) {
      if (xpos[i]==playerX && ypos[i]==playerY && xpos[i+1]!=xpos[147] && ypos[i+1]!=ypos[147] ) {
        //activatethe Iceholei
        holeExist = true;
        arrayRecording = true;
        startPosnum = i;
        endPosnum = xpos.length-1;
      }
    }
  }
  
  void display() {
    PImage playerDisplay = princeDown;
    switch (gameState) {
    case GAMERUN_LEVEL1:
      if (upPress && !exhausted) {
        playerDisplay = princeUp;
        playerY=playerY-playerMovingspeed;
        moving = true;
        if (playerY<120) {
          playerY=120;
        }
      } else if (downPress && !exhausted) {
        playerDisplay = princeDown;
        playerY=playerY+playerMovingspeed;
        moving = true;
        if (playerY>460) {
          playerY=460;
        }
      } else if (leftPress && !exhausted) {
        playerDisplay = princeLeft;
        playerX=playerX-playerMovingspeed;
        moving = true;
        if (playerX<45) {
          playerX=45;
        }
      } else if (rightPress && !exhausted) {
        playerDisplay = princeRight;
        playerX=playerX+playerMovingspeed;
        moving = true;
        if (playerX>595) {
          playerX=595;
        }
      }
      image(playerDisplay, playerX-17, playerY-50);
      break;

    case GAMERUN_LEVEL2:
    
      if (upPress && !exhausted) {
        playerDisplay = princeUp;
        playerY=playerY-playerMovingspeed;
        moving = true;
        if (playerX>150 && playerX<500 && playerY<120) {
          playerY=120;
        }
        if (playerX>=30 && playerX<180 && playerY<210) {
          playerY=210;
        }
        if (playerX>460 && playerX<610 && playerY<210) {
          playerY=210;
        }
      } else if (downPress && !exhausted) {
        playerDisplay = princeDown;
        playerY=playerY+playerMovingspeed;
        moving = true;
        if (playerY>470) {
          playerY=470;
        }
      } else if (leftPress && !exhausted) {
        playerDisplay = princeLeft;
        playerX=playerX-playerMovingspeed;
        moving = true;
        if (playerX<200 && playerY <210) {
          playerX=200;
        }
        if (playerX<30) {
          playerX=30;
        }
      } else if (rightPress && !exhausted) {
        playerDisplay = princeRight;
        playerX=playerX+playerMovingspeed;
        moving = true;
        if (playerX>460 && playerY <210) {
          playerX=460;
        }
        if (playerX>610) {
          playerX=610;
        }
      }
      image(playerDisplay, playerX-17, playerY-50);
      break;
      
      case GAMERUN_LEVEL3:
   if (upPress && !exhausted) {
      playerDisplay = princeUp;
      playerY=playerY-playerMovingspeed;
      moving = true;  
      if (playerX>35 && playerX<187 && playerY<150) {
        playerY=150;
      }
      if(playerX>467 && playerX<603 && playerY<150){
        playerY=150;
      }
      if(playerX>190 && playerX<468 && playerY<115){
       playerY=115;
      }
        
    } else if (downPress && !exhausted) {
      playerDisplay = princeDown;
      playerY=playerY+playerMovingspeed;
      moving = true;
      if (playerX>35 && playerX<187 && playerY>425) {
        playerY=425;
      }
      
      if(playerX>467 && playerX<603 && playerY>425){
        playerY=425;
      }
      if (playerY>465) {
        playerY=465;
      }
    } else if (leftPress && !exhausted) {
      playerDisplay = princeLeft;
      playerX=playerX-playerMovingspeed;
      moving = true;
      if(playerX<205 && playerY<145){
       playerX=205;
      }
      
      if(playerX<205 && playerX<467 && playerY>423){
      playerX=205;
      }
      
      if (playerX<60) {
        playerX=60;
      }
    } else if (rightPress && !exhausted) {
      playerDisplay = princeRight;
      playerX=playerX+playerMovingspeed;
      moving = true;
      if(playerX>203 && playerX>465 && playerY>423){
       playerX=465;
      }
      if(playerX>203 && playerX>465 && playerY<145){
       playerX=465;
      }
      if (playerX>600) {
        playerX=600;
      }
    }
    image(playerDisplay, playerX-17, playerY-50);
    break;
    }
  }

  Player() {

    xpos = new int[150];
    ypos = new int[150];
    for (int i = 0; i<xpos.length-1; i++) {
      xpos[i]=width/2;
      ypos[i]=height/2;
    }
    playerX=width/2;
    playerY=height/2;
    playerMovingspeed = 5;
    exhausted = false;
    exhaustedTime = 180;
    tester = get(playerX, playerY);
    health=6;
  }



  void hurt() {


    health --;
  }
}