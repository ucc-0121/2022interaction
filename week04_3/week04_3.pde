void setup(){
  size(500,500);
}
float x=250,y=250;
float vx=1.0,vy=-0.5;
void draw(){
  background(#6ED4F2);
  int boardx=mouseX;
  rect(boardx,470,100,15,5);
  ellipse(x,y,10,10);//橢圓
  x=x+vx;
  y=y+vy;
  if(x>500|| x<0) vx=-vx;
  if(y<0||y>500) vy=-vy;
  if(y>470 && x>boardx && x<boardx+100) vy=-vy;
  
}
