import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

Planet sun;

PeasyCam cam;

PImage sunTexture;
PImage[] textures = new PImage[9];

void setup() {
  size(1900, 1080, P3D);
  sunTexture = loadImage("sun.jpg");
  
  textures[0] = loadImage("mercury.jpg");
  textures[1] = loadImage("venus.jpg");
  textures[2] = loadImage("earth.jpg");
  textures[3] = loadImage("mars.jpg");
  textures[4] = loadImage("jupiter.jpg");
  textures[5] = loadImage("saturn.jpg");
  textures[6] = loadImage("uranus.jpg");
  textures[7] = loadImage("neptune.jpg");
  textures[8] = loadImage("pluto.jpg");
  
  cam = new PeasyCam(this, 500);
  sun = new Planet(50, 0, 0, sunTexture);
  sun.spawnSatellites(5, 1);
}

void draw() {
  background(0);
  noLights();
  pointLight(255, 255, 255, 0, 0, 100);
  pointLight(255, 255, 255, 0, 100, 0);
  pointLight(255, 255, 255, 0, 0, -100);
  pointLight(255, 255, 255, 100, 0, 0);
  pointLight(255, 255, 255, -100, 0, 0);
  pointLight(255, 255, 255, 0, -100, 0);
  
  sun.show();
  sun.orbit();
}