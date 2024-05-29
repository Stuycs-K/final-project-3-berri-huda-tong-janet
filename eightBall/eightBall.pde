ArrayList<Ball> balls; 
Ball A; 
Ball B; 
Board board; 

void setup(){

  size(1120, 580);//real board is 9 ft by 4.5 ft; 540 by 1080 converted!
  Board board = new Board();
  board.initialize();
  balls = new ArrayList<Ball>(16); 
  A = new Ball(200, 200, 1, 1, 150); 
  B = new Ball(400, 400, 0, 0, 225); 
}//8ball

/*
void mouseClicked(){
  balls.add(new Ball(mouseX, mouseY, 1, 1)); 
}
*/


void draw(){
  //resetting the board to initialization state 
  fill(color(0,100,0));
  strokeWeight(20); 
  stroke(150, 75, 0); //border to brown
  rect(20,20, 1080, 540);
  //holes
  fill(0);
  stroke(0); 
  circle(40, 40, 20); 
  circle(1080, 40, 20); 
  circle(560, 40, 20); 
  circle(40, 540, 20); 
  circle(1080, 540, 20); 
  circle(560, 540, 20); 
  
  //movement of balls
  A.move(); 
  B.move(); 
  A.display(); 
  B.display(); 
  A.hitWall(); 
  B.hitWall(); 
  text(A.position.dist(B.position), 40, 40); 
  if ((A.position.dist(B.position) < 24) && (A.position.dist(B.position) > 20)){
    A.getDirect(B); 
  }
}
