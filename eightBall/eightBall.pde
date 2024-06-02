ArrayList<Ball> balls; 
Ball A; 
Ball B; 
Board board; 
int turns = 0; 

public Stick cueStick;
public Ball cueBall;

void setup(){
  size(1120, 580);//real board is 9 ft by 4.5 ft; 540 by 1080 converted!
  board = new Board();
  balls = board.initializeBalls(); 
  cueStick = new Stick(balls.get(0));
  //cueStick.setCB(balls.get(0));
  board.arrangeBalls(balls);   
  /*
  A = new Ball(150, 200, 4, 4); 
  A.changeColor(150); 
  B = new Ball(200, 250, -4, -8); 
  */
  //cueStick.display();
}

void draw(){ 
  board.initialize(); 
  cueStick.display();
  for (Ball b: balls){
    b.move(balls);
    b.hitWall(); 
    b.display(); 
  } 

}

/*void inHole(){
  for (int i = 0; i < balls.size(); i ++){
  if ()
  }
*/

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


  
