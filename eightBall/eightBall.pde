ArrayList<Ball> balls; 
Ball A; 
Ball B; 
Board board; 
int turns = 0; 

public Stick cueStick;
public Ball cueBall;

void setup(){
  size(1120, 580);//real board is 9 ft by 4.5 ft; 540 by 1080 converted!
  Board board = new Board();
  board.initialize();
  balls = board.initializeBalls(); 
  cueStick = new Stick(balls.get(0));
  //cueStick.setCB(balls.get(0));
  board.arrangeBalls(balls);   
  A = new Ball(150, 200, 4, 4); 
  A.changeColor(150); 
  B = new Ball(200, 250, -4, -8); 
  //cueStick.display();
}

void draw(){ 

  //resetting the board to initialization state 
  fill(color(0,100,0));
  strokeWeight(20); 
  stroke(150, 75, 0); //border to brown
  rect(20,20, 1080, 540);
  //holes
  //cueStick.display();
  
  fill(0);
  stroke(0); 
  circle(40, 40, 20); 
  circle(1080, 40, 20); 
  circle(560, 40, 20); 
  circle(40, 540, 20); 
  circle(1080, 540, 20); 
  cueStick.display();

  for (Ball b: balls){

    b.move();
    b.hitWall(); 
    contact(balls);
    b.display(); 
  } 
  A.move(); 
  B.move(); 
  A.display(); 
  B.display(); 
  A.hitWall(); 
  B.hitWall(); 
  A.getDirect(B); 
  cueStick.display();

}


void contact(ArrayList<Ball> balls){
   for(int i = 0; i < balls.size(); i++){
     Ball b = balls.get(i); 
     for (int j = 0; j < balls.size(); j++){
       Ball c = balls.get(j); 
       if (j != i){
            b.getDirect(c); 
       }
     }
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


  
