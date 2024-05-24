void setup(){

size(1120, 580);//real board is 9 ft by 4.5 ft; 540 by 1080 converted!
Board board = new Board();
board.initialize();

  Ball a = new Ball(5, 5, 10, 10); 
  a.display(); 
  Ball b = new Ball(5, 5, 10, 10); 
  b.display(); 


}//8ball
