public class Stick {
  private float numForce;
  private PVector position;
  private Ball cueBall;

  //before we implement the drag for the force of the stick gna set it as like
  
  Stick() {
    numForce = 24.0;
    position = new PVector(120, 120);
    cueBall = new Ball(120 + 10, 120+5, 0, 0);
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

  rect(position.x, position.y, 10, 100);
  float angle = PI/4;
   pushMatrix();
  translate(position.x,position.y);
  rotate(angle);
  noStroke();
  fill(0);
  rect(0,-5, 15, 10);
  popMatrix();
  }
}
