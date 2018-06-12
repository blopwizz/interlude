final int NUM_PIXELS = 141;

int rank = -1;
PVector[] mapLeds = new PVector[1400];
Table table;

int m_width = 800;
int m_height = 800;
PImage canvasBuffer = createImage(m_width, m_height, ARGB);

void setup() {
  size(1600, 1600);


  canvasBuffer.loadPixels();
  for (int i = 0; i < canvasBuffer.pixels.length; ++i) {
    canvasBuffer.pixels[i] = color(0, 0, 0);
  }
  canvasBuffer.updatePixels();


  table = new Table();
  table.addColumn("rank");
  table.addColumn("x");
  table.addColumn("y");

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
  paint(mouseX, mouseY, color(0, 0, 0, 1));

  //rank += 1;
  //TableRow newRow = table.addRow();
  //newRow.setInt("rank", rank);
  //newRow.setInt("x", xCoor);
  //newRow.setInt("y", yCoor);
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
    table.removeRow(n-1);
    rank -= 1;
  }
}


void paint(int x, int y, color c) {
  int localx = x / 7; 
  int localy = y / 7 ;
  draw7x7square(canvasBuffer, 
    localx, localy, 1, c);
}

private void draw7x7square(PImage buf, int _x, int _y, int _scale, color c) {
  int gridlock = 7 * _scale;
  int ibound = (_x * gridlock) + gridlock;
  int jbound = (_y * gridlock) + gridlock;
  for (int i = _x * gridlock; i < ibound; ++i) {
    for (int j = _y * gridlock; j < jbound; ++j) {
      buf.set(i, j, c);
    }
  }
}


private class LayerSave {
  LayerSave(PImage buf, int x, int y, int scale) {
    int gridlock = 7 * scale;

    lx = x * gridlock;
    ux = (x + 1) * gridlock;
    ly = y * gridlock;
    uy = (y + 1) * gridlock;

    int num_cols = ux - lx;
    int num_rows = uy - ly;
    save_buf = new color[num_cols * num_rows];
    for (int r = 0; r < num_rows; ++r) {
      for (int c = 0; c < num_cols; ++c) {
        save_buf[r * num_cols + c] = buf.get(c + lx, r + ly);
      }
    }
  }

  void restore(PImage buf) {
    int num_cols = ux - lx;
    int num_rows = uy - ly;
    for (int r = 0; r < num_rows; ++r) {
      for (int c = 0; c < num_cols; ++c) {
        buf.set(c + lx, r + ly, save_buf[r * num_cols + c]);
      }
    }
  }

  private int lx;
  private int ux;
  private int ly;
  private int uy;
  private color[] save_buf;
}
