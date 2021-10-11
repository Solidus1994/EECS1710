float rotation = 0;
int lastSecond = 0;
int lastMinute = 0;
int lastHour = 0;

float faceSize = 800;
float faceSizeZ = 8000;
float faceSizeZZ = 60000;

color outlineCol = color(0);
color secondCol = color(200, 0, 0);
color faceCol = color(156);

float offset = TWO_PI * -0.28;

PImage clock_face, sun, moon;

void setup() {
  size(1500, 1000, P2D); 
  strokeWeight(2);
  clock_face = loadImage("map.jpg");
  sun = loadImage("sun.jpg");
  moon = loadImage("moon.png");
  imageMode(CENTER);
}

void draw() {
  int s = second();
  int m = minute();
  int h = hour();
  
  rotation = TWO_PI * ((float) h/24 + (float) m/(24*60) + (float) s/(24*60*60));
  
  fill(faceCol);
  stroke(outlineCol);
  rect(0, 0, width, height);
  
  //zoom-in #1
  for(int i=0; i<(24*60); i++) {
    float rot = ((float) i/(24*60)) * TWO_PI;
    pushMatrix();
    translate(2*width/3+250, 250);
    translate(faceSizeZ*cos(rotation-TWO_PI/4)/2, faceSizeZ*sin(rotation-TWO_PI/4)/2);
    rotate(rot);
    line(0, faceSizeZ/2-50, 0, faceSizeZ/2);
    popMatrix();
  } 
  pushMatrix();
  translate(2*width/3+250, 250);
  translate(faceSizeZ*cos(rotation-TWO_PI/4)/2, faceSizeZ*sin(rotation-TWO_PI/4)/2);
  rotate(rotation);
  stroke(250, 0, 0);
  line(0, 0, 0, faceSizeZ/2);
  popMatrix();
  
   //zoom-in #2
  for(int i=0; i<(24*60); i++) {
    float rot = ((float) i/(24*60)) * TWO_PI;
    pushMatrix();
    translate(2*width/3+250, 750);
    translate(faceSizeZZ*cos(rotation-TWO_PI/4)/2, faceSizeZZ*sin(rotation-TWO_PI/4)/2);
    rotate(rot);
    stroke(0);
    line(0, faceSizeZZ/2-50, 0, faceSizeZZ/2);
    popMatrix();
  }
  pushMatrix();
  translate(2*width/3+250, 750);
  translate(faceSizeZZ*cos(rotation-TWO_PI/4)/2, faceSizeZZ*sin(rotation-TWO_PI/4)/2);
  rotate(rotation);
  stroke(250, 0, 0);
  line(0, 0, 0, faceSizeZZ/2);
  popMatrix();
  
  //clear
  fill(255);
  rect(0, 0, 2*width/3, height);
  
  //main clock face
  stroke(0, 127, 255);
  for(int i=0; i<24; i++) {
    float rot = ((float) i/24) * TWO_PI;
    pushMatrix();
    translate(width/3, height/2);
    rotate(rot);
    line(0, faceSize/2-50, 0, faceSize/2);
    popMatrix();
  }
  pushMatrix();
  translate(width/3, height/2);
  rotate(rotation);
  rotate(offset); //rotation of the map for toronto
  image(clock_face, 0, 0, 500, 500);
  rotate(-offset);
  line(0, 0, 0, faceSize/2);
  stroke(0, 0, 200);
  noFill(); 
  ellipse(0, 0, faceSize, faceSize);
  popMatrix();
  
  fill(faceCol);
  ellipse(width/3, height/2, 10, 10);
}
