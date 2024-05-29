ArrayList<Ball> balls; 
Ball A; 
Ball B; 
Board board; 
int turns = 0; 

void setup(){
  size(1120, 580);//real board is 9 ft by 4.5 ft; 540 by 1080 converted!
  Board board = new Board();
  board.initialize();
  balls = board.arrangeBalls(); 
  A = new Ball(200, 200, 1, 1, 150); 
  B = new Ball(400, 400, 0, 0, 225); 
}

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
  
  for (Ball b: balls){
    b.display(b.getColor()); 
  }
  
  //movement of balls
  A.move(); 
  B.move(); 
  A.display(A.getColor()); 
  B.display(B.getColor()); 
  A.hitWall(); 
  B.hitWall(); 
  if ((A.position.dist(B.position) < 24) && (A.position.dist(B.position) > 20)){
    A.getDirect(B); 
  }
}

/*
void setup(){

=======
>>>>>>> cd2f070 (Janet (#1))
size(1120, 580);//real board is 9 ft by 4.5 ft; 540 by 1080 converted!
Board board = new Board();
board.initialize();
  fill(0);
  Stick cueStick = new Stick();
  Ball a = new Ball(100, 100, 10, 10); 
  a.display(); 
  Ball b = new Ball(110, 110, 10, 10); 
  b.display(); 
<<<<<<< HEAD
<<<<<<< HEAD

 
=======
  System.out.println("Mass: " + b.getMass());
  System.out.println("Acceleration: " + cueStick.calculateAcceleration()); 
>>>>>>> a9ef586 (got a null pointer exceptionf or acceleration)
}//8ball
<<<<<<< HEAD
=======

void draw(){
  /*Stick cueStick = new Stick();
  cueStick.setPos(pmouseX, pmouseY);
  //need to add a delay + only draw stick when mouse was clicked and reset it each time... 
  //also need to figure out how to tilt the stick.
  cueStick.display();
*/
