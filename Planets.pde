class Planet {
  float radius;
  float angle;
  float distance;
  float orbitSpeed;
  Planet[] planets;
  PVector v;
  
  PShape globe;
  
  Planet(float r, float d, float o, PImage img) {
    v = PVector.random3D();
    radius = r;
    distance = d;
    orbitSpeed = o;
    v.mult(distance);
    angle = random(-2*PI, 2*PI);
    
    noStroke();
    noFill();
    globe = createShape(SPHERE, radius);
    globe.setTexture(img);
  }
  
  void orbit() {
    angle = angle + orbitSpeed;
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].orbit();
      }
    }
  }
  
  void spawnSatellites(int total,int level) {
    planets = new Planet[total];
    for (int i = 0; i < planets.length; i++) {
      planets[i] = new Planet(random(0.5*radius, 0.7*radius)/level, random(radius/level +radius, 2*(radius/level +radius)), random(-.003, .003), textures[int(random(0, 8))]);
      if (level < 2){
        planets[i].spawnSatellites(int(random(0, 4)), level+1);
      }  
    }
  }
  
  void show() {
    pushMatrix();
    noStroke();
    fill(255);
    PVector v2 = new PVector(1, 0, 1);
    PVector p = v.cross(v2);
    rotate(angle, p.x, p.y, p.z);
    translate(v.x, v.y, v.z);
    shape(globe);
    //sphere(radius);
    if (planets != null){  
      for (int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
    popMatrix();
  }
  
}