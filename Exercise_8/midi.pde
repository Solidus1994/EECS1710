import themidibus.*;

MidiBus myBus;
int channel = 0;
int pitch, velocity;
ArrayList<Dot> dots;

void setup() {
  size(640, 480, P2D);

  MidiBus.list();
  myBus = new MidiBus(this, -1, 4); 
  dots = new ArrayList<Dot>();
}

void draw() {
  background(0);
  
  for (int i=dots.size()-1; i>=0; i--) {
    Dot dot = dots.get(i);
    if (dot.alive) {
      dot.run();
    } else {
      dots.remove(i);
    }
  }
}

void mousePressed() {
  pitch = int(map(mouseY, height, 0, 0, 127));
  velocity = int(map(mouseX, 0, width, 0, 127));
  myBus.sendNoteOn(channel, pitch, velocity);
  
  dots.add(new Dot(mouseX, mouseY, velocity + 10));
}

void mouseReleased() {
  myBus.sendNoteOff(channel, pitch, velocity); 
}
