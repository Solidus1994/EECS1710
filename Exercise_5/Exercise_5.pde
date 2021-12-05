import processing.sound.*;

SoundFile soundfile;

void setup() {
  size(640, 640);
  background(255);

  soundfile = new SoundFile(this, "1.mp3");

  println("SFSampleRate= " + soundfile.sampleRate() + " Hz");
  println("SFSamples= " + soundfile.frames() + " samples");
  println("SFDuration= " + soundfile.duration() + " seconds");

  soundfile.loop();
}      

void draw() {
  background (171112);

  float playbackSpeed = map(mouseX, 0, width, 0.1, 10.0);
  soundfile.rate(playbackSpeed);

  float amplitude = map(mouseY, 0, height, 0, 1.0);
  soundfile.amp(amplitude);

  float panning = map(mouseY, 0, height, -1.0, 1.0);
  soundfile.pan(panning);
}
