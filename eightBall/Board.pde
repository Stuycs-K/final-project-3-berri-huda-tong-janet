public class Board{
private Stick cueStick;
private ArrayList<Ball> balls;

Board(){
cueStick = new Stick();

}

void initialize(){
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
}

public ArrayList<Ball> arrangeBalls(){
  for (int i = 0; i < 15; i++){
    Ball a = new Ball(0, 0, 0, 0, color(random(225), random(225), random(225))); 
    
  }
}


}
