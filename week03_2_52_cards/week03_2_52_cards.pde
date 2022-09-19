void setup()
{
  size(700,700);
}
void draw(){
  background(#629BE3);
  for(int i=0;i<52;i++){
    int x=(i%10)*60;//除法10的餘數(個位數)
    int y=int(i/10)*120;//十位數
    rect(x,y,60,120);
  }
}
