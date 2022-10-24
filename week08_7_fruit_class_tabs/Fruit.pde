String line="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
class Fruit {
  float x, y, vx, vy;
  boolean flying;
  int delay;
  char c;
  PApplet sketch;
  Fruit(PApplet _sketch) {//建構子:一開始要做的事
    sketch= _sketch;//為了讓等一下的亂數可以用
    reset();
  }
  void reset() {
    x=sketch.random(100.0, 300.0);//為了讓等一下的亂數可以用
    y=400;
    vx=sketch.random(-2, +2);//為了讓等一下的亂數可以用
    vy=-13;
    flying=true;
    int i=int(random(26));
    c=line.charAt(i);
    delay=int(random(300));
  }
  void update(){
    if(delay>0) {
      delay--;
      return;
    }
    x+=vx;
    y+=vy;
    vy+=0.98/3;//重力加速度
    if(y>800) reset();
  }
}
