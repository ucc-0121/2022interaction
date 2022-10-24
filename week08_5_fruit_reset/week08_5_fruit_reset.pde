void setup(){
  size(400,300);
}
float fruitX=200,fruitY=300;//水果的位置有XY精確的小數點
float fruitVX=2,fruitVY=-13;//水果的速度
boolean flying=true;
void draw(){
  background(255,255,0);
  
  ellipse(fruitX,fruitY,50,50);
  if(flying){
    fruitX+=fruitVX;
    fruitY+=fruitVY;
    fruitVY+=0.98/3;
  }
}
void keyPressed(){
  flying=false;
  fruitReset();
}
void fruitReset(){
  fruitX=random(100,300);
  fruitY=300;//固定高度
  fruitVX=random(-2,+2);
  fruitVY=-13;
  flying=true;
}
