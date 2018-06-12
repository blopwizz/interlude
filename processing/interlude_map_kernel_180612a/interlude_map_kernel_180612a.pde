PImage pic;
Table tableStructure;
int[] structure = new int[1400];
int[] colorsLed = new int[1400];

void setup() {
  // load structure of installation (table of loc = x + y * width)
  tableStructure = loadTable("interludeMap.csv");
  for (TableRow row : tableStructure.rows()) {
    structure[row.getInt("i")] = row.getInt("loc");
  }

  // load image
  pic = loadImage("data/stars_000.png");
  loadPixels();
  pic.loadPixels();
  for (int i = 0; i < structure.length; i ++) {
    int ledLocation = structure[i];
    float r = red(pic.pixels[ledLocation]);
    float g = green(pic.pixels[ledLocation]);
    float b = blue(pic.pixels[ledLocation]);
    colorsLed[i] = color(r, g, b);
    
  }
}
