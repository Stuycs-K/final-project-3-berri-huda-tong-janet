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

void mouseClicked(){
    cueStick.updatePos();
   //cueStick.setVis(true);
   cueStick.hit();
}
  
void mousePressed(){
  cueStick.updatePos();
  cueStick.setVis(true);
}
 
void mouseReleased(){
  cueStick.setVis(false);}
  
void keyPressed(){
  if(key == 's'){
  cueStick.setVis(!cueStick.getVis());}
  if (key == 'r'){
  setup();}
}


  
