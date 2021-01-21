class OscWil implements WalkerInterface {

  float localX;
  float localY;
  float localPlayAreaWidth;
  float localPlayAreaHeight;
  PVector playerPosition;
  //Add your own variables here.
  //Do not use processing variables like width or height

  String getName()
  {
    return "WINhelmsson"; //When asked, tell them our walkers name
  }

  PVector getStartPosition(int playAreaWidth, int playAreaHeight)
  {
    //Select a starting position or use a random one.
    float x = (int) random(0, playAreaWidth);
    float y = (int) random(0, playAreaHeight);

    localX = x;
    localY = y;
    localPlayAreaWidth = playAreaWidth;
    localPlayAreaHeight = playAreaHeight;

    println("localX: "+localX);
    println("localY: "+localY);
    //Använd playAreaWidth/Height för att hålla koll på väggar
    playerPosition = new PVector((int)localX, (int)localY);
    //a PVector holds floats but make sure its whole numbers that are returned!
    return new PVector((int)x, (int)y);
  }

  PVector update()
  {
    //add your own walk behavior for your walker here.
    //Make sure to only use the outputs listed below.

    if (playerPosition.x + 1 == localPlayAreaWidth) 
    {
      playerPosition.x --;
      return new PVector(-1, 0);
    } else if (playerPosition.x - 1 == 0) 
    {
      playerPosition.x ++;
      return new PVector(1, 0);
    } else if (playerPosition.y + 1 == localPlayAreaHeight) 
    {
      playerPosition.y --;
      return new PVector(0, -1);
    } else if (playerPosition.y - 1 == 0) 
    {
      playerPosition.y ++;
      return new PVector(0, 1);
    } 
    else 
    {
      switch((int)random(0, 4)) 
      {
      case 0:
        playerPosition.x --;
        return new PVector(-1, 0);
      case 1:
        playerPosition.x ++;
        return new PVector(1, 0);
      case 2:
        playerPosition.y ++;
        return new PVector(0, 1);
      default:
        playerPosition.y --;
        return new PVector(0, -1);
      }
    }
  }
}

//All valid outputs:
// PVector(-1, 0);
// PVector(1, 0);
// PVector(0, 1);
// PVector(0, -1);

//Any other outputs will kill the walker!
