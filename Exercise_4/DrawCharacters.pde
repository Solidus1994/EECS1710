myCharacter ch;

void setup() {
  size(1280, 720, P2D);
  ch = new myCharacter('b');
}

void draw() {
  background(127);
  ch.draw();
}
