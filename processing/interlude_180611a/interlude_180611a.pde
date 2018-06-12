final float WIDTH = 1600;
final float HEIGHT = 1600;
final int NUM_PIXELS = 140;
final float BLOCK_X = WIDTH / NUM_PIXELS;
final float BLOCK_Y = HEIGHT / NUM_PIXELS;
ArrayList<Block> blocks = new ArrayList<Block>();
int rank = 0;

void setup() {
  size(1600, 1600);
  textSize((2./3)*BLOCK_X);
  textAlign(CENTER, CENTER);

  for (int i = 0; i < NUM_PIXELS; i++) {
    for (int j = 0; j < NUM_PIXELS; j++) {
      blocks.add(new Block(i, j));
    }
  }
  blocks.get((NUM_PIXELS/2)*NUM_PIXELS + NUM_PIXELS/2 ).eventClicked(rank);
  rank += 1;
}

void draw() {
  background(0);
  for (int k = 0; k < blocks.size(); k++) {
    blocks.get(k).render();
  }
}


void mouseDragged() {
  int xCoor = (int) (mouseX / BLOCK_X);
  int yCoor = (int) (mouseY / BLOCK_Y);
  if ((xCoor<NUM_PIXELS)&&(yCoor<NUM_PIXELS)) {
    Block b = blocks.get(xCoor*NUM_PIXELS + yCoor);
    if (b.isNotClicked()) {
      b.eventClicked(rank);
      rank += 1;
    }
  }
}
