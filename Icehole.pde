class Icehole {
  int existTime;
  PVector[] vertices ;

  void display() {
    if (holeExist ) {
      //recording array
      if (arrayRecording) {
        vertices = new PVector[endPosnum+1-startPosnum];
        for (int i = startPosnum; i<endPosnum+1; i++) {
          vertices[i-startPosnum] = new PVector(xpos[i], ypos[i]);
        }
      }
      //drawing shape
      fill(182,217,232);
      beginShape();
      for (PVector v : vertices) {
        vertex(v.x, v.y);
      }
      endShape();      
      arrayRecording = false;
      existTime --;
    }
    if (existTime == 0) {
      holeExist = false;
      existTime = 180;
      vertices = new PVector[xpos.length];
    }
  }


  Icehole() {
    existTime = 180;
    vertices = new PVector[xpos.length];
  }
}