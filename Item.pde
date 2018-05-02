class Item {
  boolean isAlive;
  float x, y;
  float w = 40;
  float h = 40;

  void display(){}
  void checkCollision(Player player){}

  Item(float x, float y){
    isAlive = true;
    this.x = x;
    this.y = y;
  }
}