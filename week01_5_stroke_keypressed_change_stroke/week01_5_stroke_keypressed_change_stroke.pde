void setup(){
size(500,500);
background(#5C8CCE);
stroke(255,0,0);
}
void draw(){
  if(mousePressed){
    line(mouseX,mouseY,pmouseX,pmouseY);
  }
}
void keyPressed(){
  if(key=='1') stroke(#D258DB);
  if(key=='2') stroke(#32BFB2);
  if(key=='3') stroke(#E5CD43);
}
