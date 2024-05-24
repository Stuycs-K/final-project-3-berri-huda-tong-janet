void setup(){

size(1120, 580);//real board is 9 ft by 4.5 ft; 540 by 1080 converted!
Board board = new Board();
board.initialize();
  fill(0);
  Ball a = new Ball(100, 100, 10, 10); 
  a.display(); 
  Ball b = new Ball(110, 110, 10, 10); 
  b.display(); 
 
}//8ball

void draw(){
  /*Stick cueStick = new Stick();
  cueStick.setPos(pmouseX, pmouseY);
  //need to add a delay + only draw stick when mouse was clicked and reset it each time... 
  //also need to figure out how to tilt the stick.
  cueStick.display();
*/
}
