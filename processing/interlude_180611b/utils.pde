void drawFPS() {
  pushStyle();
  fill(255, 0, 0);
  textSize(15);
  text((int)frameRate, 15, 15);
  popStyle();
}

void drawRank() {
  pushStyle();
  fill(255, 255, 255);
  textSize(15);
  text(rank, 15, 35);
  popStyle();
}
