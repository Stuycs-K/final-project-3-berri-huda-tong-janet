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
  balls = board.arrangeBalls(); 
  balls.add(new Ball(300, 290, 2, 0)); 
  
  
  A = new Ball(150, 200, 1, 1); 
  A.changeColor(150); 
  B = new Ball(200, 250, -1, -2); 

}

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
  
/*
  for (Ball b: balls){
    b.display(); 
    b.hitWall(); 
    b.move();
  }
  */
  
 // contact(balls); 

  //testing code for movement of balls

  A.move(); 
  B.move(); 
  A.display(); 
  B.display(); 
  A.hitWall(); 
  B.hitWall(); 
  if ((A.position.dist(B.position) < 24) && (A.position.dist(B.position) > 20)){
    A.getMovingDirect(B); 
  }

}

/*
void contact(ArrayList<Ball> balls){
   for(int i = 0; i < balls.size(); i++){
     Ball b = balls.get(i); 
     for (int j = 0; j < balls.size(); j++){
       Ball c = balls.get(j); 
       if (j != i){
           if ((b.position.dist(c.position) < 24) && (b.position.dist(c.position) > 20)){
            b.getDirect(c); 
          }
       }
     }
   }
}
*/

  
