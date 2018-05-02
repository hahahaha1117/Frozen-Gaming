class WhiteMonster extends BlueMonster {

  WhiteMonster(int x, int y, int s) {
    super(x, y, s);
  }

  void display() {
    if (alive)tester = get(x+24, y+29);
    if (!alive)tester = color(0, 0, 0);
    if (holeColor == tester) {
      alive=false;
      monstercount2 --;
      monstercount3--;
    }
    if (!alive) {
      image(whiteMonster, x, y);
      dropIntime --;
      if (dropIntime==0) {
        x=10000;
        y=10000;
      }
    } else {
      int direction = (speed>0)?DOWN:UP;
      pushMatrix();
      translate(x, y);
      if (direction==DOWN) {
        image(whiteMonster, 0, 0);
      } else {
        image(monsterBack, 0, 0);
      }
      popMatrix();
    }
  }


  //movingVertically
  void movingVertically(int boundaryUp, int boundaryDown) {
    y+=speed;
    if (y>boundaryDown || y<boundaryUp) {
      speed*=-1;
    }
  }
  void checkCollision(Player player) {
    if (alive && isHit(x, y, w, h, playerX-25, playerY-50, 34, 50)) {
      int direction = (playerX-25>x)?RIGHT :LEFT;
      int direction2 = (playerY-50>y)?DOWN :UP;
      if (direction==RIGHT) {
        playerX+=50;
      } else if (direction==LEFT) {
        playerX-=50;
      } else if (direction2==DOWN) {
        playerY+=50;
      } else if (direction2==UP) {
        playerY-=50;
      }
      player.hurt();
    }
  }
}