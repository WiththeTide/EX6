import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

float b;
void setup() {
  size(1200, 900);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  video.start();
}

void draw() {
  println(b);
  if(b>150){
 background(255); 
  }
  else{
   background(0); 
  }
  scale(2);
  opencv.loadImage(video);

  noFill();
  stroke(0,255,0);
  strokeWeight(1);
  Rectangle[] faces = opencv.detect();

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  b=faces[i].x;    
  }

}

void captureEvent(Capture c) {
  c.read();
}
