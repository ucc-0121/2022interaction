void setup(){
  size(500,500);
}
float x=250,y=250;
void draw(){
  ellipse(x,y,10,10);//橢圓
  x=x+1;
  y=y-1;
}
