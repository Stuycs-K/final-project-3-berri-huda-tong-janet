ArrayList<Ball> balls; 
Ball A; 
Ball B; 
Board board; 
int turns = 0; 

public Stick cueStick;
public Ball cueBall;

void setup(){
  size(1220, 580);//real board is 9 ft by 4.5 ft; 540 by 1080 converted!
  board = new Board();
  balls = board.initializeBalls(); 
  cueStick = new Stick(balls.get(0));
  board.arrangeBalls(balls);  
  //release thing
  board.displayBar(80); 
}

void draw(){ 
  board.initialize(); 
  cueStick.display();
  if (mouseX < 1120){
    board.displayBar(80);
  } 
  for (int i = 0; i < balls.size(); i++){
    Ball b = balls.get(i); 
    b.move(balls);
    b.hitWall(); 
    b.display(); 
    if (b.inHole()){
      if (b.getColor() != 225){
        balls.remove(b); 
      }
    }
  }
}

void nextTurn(){
  
}

void mouseDragged(){
  if (mouseX > 1120 && mouseX < 1200){
    pushMatrix(); 
    board.displayBar(mouseY); 
    popMatrix(); 
  }
}

void mouseClicked(){
  float x = mouseX; 
  float y = mouseY; 
  cueStick.setFreeze(!cueStick.getFreeze()); 
}
  
void mousePressed(){
  cueStick.updatePos();
  cueStick.setVis(true);
}
 
void mouseReleased(){
  //for the stick bar 
  if (mouseX > 1120){
    float dist = mouseY - 20; 
    cueStick.changeForce(dist/90); 
    cueStick.hit(); 
    cueStick.setVis(false); 
    board.displayBar(80); 
  }
  //otherwise it changes the angle of the stick 
  else{
    cueStick.updatePos();
  }
}
  


  
