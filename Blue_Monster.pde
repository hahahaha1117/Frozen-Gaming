class BlueMonster {
  int x, y, speed;
  int w=48;
  int h=58;
  color tester;
  boolean alive;
  int dropIntime;



  BlueMonster(int x, int y, int s) {
    this.x = x;
    this.y = y;
    speed = s;
    alive = true;
    tester = get(playerX, playerY);
    dropIntime = 60;
  }
  void checkCollision(Player player) {
    if (alive && isHit(x, y, w, h, playerX-25, playerY-50, 34, 50)) {
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

  void display() {
    if (alive)tester = get(x+24, y+29);
    if (!alive)tester = color(0, 0, 0);
    //rect(x, y, w,h);
    if (holeColor == tester) {
      alive=false;
      monstercount1 --;
      monstercount2 --;
      monstercount3 --;
    }
    if (!alive) {
      image(blueMonster, x, y);
      dropIntime --;
      if(dropIntime==0){
        x=10000;
        y=10000;      
      }
    } else {

      image(blueMonster, x, y);
    }
  }
  void movingHorizontally(int boundaryLeft, int boundaryRight) {
    x+=speed;
    if (x<boundaryLeft || x>boundaryRight) {
      speed*=-1;
    }
  }
}