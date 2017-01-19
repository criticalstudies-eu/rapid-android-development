
import ketai.camera.*;
KetaiCamera cam;
PShape boxShape;
PImage sphereTexture;

void setup() {
  size(displayWidth, displayHeight, P3D);
  orientation(LANDSCAPE);
  noStroke();
  fill(255);

  boxShape = createShape(BOX, height/2);

  cam = new KetaiCamera(this, 640, 480, 30);              // 1
  cam.setCameraID(1);                                     // 2
}

void draw() {
  background(0);

  translate(width/2, height/2, 0);  
  rotateY(PI * frameCount / 500);
  shape(boxShape);
}

void onCameraPreviewEvent()
{
  cam.read();
  boxShape.setTexture(cam);                                // 3
}

void mousePressed()
{
  if (cam.isStarted())
  {
    cam.stop();
  } else
  {
    cam.start();
  }
}