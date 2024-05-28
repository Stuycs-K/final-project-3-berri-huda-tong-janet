ArrayList<Ball> balls; 
Ball A; 
Ball B; 
Board board; 
String s = "boop"; 

void setup(){

  size(1120, 580);//real board is 9 ft by 4.5 ft; 540 by 1080 converted!
  Board board = new Board();
  board.initialize();
  balls = new ArrayList<Ball>(); 
  A = new Ball(200, 200, 1, 1, 150); 
  B = new Ball(400, 400, -1, -1, 225); 
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
  A.hitWall(); 
  B.hitWall(); 
  text(A.position.dist(B.position), 40, 40); 
  if ((A.position.dist(B.position) < 24) && (A.position.dist(B.position) > 20)){
    B.getDirect(A); 
  }
}
