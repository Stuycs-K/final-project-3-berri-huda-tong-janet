ArrayList<Ball> balls; 
Ball A; 
Ball B; 
Board board; 
int turns = 0; 
boolean cueGone = false; 
boolean lose = false; 
boolean win = false; 
boolean lock = false; 
boolean pressed = false; 
ArrayList<Player> players;
int currInd = 0;
boolean anyIn = false;

public Stick cueStick;
public Ball cueBall;

void setup(){
  size(1220, 650);//real board is 9 ft by 4.5 ft; 540 by 1080 converted!
  board = new Board();
  balls = board.initializeBalls(); 
  players = new ArrayList<Player>();
  players.add(new Player(1, true));
  players.add(new Player(2, false));
  cueStick = new Stick(balls.get(0));
  //pocketedBalls = false;
  board.arrangeBalls(balls);  
  //release thing
  board.displayBar(80); 
  //lock button 
  fill(getLock()); 
  rect(1140, 580, 60, 50, 10, 10, 10, 10); 
  textSize(20); 
  fill(0); 
  text("LOCK", 1148, 610); 
}

boolean getStripes(){
  boolean temp = false;
  for (int i = 0; i < balls.size(); i++){
  if (balls.get(i).inHole()){
    temp = balls.get(i).getStripes();
    break;}
  }
  return temp;
}

void draw(){ 
  if (!lose && !win){
    board.initialize(); 
    if (cueStick.getVis()){
    cueStick.display();}
      //lock button 
    fill(getLock()); 
    rect(1140, 580, 60, 50, 10, 10, 10, 10); 
    textSize(20); 
    fill(0); 
    text("LOCK", 1148, 610);
    //x: 10, y: 580, length: 1100, height: 60.
    String textt = "Player: " + (currInd + 1) + "   ||   You're Playing: ";
    if (currInd == 0){
    textt += "STRIPES";
    }else{
      textt += "SOLIDS";
  }
    text(textt, 15, 600);
    if (mouseX < 1120 || (mouseX > 1120 && !pressed)){
      board.displayBar(80);
    }
    if (pressed){
      board.displayBar(mouseY); 
    }
    for (int i = 0; i < balls.size(); i++){
      Ball b = balls.get(i); 
      b.move(balls);
      b.display(); 
      if (b.update(balls) == 0){
        lose = true; 
      }
      else if (b.update(balls) == 1){
        win = true; 
      }
      b.hitWall(); 
    }
    if (!anyIn){
    //anyIn = false;
    switchPlayer();
}
    nextTurn(); 
  }
  else{
    fill(0); 
    textSize(50); 
    if (lose){
      text("YOU LOST! Press R to restart", 200, 610); 
    }
    if (win){
      text("YOU WON! Press R to restart", 200, 610); 
    }
    
  }
}

void nextTurn(){
  boolean allStop = true; 
  boolean anyIn = false;
  for (Ball b: balls){
    if (b.velocity.mag() > 0){
      allStop = false;
      break;
    }
  }
  for (Ball b : balls){
    if (b.inHole()){
    anyIn = true;
    break;
}
  }
  if (!anyIn){
  //switchPlayer();
}
  cueStick.setVis(true);
  //pocketedBalls =  false;
}

color getLock(){
  if (lock){
    return color(225, 0, 0); 
  }
  return color(0, 225, 0); 
}

void mouseDragged(){
  pressed = true; 
  if (mouseX > 1120 && mouseX < 1200){
    pushMatrix(); 
    board.displayBar(mouseY); 
    popMatrix(); 
  }
  if (cueGone && (mouseX >= balls.get(0).position.x -12 && mouseX <=  balls.get(0).position.x + 12 && mouseY >=  balls.get(0).position.y -12 && mouseY <=  balls.get(0).position.y +12)){
    balls.get(0).setPosition(mouseX, mouseY); 
  }
}

void mouseClicked(){
  lock = !lock; 
  cueStick.setFreeze(!cueStick.getFreeze()); 
  if (!cueStick.getFreeze()){
    cueStick.updatePos(); 
  }
}
  
void mousePressed(){
  if (!cueStick.getFreeze()){
    cueStick.updatePos();
  }
}
 
void mouseReleased(){
  cueStick.setVis(false); 
  //for the stick bar 
  if (mouseX > 1120){
    float dist = mouseY - 20; 
    cueStick.changeForce(dist/90); 
    cueStick.hit(); 
    board.displayBar(80); 
  }
  pressed = false; 
}

void keyPressed(){
  if (key == 'r'){
    setup(); 
    lose = false; 
    win = false; 
    currInd = 0;
    anyIn = false;
  }
  if (key == 'd'){
    balls.get(5).setPosition(70, 70); 
    balls.get(0).setPosition(100, 100); 
  }
  if (key == 'w'){
    for (int i = balls.size() -1; i > 0; i--){
      if (i != 5){
        balls.remove(i); 
      }
    }
    balls.get(1).setPosition(70, 70); 
    balls.get(0).setPosition(100, 100); 
  }
}

void switchPlayer(){
  currInd = (currInd + 1) % players.size();
  //pocketedBalls = false;
}
