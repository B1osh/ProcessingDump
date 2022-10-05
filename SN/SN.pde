
final int gridW = 16;
final int gridH = 9;

Snake snake;
Apple apple;



void setup() {
  size(800, 500);
  rectMode(CENTER);
  noStroke();
  textAlign(LEFT, CENTER);
  
  
  
  snake = new Snake();
  apple = new Apple(snake);
  
}


void draw() {
  background(#333333);
  fill(#464646);
  rect(width/2, height/2, gridW*snake.wid, gridH*snake.wid);
  snake.work(apple);
}
