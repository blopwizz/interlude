void drawFPS() {
  pushStyle();
  stroke(255, 0, 0);
  fill(255, 0, 0);
  textSize(15);
  text((int)frameRate, 15, 15);
  popStyle();
}
