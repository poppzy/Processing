GameObject[][] cells;    //Our game grid matrix
float cellSize = 10;    //Size of our cells
int numberOfColums;
int numberOfRows;
int fillPercentage = 15;  //Number of starting dots

void setup() {
  size(512, 512);    //Set game Size
  rectMode(CENTER);  //set correct mode for our dots (so they stay in frame)
  frameRate(4);    //Low framerate makes it easier to test.

  //Calculate our grid depending on size and cellSize
  numberOfColums = (int)Math.floor(width/cellSize);
  numberOfRows = (int)Math.floor(height/cellSize);

  //Initiate our matrix
  cells = new GameObject[numberOfColums][numberOfRows];

  //For each row
  for (int y = 0; y < numberOfRows; ++y) {
    //for each column in each row
    for (int x = 0; x < numberOfColums; ++x) {
      //Create our game objects, multiply by cellSize for correct placement
      cells[x][y] = new GameObject(x * cellSize, y * cellSize, cellSize);

      //Random if it should be alive
      if (random(0, 100) < fillPercentage) {
        cells[x][y].alive = true;
      }
    }
  }
}

void draw() {
  //For each row
  for (int y = 0; y < numberOfRows; ++y) {
    //for each column in each row
    for (int x = 0; x < numberOfColums; ++x) {
      //Draw current cell
      cells[x][y].draw();
    }
  }
}
