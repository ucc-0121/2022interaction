class Fruit{
  float x,y,vx,vy;
  boolean flying;
  PApplet sketch;//為了讓等一下的亂數可以用
  Fruit(PApplet _sketch){//建構子:一開始要做的事
    sketch= _sketch;//為了讓等一下的亂數可以用
    reset();
  }
  void reset(){
    x=sketch.random(100.0,300.0);//為了讓等一下的亂數可以用
    y=300;
    vx=sketch.random(-2,+2);//為了讓等一下的亂數可以用
    vy=-13;
    flying=true;
  }
  void update(){
  x+=vx;
  y+=vy;
  vy+=0.98/3;//重力加速度
  }
}
Fruit fruit;
void setup(){
  size(400,300);
  fruit=new Fruit(this);//為了讓等一下的亂數可以用
}
void draw(){
  background(255,255,0);
  ellipse(fruit.x,fruit.y,50,50);
  fruit.update();
}
void keyPressed(){
  fruit.reset();
}
