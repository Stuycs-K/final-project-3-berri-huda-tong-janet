public class Stick {
  private float numForce;
  private PVector position;
  private Ball cueBall;
  private boolean visible;

  //before we implement the drag for the force of the stick gna set it as like
  
  Stick(Ball cb) {
    numForce = 3.5;
    cueBall = cb;
    position = new PVector(100, 100);
    visible = false;
    //position = newPVector(cb.getPosition().x, cb.getPosition().y);
    //cueBall = new Ball(10, 10, 1, 1);
    //position = new PVector(120, 120);
    //cueBall = new Ball(120 + 10, 120+5, 0, 0);
    //is direction not just the dierction of the ball...
  }
  
  void setVis(boolean b){
    visible = b;
  }

  void setPos( int x, int y){
    position = new PVector(x, y);
  }
  
  PVector calculateAcceleration(){
    PVector direction = PVector.sub(cueBall.getPosition(), position);
    direction.normalize();
    PVector acceleration = direction.mult(numForce / cueBall.getMass());
    return acceleration;
  }
  
  void display(){
    if (!visible){return;}
    updatePos();
    PVector pos = cueBall.getPosition();
    PVector dir = PVector.sub(pos, position);
    float angle = atan2(dir.y, dir.x);
    //float angle = PVector.angleBetween(new PVector(1,0), dir);
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle);
    noStroke();
    fill(255,191,128);
    rect(-200, -7.5, 200, 15);  
    
    //lines 
    
    
    
    popMatrix();
  }
  
  void hit(){
  PVector accel = calculateAcceleration();
  cueBall.move(accel);
  }
  
  boolean getVis(){
  return visible;
  }
  
  void updatePos(){
    PVector mousePos = new PVector(mouseX, mouseY);
    PVector dir =PVector.sub(mousePos, cueBall.getPosition());
    float angle = atan2(dir.y, dir.x);
    position.set(cueBall.getPosition().x - 50 * cos(angle), cueBall.getPosition().y - 50* sin(angle));
 
  
  //position = new PVector(mouseX, mouseY);
  }
}
