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
  fill(112); 
  rect(1140, 20, 60, 540, 20, 20, 20, 20 ); 
  for (int i = 1; i < 6; i++){
    line(1140, 20 + (90 * i), 1200, 20 + (90 * i)); 
  }
  fill(255,191,128);
  rect(1160, 80, 20, 450);
}

void draw(){ 
  board.initialize(); 
  cueStick.display();
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

void mouseDragged(){
  if (mouseX > 1120 && mouseX < 1200){
    fill(112); 
    rect(1140, 20, 60, 540, 20, 20, 20, 20 ); 
    for (int i = 1; i < 6; i++){
      line(1140, 20 + (90 * i), 1200, 20 + (90 * i)); 
    }
    stroke(0); 
    fill(255,191,128);
    rect(1160, mouseY, 20, 450); 
  }
  
}

void mouseClicked(){
    cueStick.updatePos();
   //cueStick.setVis(true);
   cueStick.hit();
}
  
void mousePressed(){
  if (mouseX> 1120){
    
  }
  else{
    cueStick.updatePos();
    cueStick.setVis(true);
  }
}
 
void mouseReleased(){
  if (mouseX > 1120){
    
  }
}
  
void keyPressed(){
  if(key == 's'){
  cueStick.setVis(!cueStick.getVis());}
  if (key == 'r'){
  setup();}
}


  
