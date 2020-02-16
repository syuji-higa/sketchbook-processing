float frame = 0;

void setup() {
  surface.setLocation(0,0);
  size(512, 512);
  blendMode(SCREEN);
  colorMode(HSB);
  background(50);
  smooth();
}

void draw() {
  background(50);
    
  // const
  float k = random(1, 10) / random(1, 10);
  
  float theta = 0.0;
  float x0, x1, y0, y1;
  float r;
  
  float centerX = width / 2;
  float centerY = height / 2;
  float radius = max(centerX, centerY);
  
  // centering
  translate(centerX, centerY);

  stroke(random(360), 50, 255, 50);
  
  float step = random(1, 10);

  float len = 360 * 10;
  float scale = 0.8;

  for(float i = 0; len > i; i++){
    // calc start point
    r = radius * sin(k * theta) * scale;
    x0 = r * cos(theta);
    y0 = r * sin(theta);
    
    // move point
    theta += step;
    
    // calc end point
    r = radius * sin(k * theta) * scale;
    x1 = r * cos(theta);
    y1 = r * sin(theta);
    
    // draw
    line(x0, y0, x1, y1);
  }
  
  //String path = "D:/Desktop/processing-dest/sketch-" + int(frame) + ".png";
  //saveFrame(path);
  
  frame++;
}
