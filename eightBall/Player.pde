public class Player{
  private int id;
  private boolean striped;
  private ArrayList<Ball> ballsIn = new ArrayList<>();
 
  Player(int ID, boolean stripe){
  id = ID;
  striped = stripe;
}

  public void addBallIn(Ball ball){
  ballsIn.add(ball);
  }
  
  public ArrayList<Ball> getBallsIn(){
  return ballsIn;
  }
  
  public int getID(){
  return id;
  }
  
  public boolean getPlayStripes(){
  return striped;
  }
  
  public void setStripes(boolean stripe){
  this.striped = stripe;
  }
  
  public void ballsDisplay(int currInd){
    for (int i = 0; i < ballsIn.size() ; i++){
      if (currInd == 0){
        ballsIn.get(i).setPosition(25 + (i * 30), 620);
        ballsIn.get(i).setVelocity(0, 0); 
      }
      else{
        ballsIn.get(i).setPosition(575 + (i * 30), 620);
        ballsIn.get(i).setVelocity(0, 0); 
      }
      ballsIn.get(i).display();
    }
  }
  
}
