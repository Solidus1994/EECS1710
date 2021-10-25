int xspeed = 10;
int yspeed = 5;
float xpos;
float ypos;
 
void setup() {
  size(1280, 720, P2D);
  
  background(255,255,255);
 
  fill(random(255), random(255),random(255));
  
  noStroke();
 
  xpos = 20;
  ypos = 20;
}
 
void draw() {
 
  xpos = xpos + xspeed;
  if (xpos+20 > 1280 || xpos-20 < 0) {
  xspeed *= -1;
  }
 
  ypos = ypos + yspeed;
  if (ypos+15 > 720 || ypos-15 < 0) {
  yspeed *= -1;
  }
 
  ellipseMode(CENTER);
  
  ellipse(xpos,ypos,50,50);
}
 
void mousePressed() {
  fill(random(255), random(255), random(255));
}
