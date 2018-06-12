PImage imgLedMask;
int[] aMapLed = new int[1400];
Table tableMap;
int iMap = 0;
int cMap = 0;

void setup() {
  size(141, 141);
  imgLedMask = loadImage("interlude.png");
  tableMap = new Table();
  tableMap.addColumn("i");
  tableMap.addColumn("loc");

  loadPixels();
  imgLedMask.loadPixels();
  for (int y = 0; y < height; y++) {
    for (int x =0; x < width; x++) {
      int loc = x + y * width;
      float r = red(imgLedMask.pixels[loc]);
      float g = green(imgLedMask.pixels[loc]);
      float b = blue(imgLedMask.pixels[loc]);
      if ((r==255) && (g==255) && (b==255)) {
        aMapLed[iMap] = loc;
        TableRow newRow = tableMap.addRow();
        newRow.setInt("i", iMap);
        newRow.setInt("loc", loc);
        iMap +=1;
      } else {
        pixels[loc] = color(r, g, b);
      }
    }
  }
  for (int k = 0; k<aMapLed.length; k++) {
    pixels[aMapLed[k]] = color(255, 0, 0);
    if (aMapLed[k] != 0) {
      cMap +=1;
    }
  }
  updatePixels();
  noLoop();
  println("map length: "+ cMap);
  saveTable(tableMap, "interludeMap.csv");
  println("saved!");
}

void draw() {
}
