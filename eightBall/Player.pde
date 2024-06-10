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
  
  public void ballsDisplay(){
  for (int i = 0; i < ballsIn.size() -1; i +=2){
  ballsIn.get(i).setPosition(25 + (i * 25), 620);
  ballsIn.get(i).display();
  }
  }
  
}
