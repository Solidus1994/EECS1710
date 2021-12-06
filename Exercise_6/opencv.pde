import gab.opencv.*;
import java.awt.Rectangle;

OpenCV i;
Rectangle[] faces;
boolean armUpdateOpenCV = false;

void setupOpenCV() {
  i = new OpenCV(this, videoWidth, videoHeight);
  i.loadCascade(OpenCV.CASCADE_FRONTALFACE); 
  faces = new Rectangle[0];
}

void updateOpenCV() {
  if (armUpdateOpenCV) {
    i.loadImage(capture);
    
    buffer.beginDraw();
    buffer.image(capture, 0, 0);
    buffer.filter(GRAY);
    buffer.endDraw();
    
    faces = i.detect();
    
    armUpdateOpenCV = false;
  }
}
