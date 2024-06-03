public class Ball{
  private float mass; 
  private PVector position;
  private PVector velocity;
  private PVector acceleration;
  private color colour;
  private boolean stripe; 
  private final float friction_constant = 0.1; 
  
//temp constructor 
/*
  public Ball(float x, float y, float xspeed, float yspeed){
    mass = .165; 
    position = new PVector(x, y); 
    velocity = new PVector(xspeed, yspeed); 
    acceleration = new PVector(0, 0); 
    colour = random(225) ; 
  }
  */ 

//CONSTRUCTOR -------------
  public Ball(float x, float y, float xspeed, float yspeed, color c, boolean stri){
    mass = .165; 
    position = new PVector(x, y); 
    velocity = new PVector(xspeed, yspeed); 
    acceleration = new PVector(0, 0); 
    colour = c ; 
    stripe = stri; 
  }
 
//BALL COLLISIONS -------------
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
  
  public void move(ArrayList<Ball> balls){
    if (velocity.mag() <= 0.5){
      velocity.set(0, 0); 
    }
    int ind = contact(balls); 
    if (ind != 0){
      this.getDirect(balls.get(ind)); 
    }
    position.add(velocity); 
    acceleration.add(friction()); 
    velocity.add(acceleration); 
    acceleration.set(0, 0); 
    ind = contact(balls); 
    if (ind != 0){
      this.getDirect(balls.get(ind)); 
    }
  }
  
  //checks if two balls are in contact 
  //returns the index of the contacted ball 
  public int contact(ArrayList<Ball> balls){
    for (int j = 0; j < balls.size(); j++){
       Ball c = balls.get(j); 
        if ((this.position.dist(c.position) <= 24 || this.position.copy().add(this.velocity).dist(c.position.copy().add(c.velocity)) <= 24)  && this.position.dist(c.position) != 0){
          return j ; 
        }
     }
     return 0; 
   }
  
  //angle of incidence = reflected angle 
  public void hitWall(){
    if ((position.x -12  <= 40) || (position.x -12 + velocity.x <= 40) || (position.x +12 >= 1080) || (position.x + 12 + velocity.x >= 1080)){
     velocity.x = -1 * velocity.x; 
    }
    if ((position.y -12  <= 40) || (position.y -12 + velocity.y <= 40) || (position.y +12 >= 540) || (position.y + 12 + velocity.y >= 540)){
      velocity.y = -1 * velocity.y; 
    }
  }
 
//FRICTION ------------
  public PVector friction(){
    float Force = -1 * 9.81 * mass * friction_constant; 
    PVector friction = velocity.copy().normalize().mult(Force); 
    return friction; 
  }
  
//IN HOLE? 

  public boolean inHole(){
    //if center of ball is within these radii, then considered inHole 
    if ((position.y >= 20 && position.y <= 60) || (position.y >= 520 && position.y <= 560)){
      return ((position.x >= 20 && position.y <= 60) || (position.x >= 540 && position.x <= 580) || (position.x >= 1060 && position.x <= 1100)); 
    }
    return false; 
  }
  
  
  
  
//ACCESSOR METHODS
  public void setPosition(float x, float y){
    position.x = x; 
    position.y = y; 
  }
  
  void display() {
    noStroke();
    fill(colour); 
    circle(position.x, position.y, 24);
    if (stripe){
      fill(225); 
      rect(position.x - 4, position.y - 11, 8, 22); 
    }
  }
  
  public PVector getPosition(){
  return position;
  }
  
  public float getMass(){
  return mass;}
  
  public color getColor(){
    return colour; 
  }
  
  public void move(PVector acc){
  acceleration = acc;
  velocity.add(acceleration);
  acceleration = new PVector(0,0);
  position.add(velocity);
  }

}
