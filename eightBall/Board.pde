public class Board{

Board(){
}

void initialize(){
  fill(225);
  rect(0, 0, 1220, 650);
  //resetting the board to initialization state 
  fill(color(0,100,0));
  strokeWeight(20); 
  stroke(150, 75, 0); //border to brown
  rect(20,20, 1080, 540);
  
  //holes
  
  fill(0);
  strokeWeight(1); 
  stroke(0); 
  circle(40, 40, 40); 
  circle(1080, 40, 40); 
  circle(560, 40, 40); 
  circle(40, 540, 40); 
  circle(560, 540, 40);
  circle(1080, 540, 40); 
  
}

public ArrayList<Ball> initializeBalls(){
  ArrayList<Ball> ballz = new ArrayList<Ball>(); 
  ballz.add(new Ball(300, 290, 0, 0, 225, false)); //white
  ballz.add(new Ball(0, 0, 0, 0, color(225, 165, 0), false)); //yellow 
  ballz.add(new Ball(0, 0, 0, 0, color(0, 0, 225), true)); //blue
  ballz.add(new Ball(0, 0, 0, 0, color(225, 0, 0), true)); //red
  ballz.add(new Ball(0, 0, 0, 0, color(60, 179, 113), true)); //green
  ballz.add(new Ball(0, 0, 0, 0, color(225, 135, 0), true)); //orange
  ballz.add(new Ball(0, 0, 0, 0, color(0, 0, 225), false)); //blue
  ballz.add(new Ball(0, 0, 0, 0, color(225, 0, 0), false)); //red
  ballz.add(new Ball(0, 0, 0, 0, color(60, 179, 113), false)); //green
  ballz.add(new Ball(0, 0, 0, 0, color(225, 135, 0), false)); //orange
  ballz.add(new Ball(0, 0, 0, 0, color(110, 90, 1775), false)); //purple
  ballz.add(new Ball(0, 0, 0, 0, color(165, 0, 0), false)); //maroon
  ballz.add(new Ball(0, 0, 0, 0, color(225, 165, 0), true)); //yellow 
  ballz.add(new Ball(0, 0, 0, 0, color(110, 90, 1775), true)); //purple
  ballz.add(new Ball(0, 0, 0, 0, color(165, 0, 0), true)); //maroon
      

  ballz.add(5, new Ball(0, 0, 0, 0, 0, false)); //black
  return ballz; 
}


//creates the triangle of balls
public void arrangeBalls(ArrayList<Ball> ballz){ 
  for (int i = 1; i < 16; i++){
    Ball a = ballz.get(i); 
    if (i == 1){
      a.setPosition(750, 290); 
    }
    if ((i >= 2) && (i <= 3)){
      a.setPosition(753+ (12 * sqrt(3)), 279 + (25 * (i -2) + (i-2)));  
    }
    if ((i >= 4) && (i <= 6)){
      a.setPosition(756 + (24 * sqrt(3)), 266 + (25 * (i -4) + (i-4)));  
    }
    if ((i >= 7) && (i <= 10)){
      a.setPosition(759 + (36 * sqrt(3)), 254 + (25 * (i -7) + (i-7)));  
    }
    if ((i >= 11) && (i <= 15)){
      a.setPosition(762+ (48 * sqrt(3)), 242 + (25 * (i -11) + (i-11)));  
    }
  }
}

public void displayBar(float y){
  noStroke(); 
  fill(225);
  rect(1120, 0, 100, 580);
  stroke(0); 
  strokeWeight(1); 
  fill(112); 
  rect(1140, 20, 60, 540, 20, 20, 20, 20 ); 
  for (int i = 1; i < 6; i++){
    line(1140, 20 + (90 * i), 1200, 20 + (90 * i)); 
  }
  if (y != 0){
    stroke(0); 
    fill(255,191,128);
    rect(1160, y, 20, 450); 
  }
}

color getLock(Stick cueStick){
  if (cueStick.getFreeze()){
    return color(0, 225, 0); 
  }
  return color(225, 0, 0); 
}

public void displayLock(Stick cueStick){
  fill(getLock(cueStick)); 
  rect(1140, 580, 60, 50, 10, 10, 10, 10); 
  textSize(20); 
  fill(0); 
  text("LOCK", 1148, 610);
}

public void displayScore(ArrayList<Player> players, boolean firstTurn){
  stroke(0);
  strokeWeight(3);
  if (currInd == 0){
    fill(color(160, 185, 205)); 
  }
  else{
    noFill(); 
  }
  rect(10, 580, 540, 60);
  if (currInd == 1){
    fill(color(160, 185, 205)); 
  }
  else{
    noFill(); 
  }
  rect(560, 580, 540, 60); 
  strokeWeight(1);
  fill(0); 
  String textOne = "Player: 1    ||   You're Playing: ";
  String textTwo = "Player: 2    ||   You're Playing: ";
  if (!(firstTurn)){
    if (players.get(0).getPlayStripes()){
      textOne += "STRIPES";
      textTwo += "SOLIDS"; 
    }
    else{
      textTwo += "STRIPES";
      textOne += "SOLIDS"; 
    }
  }
  text(textOne, 15, 600);
  text(textTwo, 565, 600); 
  players.get(0).ballsDisplay(0);
  players.get(1).ballsDisplay(1); 
}

}
