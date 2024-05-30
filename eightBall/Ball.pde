public class Ball{
  private float mass; 
  private PVector position;
  private PVector velocity;
  private PVector acceleration;
  private float colour;
  


  public Ball(float x, float y, float xspeed, float yspeed, float c){
    mass = .165; 
    position = new PVector(x, y); 
    velocity = new PVector(xspeed, yspeed); 
    acceleration = new PVector(0, 0); 
    colour = c; 
  }
  
  //assume the hit ball is already touching the obj ball
  public void getDirect(Ball hit){
     //get the centers of each ball 
     PVector x-axis = new Pvector(1, 0); 
     PVector prev = hit.velocity.copy(); 
     PVector cue = velocity.copy(); 
     float cueVel = cue.mag(); 
     float hitVel = prev.mag(); 
     
     float cueIAng = angleBetween(x-axis, cue); //angle of cue ball 
     float hitIAng = angleBetween(x-axis, prev); 
     
     //new directions
     PVector hitt = new PVector(hit.position.x - position.x, hit.position.y - position.y);
     PVector result = hitt.copy().rotate(PI + HALF_PI); 
     float cueFAng = angleBetween(x-axis, result); 
     float hitFAng = angleBetween(x-axis, hitt); 
     
     //system of equations to find the magnitude of the final velocities
     float z = (cueVel * cos(cueIAng)) + (hitVel * cos(hitIAng)); //v1icos + v2icos = v1fcos + v2fcos
     float y = (cueVel * sin(cueIAng)) + (hitVel * sin(hitIAng)); //sin of the above
     float a = cos(cueFAng); 
     float b = cos(hitFAng); 
     float c = sin(CueFAng); 
     float d = sin(hitFAng); 
     //solved the system
     float magV1f = ((d*z) - (y*b))/((a*d) - (b*c)); 
     float magV2f = ((c*z) - (a*y))/((b*c) - (a*d)); 
     
     //multiply the vectors by their appropriate velocities 
     hitt.normalize(); 
     result.normalize(); 
     this.velocity.set(result.mult(magV1f)); 
     hit.velocity.set(hitt.mult(magV2f)); 
     

  }
  
  //angle of incidence = reflected angle 
  public void hitWall(){
    if ((floor(position.x -12) == 40) || (floor(position.x +12) == 1080)){
       velocity.x = -1 * velocity.x; 
    }
    if ((floor(position.y -12) == 40) || (floor(position.y +12) == 540)){
      velocity.y = -1 * velocity.y; 
    }
  }
  
  public void setPosition(float x, float y){
    position.x = x; 
    position.y = y; 
  }
 
  public float getColor(){
    return colour; 
  }
  
  public void move(){
    position.add(velocity); 
    acceleration.add(velocity); 
  }
  
  void display(float c) {
    fill(c); 
    noStroke();
    circle(position.x, position.y, 24);
  }
  

  //assume the hit ball is already touching the obj ball
  /*public void getDirect(Ball obj, Ball hit){
=======
    colour = color(255); 
  }
  
  //assume the hit ball is already touching the obj ball
  public void getDirect(Ball obj, Ball hit){
>>>>>>> cd2f070 (Janet (#1))
     //get the centers of each ball 
     float x1 = obj.position.x; 
     float y1 = obj.position.y; 
     float x2 = hit.position.x; 
     float y2 = hit.position.y; 
     PVector vel = new PVector(x1 - x2, y1 - y2); 
     hit.velocity.set(vel); 
     obj.velocity.set(vel.rotate(PI + HALF_PI)); 
     
  }
<<<<<<< HEAD
<<<<<<< HEAD
  */
  public PVector getPosition(){
  return position;
  }
  
  public float getMass(){
  return mass;}
  
  void display() {
    noStroke();
    fill(colour);
    circle(position.x, position.y, 20);
  }
  
  public void changeColor(float col){
    colour = col;
  }
  
  public void move(PVector acc){
  acceleration = acc;
  velocity.add(acceleration);
  acceleration = new PVector(0,0);
  position.add(velocity);
  }
  

}
