PGraphics canvas;
final int WIDTH = 140;
final int HEIGHT = 140;
final int NUM_PIXELS = 20;

void setup() {
  size(980, 980);
  canvas = createGraphics(139, 139, JAVA2D);
  canvas.noSmooth();
  noSmooth();
}

void draw() {
  canvas.beginDraw();
  canvas.background(0);
  strok(255);
  canvas.translate(-0.5, -0.5);
  canvas.point(50, 50);
  canvas.endDraw();
  image(canvas, 0, 0, width, height);
}
