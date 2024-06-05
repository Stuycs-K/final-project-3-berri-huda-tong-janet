ArrayList<Ball> balls; 
Ball A; 
Ball B; 
Board board; 
int turns = 0; 
boolean cueGone = false; 
boolean lose = false; 
boolean win = false; 

public Stick cueStick;
public Ball cueBall;

void setup(){
  size(1220, 580);//real board is 9 ft by 4.5 ft; 540 by 1080 converted!
  board = new Board();
  balls = board.initializeBalls(); 
  cueStick = new Stick(balls.get(0));
  board.arrangeBalls(balls);  
  //release thing
  board.displayBar(80); 
}

void draw(){ 
  if (!lose && !win){
    board.initialize(); 
    cueStick.display();
    if (mouseX < 1120){
      board.displayBar(80);
    } 
    for (int i = 0; i < balls.size(); i++){
      Ball b = balls.get(i); 
      b.move(balls);
      b.display(); 
      if (b.update(balls) == 0){
        lose = true; 
      }
      if (b.update(balls) == 1){
        win = true; 
      }
      b.hitWall(); 
    }
    nextTurn(); 
  }
  else{
    textSize(50); 
    if (lose){
      text("YOU LOST! Press R to restart", 200, 275); 
    }
    if (win){
      text("YOU WON! Press R to restart", 200, 275); 
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
  if (mouseX > 1120 && mouseX < 1200){
    pushMatrix(); 
    board.displayBar(mouseY); 
    popMatrix(); 
  }
  if (cueGone && (mouseX >= 288 && mouseX <= 312 && mouseY >= 278 && mouseY <= 302)){
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
}

void keyPressed(){
  if (key == 'r'){
    setup(); 
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
  


  
