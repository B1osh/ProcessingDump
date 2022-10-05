//Planet(float x1, float y1, float rad1, float mass1, color col1)

float bigG = 0.98;
Planet sun, earth, mars, venus, mercury;
ArrayList <Planet> solarsystem;
int test = 1;

void setup() {
  size(600, 600);
  background(160, 160, 255);
  noStroke();
  //noLoop();

  sun = new Planet(300, 300, 30, 2 * pow(10, 1), color(255));
  earth = new Planet(450, 300, 6, 6 * pow(10, -5), color(0, 127, 255));
  mars = new Planet(527, 300, 3.4, 7 * pow(10, -6), color(255, 127, 0));
  venus = new Planet(408, 300, 5, 5 * pow(10, -4), color(255, 0, 0));
  mercury = new Planet(358, 300, 5, 3 * pow(10, -6), color(122));

  earth.vel.y = 0.35;
  mars.vel.y = 0.28;
  venus.vel.y = 0.41;
  mercury.vel.y = 0.55;

  ArrayList <Planet> solarsysteminit = new ArrayList <Planet>();
  solarsysteminit.add(sun);
  solarsysteminit.add(earth);
  solarsysteminit.add(mars);
  solarsysteminit.add(venus);
  solarsysteminit.add(mercury);
  solarsystem = solarsysteminit;

  //solarsystem = randomSystem(10);
}


void draw() {
  fill(160, 160, 255, 10);
  rect(0, 0, width, height);
  //friction(solarsystem);
  solarsystem = doEverything(solarsystem);
  if(solarsystem.size() == 1) {
    println(solarsystem.get(0).x, solarsystem.get(0).y);
    noLoop();
  }
}

void mousePressed() {
  
}

void keyPressed() {
  if (key == 'r') {
    size(600, 600);
    background(160, 160, 255);
    noStroke();
    //noLoop();
    frameRate(600);

    sun = new Planet(300, 300, 30, 2 * pow(10, 1), color(255));
    earth = new Planet(450, 300, 6, 6 * pow(10, -5), color(0, 127, 255));
    mars = new Planet(527, 300, 3.4, 7 * pow(10, -6), color(255, 127, 0));
    venus = new Planet(408, 300, 5, 5 * pow(10, -4), color(255, 0, 0));
    mercury = new Planet(358, 300, 5, 3 * pow(10, -6), color(122));

    earth.vel.y = 0.35;
    mars.vel.y = 0.28;
    venus.vel.y = 0.41;
    mercury.vel.y = 0.55;

    ArrayList <Planet> solarsysteminit = new ArrayList <Planet>();
    solarsysteminit.add(sun);
    solarsysteminit.add(earth);
    solarsysteminit.add(mars);
    solarsysteminit.add(venus);
    solarsysteminit.add(mercury);
    solarsystem = solarsysteminit;

    //solarsystem = randomSystem(10);
  } else if (keyCode == UP) {
    test ++;
  } else if (keyCode == DOWN) {
    test --;
  } else if (key == 'p') {
    background(160, 160, 255);
    loop();
     solarsystem = randomSystem(100);
    //Planet temp = new Planet(random(-width, 0), random(-height, 0), random(width/50, width/10), random(pow(10, -7), 10), color(255));
    //temp.vel.x = random(0.0, 0.5);
    //temp.vel.y = random(0.0, 0.5);
    //solarsystem.add(temp);

    //temp = new Planet(random(width, width * 2), random(-height, 0), random(width/50, width/10), random(pow(10, -7), 10), color(255));
    //temp.vel.x = random(-0.5, 0.0);
    //temp.vel.y = random(0.0, 0.5);
    //solarsystem.add(temp);

    //temp = new Planet(random(width, width* 2), random(height, height * 2), random(width/50, width/10), random(pow(10, -7), 10), color(255));
    //temp.vel.x = random(-0.5, 0.0);
    //temp.vel.y = random(-0.5, 0.0);
    //solarsystem.add(temp);

    //temp = new Planet(random(-width, 0), random(height, height * 2), random(width/50, width/10), random(pow(10, -7), 10), color(255));
    //temp.vel.x = random(0.0, 0.5);
    //temp.vel.y = random(-0.5, 0.0);
    //solarsystem.add(temp);
  }
}
