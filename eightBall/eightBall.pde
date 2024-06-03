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
  nextTurn(); 
}

void nextTurn(){
  boolean a = true; 
  for (Ball b: balls){
    a = (b.velocity.mag() == 0); 
  }
  if (a){
    cueStick.setVis(true); 
  }
}

void mouseDragged(){
  if (mouseX > 1120 && mouseX < 1200){
    pushMatrix(); 
    board.displayBar(mouseY); 
    popMatrix(); 
  }
}

void mouseClicked(){
  cueStick.setFreeze(!cueStick.getFreeze()); 
  if (!cueStick.getFreeze()){
    cueStick.updatePos(); 
  }
}
  
void mousePressed(){
  if (!cueStick.getFreeze()){
    cueStick.updatePos();
  }
}
 
void mouseReleased(){
  //for the stick bar 
  if (mouseX > 1120){
    float dist = mouseY - 20; 
    cueStick.changeForce(dist/90); 
    cueStick.setVis(false); 
    cueStick.hit(); 
    board.displayBar(80); 
  }

}

void keyPressed(){
  if (key == 'r'){
    setup(); 
  }
}
  


  
