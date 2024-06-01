public class Stick {
  private float numForce;
  private PVector position;
  private Ball cueBall;

  //before we implement the drag for the force of the stick gna set it as like
  
  Stick(Ball cb) {
    numForce = 24.0;
    cueBall = cb;
    position = new PVector(100, 100);
    //position = newPVector(cb.getPosition().x, cb.getPosition().y);
    //cueBall = new Ball(10, 10, 1, 1);
    //position = new PVector(120, 120);
    //cueBall = new Ball(120 + 10, 120+5, 0, 0);
    //is direction not just the dierction of the ball...
  }
  
  void setPos( int x, int y){
  position = new PVector(x, y);
  }
  
  PVector calculateAcceleration(){
  PVector direction = cueBall.getPosition().sub(position);
  direction.normalize();
  PVector acceleration = direction.mult(numForce / cueBall.getMass());
  return acceleration;
  
  }
  
  void setCB(Ball cb){
  cueBall = cb;
  }
  
  
  void display(){
  PVector pos = cueBall.getPosition();
  PVector dir = PVector.sub(pos, position);
  float angle = PVector.angleBetween(new PVector(1,0), dir);
  pushMatrix();
  translate(position.x, position.y);
  rotate(angle);
  noStroke();
  fill(255,191,128);
  rect(0, -7.5, 200, 15);  
  popMatrix();
  }
  
  void hit(){
  PVector accel = calculateAcceleration();
  cueBall.move(accel);
  }
}
