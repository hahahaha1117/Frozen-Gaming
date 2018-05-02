class BigMonster{
int x,y,w,h,speed;
float monsterCountFrame;
boolean footChange=true;
boolean alive;
int dropIntime;
int monsterLife = 3;
boolean freeze;
int freezeTime ;

boolean allowHit=true;

color tester;
int direction = (speed>0)? RIGHT :LEFT;

BigMonster(){
x = width/2;
y = height/2+50;
w = 70;
h = 70;
speed = 1;
freeze= false;
freezeTime = 120; 
}
void displayImage(){
  
      PImage monsterDisplay = (footChange) ? bigMonsters[0]:bigMonsters[1];
      monsterCountFrame++;
      if(monsterCountFrame%20==0 && !freeze){
      footChange = !footChange;
      } else if (freeze){
        //image(bmd,x,y,70,70);
      }
      
      
      pushMatrix();
      translate(x,y);
      int direction = (speed>0)?RIGHT :LEFT;
    
      if(direction==RIGHT){
        scale(1,1);
        image(monsterDisplay,0,0);
        
      }else {
        scale(-1,1);
        image(monsterDisplay,-70,0);
      }
      
      popMatrix();
  }
  
  void display() {
    if(monsterLife !=0){
    displayImage();
    }
    if (!freeze)tester = get(x+35, y+70);
    //if (monsterLife==0)tester = color(0, 0, 0);
    //rect(x, y, w,h);
    if (holeColor == tester) {
      //alive=false;
      /*monstercount1 --;
      monstercount2 --;*/ 
      monsterLife--;
      freeze = true;
      tester =  color(0, 0, 0);
    }
    if(freeze && monsterLife != 0){
      speed = 0 ;
      freezeTime --;
    }
    if(freezeTime == 0 ){
      freeze = false;
      speed = 1 ;
      freezeTime = 120;
    }
    if (monsterLife==0  ) {
      image(bmd,x,y,70,70);
      allowHit=false;
      dropIntime --;
    }
  }
  
   void checkCollision(Player player) {
    if(allowHit==true){
    if ( isHit(x, y, w, h, playerX-25, playerY-50, 34, 50)) {
      int direction = (playerX-25>x)?RIGHT :LEFT;
      int direction2 = (playerY-50>y)?DOWN :UP;
      if (direction==RIGHT) {
        playerX+=20;
      } else if (direction==LEFT) {
        playerX-=20;
      } else if (direction2==DOWN) {
        playerY+=20;
      } else if (direction2==UP) {
        playerY-=20;
      }
      player.hurt();
     }
    }
  }
  
void moving(){
    if((x<playerX && speed>0 && playerY-50>y && playerY-50<y+70)||(x>playerX && speed<0 && playerY-50>y && playerY-50<y+70)){
      float currentSpeed = speed;
      currentSpeed *= 5;
      x += currentSpeed;
    } else{
    x += speed;
    if(x<40 || x>600-w){
      speed *= -1;
    }
    }
   }
void hurt(){
 monsterLife--;
}
}