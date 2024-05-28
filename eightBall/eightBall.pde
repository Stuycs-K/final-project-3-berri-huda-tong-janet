ArrayList<Ball> balls; 
Ball A; 
Ball B; 
Board board; 

void setup(){

  size(1120, 580);//real board is 9 ft by 4.5 ft; 540 by 1080 converted!
  Board board = new Board();
  board.initialize();
  balls = new ArrayList<Ball>(); 
  A = new Ball(40, 40, 1, 1, 150); 
  B = new Ball(80, 80, -1, -1, 225); 
}//8ball

/*
void mouseClicked(){
  balls.add(new Ball(mouseX, mouseY, 1, 1)); 
}
*/


void draw(){
  fill(color(0,100,0));
  rect(20,20, 1080, 540);
  A.move(); 
  B.move(); 
  A.display(); 
  B.display(); 
  if (A.position.dist(B.position) == 24){
    A.getDirect(B); 
  }
}
