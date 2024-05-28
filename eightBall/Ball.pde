public class Ball{
  //assume radius is always 12 units
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
     float x1 = position.x; 
     float y1 = position.y; 
     float x2 = hit.position.x; 
     float y2 = hit.position.y; 
     PVector vel = new PVector(x2 - x1, y2 - y1); 
     hit.velocity.set(vel); 
     velocity.set(vel.rotate(HALF_PI)); 
  }
  
  //angle of incidence = reflected angle 
  public void hitWall(){
    if ((position.x -12 == 20) || (position.x +12 == 1100)){
       velocity.x = -1 * velocity.x; 
    }
    if ((position.y -12 == 20) || (position.y +12 == 560)){
      velocity.y = -1 * velocity.y; 
    }
  }
 
  
  public void move(){
    position.add(velocity); 
    acceleration.add(velocity); 
  }
  
  void display() {
    fill(colour); 
    noStroke();
    circle(position.x, position.y, 24);
  }


}
