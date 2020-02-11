float widthHerf, heightHerf, maxLen;
float points[][] = new float[50][4];
float lineLen = 10;
float maxLineLenRate = 5;

void setup() {
  size(512, 512);
  background(0);
  smooth();
  colorMode(HSB);

  widthHerf = width / 2;
  heightHerf = height / 2;
  maxLen = sqrt(pow(widthHerf, 2) + pow(heightHerf, 2));

  for (int i = 0; points.length > i; i++) {
    int axis = int(random(2));
    float len = (int(random(2))*2-1) * lineLen * int(random(1, maxLineLenRate));
    points[i][0] = 0; // x1
    points[i][1] = 0; // y1
    points[i][2] = axis == 0 ? len : 0; // x2
    points[i][3] = axis == 1 ? len : 0; // y2
  }
}

void draw() {
  blendMode(BLEND);
  fill(0, 10);
  rect(0, 0, width, height);

  blendMode(SCREEN);

  translate(widthHerf, heightHerf);
  rotate(HALF_PI / 2);

  for (int i = 0; points.length > i; i++) {
    PVector p1 = new PVector(points[i][0], points[i][1]);
    PVector p2 = new PVector(points[i][2], points[i][3]);

    stroke(360 * (float(i) / points.length), 50, 255);
    line(p1.x, p1.y, p2.x, p2.y);

    points[i][0] = p2.x;
    points[i][1] = p2.y;

    PVector dir = new PVector(p2.x - p1.x, p2.y - p1.y).normalize();
    float len = lineLen * int(random(1, maxLineLenRate));

    float root = (int(random(2))*2-1);
    dir.rotate(HALF_PI * root);
    p2.add(dir.mult(len));

    if (p2.x < -maxLen || maxLen < p2.x || p2.y < -maxLen || maxLen < p2.y) {
      p2.sub(dir.mult(2));
    }

    points[i][2] = p2.x;
    points[i][3] = p2.y;
  }
}
