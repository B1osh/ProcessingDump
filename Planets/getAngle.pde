//FINDS ANGLE abc

float getAngle(PVector a, PVector b, PVector c) {
  
  float angle = degrees(PVector.angleBetween(a.sub(b), c.sub(b)));
  a.add(b);
  c.add(b);
  if(c.y < b.y) {
    angle = 360 - angle;
  }
  
  return radians(angle) % TWO_PI;
  
}
