public class Stick {
  private float numForce;
  private PVector force;
  private PVector position;
  private Ball cueBall;

  //before we implement the drag for the force of the stick gna set it as like
  Stick() {
    numForce = 24.0;
    position = new PVector(pmouseX, pmouseY);
    cueBall = new Ball();
    //is direction not just the dierction of the ball...
  }
}
