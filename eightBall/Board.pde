public class Board{
private Stick cueStick;
private ArrayList<Ball> balls;

Board(){
cueStick = new Stick();

}

void initialize(){
  fill(color(0,100,0));
  rect(20,20, 1080, 540);
}




}
