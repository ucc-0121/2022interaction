void setup(){
  size(500,500);
}
int w=25;
void draw(){
  drawPokerCard(100,100,"S4");
  drawPokerCard(150,100,"H3");
  drawPokerCard(200,100,"D3");
  drawPokerCard(250,100,"CJ");
}
void drawPokerCard(int x,int y,String face){
  fill(255);
  rect(x-w/2,y-w/2,150+w,250+w,20);
  fill(#629BE3);
  rect(x,y,150,250,20);
  fill(0);
  textSize(40);
  text(face,x,y+40);
}
