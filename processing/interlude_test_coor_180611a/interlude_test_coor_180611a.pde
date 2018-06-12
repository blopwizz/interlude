final float WIDTH = 800.;
final float HEIGHT = 800;
final int NUM_PIXELS = 20;
final float BLOCK_X = WIDTH / NUM_PIXELS;
final float BLOCK_Y = HEIGHT / NUM_PIXELS;
int rank = 0;

void setup() {
  size(1000, 1000);
  textSize((2./3)*BLOCK_X);
  textAlign(CENTER, CENTER);

}

void draw() {
  background(0);

}


void mouseDragged() {
  int xCoor = (int) (mouseX / BLOCK_X);
  int yCoor = (int) (mouseY / BLOCK_Y);
  println(mouseX);
}
