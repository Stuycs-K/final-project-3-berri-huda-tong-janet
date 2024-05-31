public class Ball{
  private float mass; 
  private PVector position;
  private PVector velocity;
  private PVector acceleration;
  private float colour;
  private final float friction_constant = 0.06; 
  


  public Ball(float x, float y, float xspeed, float yspeed){
    mass = .165; 
    position = new PVector(x, y); 
    velocity = new PVector(xspeed, yspeed); 
    acceleration = new PVector(0, 0); 
    colour = random(225); 
  }
  
  public void getStationaryDirect(Ball hit){
    //get the vectors necessary 
    PVector hitt = new PVector(hit.position.x - position.x, hit.position.y - position.y);
    PVector cue = new PVector(0, 0);  
    if (PVector.angleBetween(velocity, hitt.copy().rotate(HALF_PI + PI)) < HALF_PI){
      cue = hitt.copy().rotate(HALF_PI + PI); 
    }
    else{
      cue = hitt.copy().rotate(HALF_PI); 
    }
    float theta = PVector.angleBetween(velocity, hitt); 
    float magH = cos(theta) * velocity.mag() ; 
    float magC = sin(theta) * velocity.mag(); 
    hitt.normalize().mult(magH); 
    cue.normalize().mult(magC); 
    velocity.set(cue); 
    hit.velocity.set(hitt); 
  }
  
  public void getMovingDirect(Ball hit){
    //same idea as stationary Direct but manipulating
    PVector forceVel = velocity.sub(hit.velocity); 
    PVector hitt = new PVector(hit.position.x - position.x, hit.position.y - position.y);
    PVector cue = new PVector(0, 0);  
    if (PVector.angleBetween(forceVel, hitt.copy().rotate(HALF_PI + PI)) < HALF_PI){
      cue = hitt.copy().rotate(HALF_PI + PI); 
    }
    else{
      cue = hitt.copy().rotate(HALF_PI); 
    }
    float theta = PVector.angleBetween(forceVel, hitt); 
    float magH = cos(theta) * forceVel.mag(); 
    float magC = sin(theta) * forceVel.mag(); 
    hitt.normalize().mult(magH); 
    cue.normalize().mult(magC); 
    velocity.set(cue.add(hit.velocity)); 
    hit.velocity.set(hitt.add(hit.velocity)); 
  }
  
  public void getDirect(Ball hit){
    if (this.position.dist(hit.position) <= 24){
      if (hit.velocity.mag() == 0){
        getStationaryDirect(hit); 
      }
      else if (velocity.mag() == 0){
        hit.getStationaryDirect(this); 
      }
      else{
        getMovingDirect(hit); 
      }
    }

  }
  
  /*
  //assume the hit ball is already touching the obj ball
  public void getDirect(Ball hit){
     //get the centers of each ball 
     PVector xaxis = new PVector(1, 0); 
     PVector prev = hit.velocity.copy(); 
     PVector cue = velocity.copy(); 
     float cueVel = cue.mag(); 
     float hitVel = prev.mag(); 
     
     float cueIAng = PVector.angleBetween(xaxis, cue); //angle of cue ball 
     float hitIAng = PVector.angleBetween(xaxis, prev); 
     
     //new directions
     PVector hitt = new PVector(hit.position.x - position.x, hit.position.y - position.y);
     PVector result = hitt.copy().rotate(PI + HALF_PI); 
     float cueFAng = PVector.angleBetween(xaxis, result); 
     float hitFAng = PVector.angleBetween(xaxis, hitt); 
     
     //system of equations to find the magnitude of the final velocities
     float z = (cueVel * cos(cueIAng)) + (hitVel * cos(hitIAng)); //v1icos + v2icos = v1fcos + v2fcos
     float y = (cueVel * sin(cueIAng)) + (hitVel * sin(hitIAng)); //sin of the above
     float a = cos(cueFAng); 
     float b = cos(hitFAng); 
     float c = sin(cueFAng); 
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
  */
  
  //angle of incidence = reflected angle 
  public void hitWall(){
    if ((floor(position.x -12) == 40) || (floor(position.x +12) == 1080)){
       velocity.x = -1 * velocity.x; 
    }
    if ((floor(position.y -12) == 40) || (floor(position.y +12) == 540)){
      velocity.y = -1 * velocity.y; 
    }
  }
  
  public void friction(){
    float Force = 9.81 * mass * friction_constant; 
    PVector friction = velocity.copy().normalize().mult(Force); 
    acceleration.sub(friction); 
  }
  
  public void setPosition(float x, float y){
    position.x = x; 
    position.y = y; 
  }
 
  public void move(){
    position.add(velocity); 
    velocity.add(acceleration); 
  }
  
  void display() {
    fill(colour); 
    noStroke();
    circle(position.x, position.y, 24);
  }
  
  public PVector getPosition(){
  return position;
  }
  
  public float getMass(){
  return mass;}
  
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
