// Length of strings
float r1 = 100;
float r2 = 200;

// Mass of bobs
float m1 = 20;
float m2 = 40;

// Absolute vertical angles of string
float theta1 = PI / 4;
float theta2 = PI / 2;

// Velocity and accelration of bobs
float v1 = 0.01;
float v2 = 0.1;
// ! Don't use high values. Values near or greater than 1 are considered high
// Using high values will result in jagged lines


// Line trace
PGraphics trace;
float pastX1 = 0;
float pastY1 = 0;
float pastX2 = 0;
float pastY2 = 0;


void setup() {
  size(800, 800);
  
  // Trace init
  trace = createGraphics(800, 800);
  trace.beginDraw();
  trace.background(20);
  trace.endDraw();
}

void draw() {
  // background
  image(trace, 0, 0);
  
  stroke(74, 209, 98);
  strokeWeight(2);
  
  translate(400, 400);
  
  fill(255);
  rect(- 10, - 10, 20, 10);
  
  fill(74, 209, 98);
  // (x, y) of bob1 -> draw line from (0, 0) + bob
  float x1 = r1 * sin(theta1);
  float y1 = r1 * cos(theta1);
  line(0, 0, x1, y1);
  ellipse(x1, y1, m1, m1);  // radius = m1
  
  // (x, y) of bob2 -> draw line from (x1, y1) + bob
  float x2 = x1 + r2 * sin(theta2);
  float y2 = y1 + r2 * cos(theta2);
  line(x1, y1, x2, y2);
  ellipse(x2, y2, m2, m2);  // radius = m2
  
  // Animate. v -> theta 
  theta1 += v1;
  theta2 += v2;
  
  // Trace
  trace.beginDraw();
  trace.translate(400, 400);
  trace.stroke(255);
  trace.strokeWeight(2);
  if (frameCount > 1) {
    trace.line(pastX1, pastY1, x1, y1);
    trace.line(pastX2, pastY2, x2, y2);
  }
  trace.endDraw();
  
  pastX1 = x1;
  pastX2 = x2;
  pastY1 = y1;
  pastY2 = y2;
}
