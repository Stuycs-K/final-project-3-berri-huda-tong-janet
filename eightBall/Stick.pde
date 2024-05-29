public class Stick {
  private float numForce;
  private PVector position;
  private Ball cueBall;

  //before we implement the drag for the force of the stick gna set it as like
  
  Stick() {
    numForce = 24.0;
    cueBall = new Ball(10, 10, 1, 1, 225);
    position = new PVector(120, 120);

    cueBall = new Ball(120 + 10, 120+5, 0, 0, 0);
    //is direction not just the dierction of the ball...
  }
  
  void setPos( int x, int y){
  position = new PVector(x, y);
  }
  
  PVector calculateAcceleration(){
  //acceleration = F/m
  //f = the numForce
  //m is equal to the mass
  //direction is just equal to the absolute value or im not completely sure... tbh
  PVector direction = cueBall.getPosition().sub(position);
  direction.normalize();
  PVector acceleration = direction.mult(numForce / cueBall.getMass());
  return acceleration;
  
  }
  
  void setCB(Ball cb){
  cueBall = cb;
  }
  
  
  void display(){

  //rect(position.x, position.y, 10, 100);
  float angle = PVector.angleBetween(cueBall.position, cueStick.position);
  //must change this so that it turns to the correct angle!
   pushMatrix();
  translate(cueBall.position.x,cueBall.position.y);
  rotate(angle);
  noStroke();
  fill(0);
  rect(cueBall.position.x - 6, cueBall.position.y -6, 20, 10);
  popMatrix();
  }
  
  void hit(){
  PVector accel = calculateAcceleration();
  cueBall.move(accel);
  }
}
