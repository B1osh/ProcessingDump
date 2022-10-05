

class Planet {

  float rad, vol, mass, x, y, dens;
  PVector vel, acc;
  color col;


  Planet(float x1, float y1, float rad1, float mass1, color col1) {
    x = x1;
    y = y1;
    rad = rad1;
    mass = mass1;
    col = col1;
    vol = 4 * PI * rad1 * rad1 * rad1 / 3;
    dens = mass1 / vol;
    vel = new PVector(0.0, 0.0);
    acc = new PVector(0.0, 0.0);
  }

  void display() {
    fill(col);
    ellipse(x, y, rad*2, rad*2);
  }

  void move() {
    vel.add(acc);
    x += vel.x;
    y += vel.y;
    acc.x = 0;
    acc.y = 0;
  }

  void update(boolean doColour) {
    vol = 4.0/3.0 * PI * rad * rad * rad;
    dens = mass/vol;
    if (doColour) {
      col = color(map(mass, pow(10, -7), 100, 255, 0));
    }
  }
}

ArrayList <Planet> calcGrav(ArrayList <Planet> system) {
  ArrayList <Planet> returnP = system;
  for (int i = 0; i < returnP.size() - 1; i++) {
    for (int j = i + 1; j < returnP.size(); j++) {
      float dista = dist(system.get(i).x, system.get(i).y, system.get(j).x, system.get(j).y);
      //dista *= 1000;
      float force = bigG * system.get(i).mass * system.get(j).mass / pow(dista, 2);
      returnP.get(i).acc.x += cos(getAngle(new PVector(system.get(i).x + 1, system.get(i).y), new PVector(system.get(i).x, system.get(i).y), new PVector(system.get(j).x, system.get(j).y))) * force / system.get(i).mass;
      returnP.get(i).acc.y += sin(getAngle(new PVector(system.get(i).x + 1, system.get(i).y), new PVector(system.get(i).x, system.get(i).y), new PVector(system.get(j).x, system.get(j).y))) * force / system.get(i).mass;
      returnP.get(j).acc.x += cos(getAngle(new PVector(system.get(j).x + 1, system.get(j).y), new PVector(system.get(j).x, system.get(j).y), new PVector(system.get(i).x, system.get(i).y))) * force / system.get(j).mass;
      returnP.get(j).acc.y += sin(getAngle(new PVector(system.get(j).x + 1, system.get(j).y), new PVector(system.get(j).x, system.get(j).y), new PVector(system.get(i).x, system.get(i).y))) * force / system.get(j).mass;
    }
  }
  return returnP;
}

ArrayList <Planet> collisions(ArrayList <Planet> system) {
  ArrayList <Planet> returnP = system;
  for (int i = 0; i < returnP.size() - 1; i++) {
    for (int j = i + 1; j < returnP.size(); j++) {
      if (dist(system.get(i).x, system.get(i).y, system.get(j).x, system.get(j).y) < max(system.get(i).rad, system.get(j).rad)) {
        float n = system.get(i).vol;
        float m = system.get(j).vol;
        returnP.get(i).x = (m * system.get(j).x + n * system.get(i).x) / (m + n);
        returnP.get(i).y = (m * system.get(j).y + n * system.get(i).y) / (m + n);
        returnP.get(i).mass += returnP.get(j).mass;
        
        returnP.get(i).rad = pow(pow(system.get(i).rad, 3) + pow(system.get(j).rad, 3), 1.0/3.0);
        returnP.get(i).vel.x = (system.get(i).vel.x * system.get(i).mass + system.get(j).vel.x * system.get(j).mass) / (2 * (system.get(i).mass + system.get(j).mass) );
        returnP.get(i).vel.y = (system.get(i).vel.y * system.get(i).mass + system.get(j).vel.y * system.get(j).mass) / (2 * (system.get(i).mass + system.get(j).mass) ); 
        returnP.remove(j);
        //system.remove(j);
        i = 0;
      }
    }
  }
  return returnP;
}



ArrayList <Planet> friction(ArrayList <Planet> system) {
  ArrayList <Planet> returnP = system;
  for (int i = 0; i < system.size(); i++) {
    returnP.get(i).vel.x *= 0.99;
    returnP.get(i).vel.y *= 0.99;
  }
  return returnP;
}

ArrayList <Planet> randomSystem(int size) {
  ArrayList <Planet> returnP = new ArrayList <Planet>(size);
  for (int i = 0; i < size; i++) {
    Planet temp1 = new Planet(random(0, width), random(0, height), random(width/50, width/10), random(pow(10, -7), 10), color(255));
    returnP.add(temp1);
  }
  return returnP;
}

ArrayList <Planet> doEverything(ArrayList <Planet> system) {
  system = calcGrav(system);
  system = collisions(system);
  for (int i = 0; i < system.size(); i++) {
    system.get(i).update(false);
    system.get(i).move();
    system.get(i).display();
  }
  return system;
}
