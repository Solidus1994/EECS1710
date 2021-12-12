PImage img;      
int cellsize = 1; 
int cols, rows;   

void setup() {
  size(142, 200, P3D);
  img = loadImage("1.jpg"); 
  cols = width/cellsize;             
  rows = height/cellsize; 
}

void draw() {
  background(0);
  img.loadPixels();

 
  for (int i = 0; i < cols; i++ ) {

    for (int j = 0; j < rows; j++ ) {
      int x = i*cellsize + cellsize/2; 
      int y = j*cellsize + cellsize/2; 
      int loc = x + y*width;        
      
      color c = img.pixels[loc];       
      
      float z = map(brightness(img.pixels[loc]), 142, 200, 50, mouseX);
      
      
      
      pushMatrix();
      translate(x, y, z); 
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, cellsize, cellsize);
      popMatrix();
    }
  }
}
