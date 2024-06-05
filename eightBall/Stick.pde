public class Stick {
  private float numForce;
  private PVector position;
  private PVector direction; 
  private Ball cueBall;
  private boolean visible;
  private boolean freeze= false;   
  Stick(Ball cb) {
    numForce = 1;
    cueBall = cb;
    position = new PVector(100, 100);
    visible = false;
    direction = PVector.sub(cueBall.getPosition(), position);
  }
  
  void setVis(boolean b){
    visible = b;
  }

  void setPos( int x, int y){
    position = new PVector(x, y);
  }
  
  PVector calculateAcceleration(){
    PVector direction = PVector.sub(cueBall.getPosition(), position);
    direction.normalize();
    PVector acceleration = direction.mult(numForce / cueBall.getMass());
    return acceleration;
  }
  
  void display(){
    if (!visible){return;}

    if (!freeze){
      updatePos();
    }
    PVector pos = cueBall.getPosition();
    PVector dir = PVector.sub(pos, position);
    float angle = atan2(dir.y, dir.x);
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle);
    noStroke();
    fill(255,191,128);
    rect(-200, -7.5, 200, 15); 
    angle = angle * -1;
    fill(225);
    line(pos.x, pos.y, pos.x + 10 * cos(angle), pos.y + 10 * sin(angle));
    popMatrix();
  }
  
  
  void displayLines(){
    line(cueBall.position.x, cueBall.position.y, cueBall.position.x + 100 * cueStick.direction.x, cueBall.position.y + 100 * cueStick.direction.y); 
  }
  
  
  boolean getFreeze(){
    return freeze;
  }
  
  void setFreeze(boolean a){
    freeze = a; 
    updatePos();
  PVector pos = cueBall.getPosition();
  PVector dir = PVector.sub(pos, position);
  float angle = atan2(dir.y, dir.x);
  pushMatrix();
  translate(position.x, position.y);
  rotate(angle);
  noStroke();
  fill(255,191,128);
  rect(-200, -7.5, 200, 15); 
  popMatrix();

  }
  
  void hit(){
  PVector accel = calculateAcceleration();
  cueBall.move(accel);
  }
  
  boolean getVis(){
  return visible;
  }
  
  void updatePos(){
    PVector mousePos = new PVector(mouseX, mouseY);
    PVector dir =PVector.sub(mousePos, cueBall.getPosition());
    float angle = atan2(dir.y, dir.x);
    position.set(cueBall.getPosition().x - 50 * cos(angle), cueBall.getPosition().y - 50* sin(angle));
  }
    
  public void changeForce(float val){
    numForce = val; 
  }
    
}
