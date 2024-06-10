ArrayList<Ball> balls; 
Ball A; 
Ball B; 
Board board; 
int turns = 0; 
boolean cueGone = false; 
boolean lose = false; 
boolean win = false; 
boolean pressed = false; 
ArrayList<Player> players;
int currInd = 0;
boolean forceWin;
boolean firstTurn = true; 
//boolean anyIn;

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
  forceWin = false;
  board.arrangeBalls(balls);  
  board.displayBar(80);  
  board.displayLock(cueStick); 
  board.displayScore(players, firstTurn); 
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
      cueStick.display();
    } 
    board.displayLock(cueStick); 
    board.displayScore(players, firstTurn);
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
  boolean a = true; 
  for (Ball b: balls){
    a = (b.velocity.mag() == 0); 
  }
  if (a){
    cueStick.setVis(true); 
  }
  else{
    cueStick.setVis(false); 
  }
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
  if (cueGone){
    cueGone= !cueGone; 
  }
}

void keyPressed(){
  if (key == 'r'){
    setup(); 
    lose = false; 
    win = false; 
    currInd = 0;
    //anyIn = false;
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
    forceWin = true;
  }
}

void setCueGone(boolean x){
  cueGone = x; 
}

void switchPlayer(){
  currInd = (currInd + 1) % 2;
}
