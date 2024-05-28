public class Stick {
  private float numForce;
  private PVector force;
  private PVector position;
  private Ball cueBall;

  //before we implement the drag for the force of the stick gna set it as like
  Stick() {
    numForce = 24.0;
    position = new PVector(pmouseX, pmouseY);
    cueBall = new Ball(10, 10, 1, 1, 225);
    //is direction not just the dierction of the ball...
  }
  
  void calculateAcceleration(){
  //acceleration = F/m
  //f = the numForce
  //m is equal to the mass
  //direction is just equal to the absolute value or im not completely sure... tbh
  
  
  }
}
