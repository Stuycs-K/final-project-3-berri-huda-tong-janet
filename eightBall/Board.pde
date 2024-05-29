public class Board{
private Stick cueStick;

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
  ArrayList<Ball> ballz = new ArrayList<Ball>(); 
  for (int i = 1; i < 16; i++){
    Ball a = new Ball(0, 0, 0, 0, color(random(225), random(225), random(225))); 
    if (i == 1){
      a.setPosition(750, 290); 
    }
    if ((i >= 2) && (i <= 3)){
      a.setPosition(750 + (12 * sqrt(3)), 278 + (24 * (i -2)));  
    }
    if ((i >= 4) && (i <= 6)){
      a.setPosition(750 + (24 * sqrt(3)), 266 + (24 * (i -4)));  
    }
    if ((i >= 7) && (i <= 10)){
      a.setPosition(750 + (36 * sqrt(3)), 254 + (24 * (i -7)));  
    }
    if ((i >= 11) && (i <= 15)){
      a.setPosition(750 + (48 * sqrt(3)), 242 + (24 * (i -11)));  
    }
    ballz.add(a); 
  }
  return ballz; 

  fill (0);
}


}
