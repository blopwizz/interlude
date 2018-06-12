class Block {
  int i, j;
  boolean clicked = false;
  int rank;

  Block(int i, int j) {
    this.i = i;
    this.j = j;
  }

  void eventClicked(int rank) {
    this.rank = rank;
    clicked = true;
  }

  void render() {
    if (!clicked) {
      fill(0);
      rect(i*BLOCK_X, j*BLOCK_Y, (i + 1)*BLOCK_X, (j + 1)*BLOCK_Y);
    } else {
      fill(255);
      rect(i*BLOCK_X, j*BLOCK_Y, (i + 1)*BLOCK_X, (j + 1)*BLOCK_Y);
      fill(0);
    }
  }

  boolean isNotClicked() {
    return !clicked;
  }
}
