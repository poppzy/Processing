GameObject[][] cells;
GameObject[][] cellsBuffer;
float cellSize = 10;
int numberOfColumns;
int numberOfRows;
int aliveNeighbors;
int fillPercentage = 15; //Number of starting cells


void setup()
{
  size(1000, 1000);
  rectMode(CORNER);
  frameRate(4);

  init();
}

void init()
{
  numberOfColumns = (int)Math.floor(width / cellSize);
  numberOfRows = (int)Math.floor(height / cellSize);

  //Initiate
  cells = new GameObject[numberOfColumns][numberOfRows];
  cellsBuffer = new GameObject[numberOfColumns][numberOfRows];

  //For each row
  for (int y = 0; y < numberOfRows; y++)
  {
    //For each column in each row
    for (int x = 0; x < numberOfColumns; x++)
    {
      //Create our game object, multiply by cellSize for correct placement
      cells[x][y] = new GameObject(new PVector(x, y).mult(cellSize));
      cellsBuffer[x][y] = new GameObject(new PVector(x, y).mult(cellSize));

      //Random if it should be alive
      if (random(0, 100) < fillPercentage) 
      {
        cells[x][y].alive = true;
      }
    }
  }
}

void draw()
{
  background(50);


  //Check for alive neighbors
  for (int y = 1; y < numberOfRows - 1; y++) 
  {
    for (int x = 1; x < numberOfColumns - 1; x++)
    {
    	aliveNeighbors = 0;
    	
      //If neighbor above is alive, add one to aliveNeighbors
      if (cells[x][y-1].alive) 
      {
      	aliveNeighbors++;
      }
      //If neighbor below is alive, add one to aliveNeighbors
      if (cells[x][y+1].alive) 
      {
      	aliveNeighbors++;	
      }
      //If neighbor to the right is alive, add one to aliveNeighbors
      if (cells[x+1][y].alive) 
      {
      	aliveNeighbors++;	
      }
      //If neighbor below to the right is alive, add one to aliveNeighbors
      if (cells[x+1][y+1].alive)
      {
      	aliveNeighbors++;
      }
      //If neighbor above to the right is alive, add one to aliveNeighbors
      if (cells[x+1][y-1].alive) 
      {
      	aliveNeighbors++;
      }
      //If neighbor to the left is alive, add one to aliveNeightbors
      if (cells[x-1][y].alive) 
      {
      	aliveNeighbors++;	
      }
      //If neighbor below to the left is alive, add one to aliveNeighbors
      if (cells[x-1][y+1].alive)
      {
      	aliveNeighbors++;
      }
      //If neighbor above to the left is alive, add one to aliveNeighbors
      if (cells[x-1][y-1].alive)
      {
      	aliveNeighbors++;
      }


      if (aliveNeighbors < 2 || aliveNeighbors > 3)
      {
      	cellsBuffer[x][y].alive = false;
      }
      else if (aliveNeighbors == 3) 
      {
      	cellsBuffer[x][y].alive = true;	
      }
    }
  }

  for (int y = 0; y < numberOfRows; y++)
  {
    //For each column
    for (int x = 0; x < numberOfColumns; x++) 
    {
      //Draw our cell
      cells[x][y].alive = cellsBuffer[x][y].alive;
    }
  }

  //For each row
  for (int y = 0; y < numberOfRows; y++)
  {
    //For each column
    for (int x = 0; x < numberOfColumns; x++) 
    {
      //Draw our cell
      cells[x][y].draw();
    }
  }
}