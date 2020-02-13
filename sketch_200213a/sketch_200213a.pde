float frame = 0;
PImage offscr;

void setup() {
  offscr = createImage(width, height, RGB);
  size(512, 512);
  background(255);
  smooth();
  noStroke();
  colorMode(HSB);
}

void draw() {
  float centerX = width * 0.5;
  float centerY = height * 0.5;
  
  translate(centerX, centerY);
  rotate(PI * 0.015);
  scale(1.05);
  translate(-centerX, -centerY);
  
  loadPixels();
  offscr.pixels = pixels;
  offscr.updatePixels();
  
  tint(255, 240);
  image(offscr, 0, 0, width, height);
  
  translate(centerX, centerY);
  
  for(int i = 0; i < 5; i++) {
    fill(random(360), 70, 255);
    float size = random(5, 20);
    float r = random(sqrt(pow(centerX, 2) + pow(centerY, 2))) * 0.8;
    float a = random(360);
    float x = r * cos(a);
    float y = r * sin(a);
    ellipse(
      random(-x, x), 
      random(-y, y),
      size,
      size
    );
  }
  
  frame++;
}
