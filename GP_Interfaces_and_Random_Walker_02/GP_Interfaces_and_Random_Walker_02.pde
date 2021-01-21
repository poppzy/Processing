//This file is only for testing your movement/behavior.
//The Walkers will compete in a different program!

WalkerInterface walker;
PVector walkerPos;

void setup() 
{
  frameRate(165);
  size(640, 480);
  /*rect(width / 2, height / 2, 20, 20);*/

  //Create a walker from the class Example it has the type of WalkerInterface
  walker = new OscWil();

  walkerPos = walker.getStartPosition(width, height);
}

void draw() 
{
  point(walkerPos.x, walkerPos.y);
  walkerPos.add(walker.update());
}
