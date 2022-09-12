void setup(){
  size(500,500);
}
int w=25;
void draw(){
  drawCard(100,100);
  drawCard(150,100);
}
void drawCard(int x,int y){
  fill(255);
  rect(x-w/2,y-w/2,150+w,250+w,20);
  fill(#629BE3);
  rect(x,y,150,250,20);
}
