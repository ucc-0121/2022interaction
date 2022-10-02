void setup(){
  size(500,500);
}
float x=250,y=250;
float vx=1.0,vy=-2.5;
float boardx,boardy=470,boardw=100,boardh=20;
void draw(){
  background(#6ED4F2);
  boardx=mouseX-boardw/2;
  rect(boardx,boardy,boardw,boardh,20);
  ellipse(x,y,10,10);//橢圓
  x=x+vx;
  y=y+vy;
  if(x>500) vx=-vx;
  if(x<0) vx=-vx;
  if(y<0) vy=-vy;
  if((y>boardy && y<boardy+boardh) && (x>boardx && x<boardx+boardw))
  {
    vy=-vy;
    vx+=(mouseX-pmouseX)/2;
  }
  if(mousePressed && mouseButton==LEFT) boardw *= 1.01; 
  if(mousePressed && mouseButton==RIGHT) boardw *= 0.99;
}
