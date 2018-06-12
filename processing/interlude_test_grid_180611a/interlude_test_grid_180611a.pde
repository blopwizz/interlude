boolean[][] rects; // twodimensional array, think rows and columns

void setup ()
{
size(300,300);
rects = new boolean[100][100];
fill(0);
noStroke();
}

void draw ()
{
background(255); // clear background with white
for (int r=0; r<100; r++ ) // rows
{
for ( int c = 0; c < 100; c++ ) // columns per row
{
if ( rects[r][c] == true ) // is it on?
{
rect( r*3, c*3, 3, 3 ); // draw it!
}
}
}
}
