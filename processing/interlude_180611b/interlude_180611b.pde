final float WIDTH = 282;
final float HEIGHT = 2;
final int NUM_PIXELS = 141;
final float BLOCK_X = WIDTH / NUM_PIXELS;
final float BLOCK_Y = HEIGHT / NUM_PIXELS;
ArrayList<Block> blocks = new ArrayList<Block>();
int rank = -1;
PVector[] mapLeds = new PVector[1400];
Table table;

void setup() {
  size(1600, 1600);
  textSize((2./3)*BLOCK_X);
  textAlign(CENTER, CENTER);

  for (int i = 0; i < NUM_PIXELS; i++) {
    for (int j = 0; j < NUM_PIXELS; j++) {
      blocks.add(new Block(i, j));
    }
  }

  table = new Table();
  table.addColumn("rank");
  table.addColumn("x");
  table.addColumn("y");

  blocks.get((NUM_PIXELS/2)*NUM_PIXELS + NUM_PIXELS/2 ).eventClicked(rank);
  rank += 1;
  TableRow newRow = table.addRow();
  newRow.setInt("rank", rank);
  newRow.setInt("x", NUM_PIXELS/2);
  newRow.setInt("y", NUM_PIXELS/2);
}

void draw() {
  background(0);
  for (int k = 0; k < blocks.size(); k++) {
    blocks.get(k).render();
  }
  drawFPS();
  drawRank();
}


void mouseDragged() {
  int xCoor = (int) (mouseX / BLOCK_X);
  int yCoor = (int) (mouseY / BLOCK_Y);
  if ((xCoor<NUM_PIXELS)&&(yCoor<NUM_PIXELS)) {
    Block b = blocks.get(xCoor*NUM_PIXELS + yCoor);
    if (b.isNotClicked()) {
      b.eventClicked(rank);
      rank += 1;
      TableRow newRow = table.addRow();
      newRow.setInt("rank", rank);
      newRow.setInt("x", xCoor);
      newRow.setInt("y", yCoor);
    }
  }
}

void keyPressed() {
  if (key == 's') {
    saveTable(table, "data/interlude.csv");
    println("saved!");
  }
  if (key == BACKSPACE) {
    int n = table.getRowCount();
    TableRow lastRow = table.getRow(n-1);
    int x = lastRow.getInt("x");
    int y = lastRow.getInt("y");
    Block b = blocks.get(x*NUM_PIXELS + y);
    b.undo();
    table.removeRow(n-1);
    rank -= 1;
  }
}
