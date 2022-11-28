
Drop[] drops = new Drop[500];

void setup() {

  size(300, 300);
  for (int i = 0; i<500; i++) {
    drops[i] = new Drop();
  }
}

void draw() {
  background(0);
  for (int i = 0; i<500; i++) {
    drops[i].fall();
    drops[i].show();
  }
}


class Drop {
  float x = random(0, width);
  float y = random(-100, -200);
  float yspeed = random(4, 10);

  void fall() {
    y = y + yspeed;
    if (y > height) {
      y = random(-100, -200);
    }
  }
  void show() {
    stroke(138, 43, 226);
    line(x, y, x, y+random(1, 15));
  }
}
