public class Ball{
  private float mass; 
  private PVector position;
  private PVector velocity;
  private PVector acceleration;
  private float colour;
  

  public Ball(float x, float y, float xspeed, float yspeed, float c){

  //public Ball(float x, float y, float xspeed, float yspeed){


  //public Ball(float x, float y, float xspeed, float yspeed){
    mass = .165; 
    position = new PVector(x, y); 
    velocity = new PVector(xspeed, yspeed); 
    acceleration = new PVector(0, 0); 

    colour = c; 
  }
  
  //assume the hit ball is already touching the obj ball
  public void getDirect(Ball hit){
     //get the centers of each ball 
     float x1 = position.x; 
     float y1 = position.y; 
     float x2 = hit.position.x; 
     float y2 = hit.position.y; 
     PVector prev = hit.velocity.copy(); 
     PVector vel = new PVector(x2 - x1, y2 - y1);
     
     //fix the magnitude of the velocity now --> assuming completely elastic, so velocities are exchanged since masses are equal
     vel.normalize(); 
     vel.mult(this.velocity.mag()); 
     hit.velocity.set(vel); 
     prev.normalize(); 
     velocity.set(prev.rotate(PI + HALF_PI)); 
      
     
  }
  
  //angle of incidence = reflected angle 
  public void hitWall(){
    if ((floor(position.x -12) == 20) || (floor(position.x +12) == 1100)){
       velocity.x = -1 * velocity.x; 
    }
    if ((floor(position.y -12) == 20) || (floor(position.y +12) == 560)){
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
     //get the centers of each ball 
     float x1 = obj.position.x; 
     float y1 = obj.position.y; 
     float x2 = hit.position.x; 
     float y2 = hit.position.y; 
     PVector vel = new PVector(x1 - x2, y1 - y2); 
     hit.velocity.set(vel); 
     obj.velocity.set(vel.rotate(PI + HALF_PI)); 
     
  }
  */
  
  void display() {
    noStroke();
    circle(position.x, position.y, 10);
  }


}
