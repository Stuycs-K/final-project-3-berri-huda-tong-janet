public class Ball{
  private float mass; 
  private PVector position;
  private PVector velocity;
  private PVector acceleration;
  private color colour;
  private boolean stripe; 
  private final float friction_constant = 0.06; 
  
  
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
    players = new ArrayList<Player>();
    players.add(new Player(1, true));
    players.add(new Player(2, false));
  }
 
//BALL COLLISIONS -------------

  //when the ball being hit is stationary 
  public void getStationaryDirect(Ball hit, PVector pos, PVector vel){
    //get the vectors necessary 
    PVector hitt = new PVector(hit.position.x - pos.x, hit.position.y - pos.y);
    PVector cue = new PVector(0, 0);  
    if (PVector.angleBetween(velocity, hitt.copy().rotate(HALF_PI + PI)) < HALF_PI){
      cue = hitt.copy().rotate(HALF_PI + PI); 
    }
    else{
      cue = hitt.copy().rotate(HALF_PI); 
    }
    float theta = PVector.angleBetween(vel, hitt); 
    float magH = cos(theta) * vel.mag() ; 
    float magC = sin(theta) * vel.mag(); 
    hitt.normalize().mult(magH); 
    cue.normalize().mult(magC); 
    velocity.set(cue); 
    hit.velocity.set(hitt); 
  }
  
  //when theyre both moving 
  public void getMovingDirect(Ball hit){
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
  
  //combines the stationary and moving direction 
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
  
  //for when a ball is colliding with multiple balls 
  public void multiCollision(Ball hit, ArrayList<Ball> contacted){
  
  }
  
  public void move(ArrayList<Ball> balls){
    if (velocity.mag() <= 0.5){
      velocity.set(0, 0); 
    }
    ArrayList<Ball> contacted = contact(balls); 
    if (contacted.size() != 0){
      for (int i = 0; i < contacted.size(); i++){
         this.getDirect(contacted.get(i)); 
      }
    }
    hitWall(); 
    position.add(velocity); 
    acceleration.add(friction()); 
    velocity.add(acceleration); 
    acceleration.set(0, 0); 
    contacted = contact(balls); 
    if (contacted.size() != 0){
      for (int i = 0; i < contacted.size(); i++){
        this.getDirect(contacted.get(i)); 
      }
    }
    hitWall(); 
  }
  
  //checks if two balls are in contact 
  //returns the index of the contacted ball 
  public ArrayList<Ball> contact(ArrayList<Ball> balls){
    ArrayList<Ball> contacted = new ArrayList<Ball>(); 
    for (int j = 0; j < balls.size(); j++){
       Ball c = balls.get(j); 
        if ((this.position.dist(c.position) <= 24 || this.position.copy().add(this.velocity).dist(c.position.copy().add(c.velocity)) <= 24)  && this.position.dist(c.position) != 0){
          contacted.add(c); 
        }
     }
     return contacted;  
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
      return ((position.x >= 25 && position.x <= 55) || (position.x >= 545 && position.x <= 575) || (position.x >= 1065 && position.x <= 1095)); 
    }
    return false; 
  }
  
  public int update(ArrayList<Ball> balls){
    if (inHole()){
      //not white ball
      //if black ball
      if (getColor() == 0){
        if (forceWin){
        win = true;
        return -10;
      }else{
       if (players.get(currInd).getBallsIn().size() == 7){
          win = true;
        }
        else{
        lose = true;
        }
      }
        return getColor();
       // return 1; //0 means display win message
      }
      if (getColor() == 225){
        setPosition(300, 200); 
        cueGone = true;  
        cueStick.updatePos();
        switchPlayer();
      }
      else{
      boolean correctBall = (getStripes() == players.get(currInd).getPlayStripes());
      if (correctBall){
        players.get(currInd).addBallIn(this);
        //anyIn = true;
      }
      else{
        players.get((currInd + 1) % players.size()).addBallIn(this);
      switchPlayer();
    }
      balls.remove(this);
      }
    }
    //pocketedBalls = false;
    return 2; 
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
  
  public boolean getStripes(){
    return stripe;
  }

}
