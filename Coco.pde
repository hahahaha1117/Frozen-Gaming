class Coco extends Item {



  // Display coco
  void display() {
    if(isAlive ==true){
    image(coco, x, y);
    }
    
  }

  // Check collision with player
  void  checkCollision(Player player) {
    if (player.health < player.PLAYER_MAX_HEALTH
      && isHit(x, y, 40, 40, playerX-25, playerY-50, 34, 50)
      && isAlive == true) {
      isAlive = false;
      player.health ++;
      
      // Now that they're objects, toggle isAlive instead of throwing them away from screen
    }
  }   
  Coco(float x, float y) {
    super(x, y);
  }
}