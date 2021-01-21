class OscWil implements WalkerInterface {

  float localX;
  float localY;
  float localPlayAreaWidth;
  float localPlayAreaHeight;
  PVector playerPosition;
  boolean[][] hasBeenHere;
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

    hasBeenHere = new boolean [playAreaWidth][playAreaHeight];


    //Använd playAreaWidth/Height för att hålla koll på väggar
    playerPosition = new PVector((int)localX, (int)localY);

    hasBeenHere[(int)playerPosition.x][(int)playerPosition.y] = true;

    //a PVector holds floats but make sure its whole numbers that are returned!
    return new PVector((int)x, (int)y);
  }

  PVector update()
  {
    boolean up = false;
    boolean down = false;
    boolean left = false;
    boolean right = false;


    if (playerPosition.x + 1 == localPlayAreaWidth)
    {
      playerPosition.x --;
      hasBeenHere[(int)playerPosition.x][(int)playerPosition.y] = true;
      return new PVector(-1, 0);
    } 
    else if (playerPosition.x - 1 == 0) 
    {
      playerPosition.x ++;
      hasBeenHere[(int)playerPosition.x][(int)playerPosition.y] = true;
      return new PVector(1, 0);
    } 
    else if (playerPosition.y + 1 == localPlayAreaHeight) 
    {
      playerPosition.y --;
      hasBeenHere[(int)playerPosition.x][(int)playerPosition.y] = true;
      return new PVector(0, -1);
    } 
    else if (playerPosition.y - 1 == 0) 
    {
      playerPosition.y ++;
      hasBeenHere[(int)playerPosition.x][(int)playerPosition.y] = true;
      return new PVector(0, 1);
    }




    if (!hasBeenHere[(int)playerPosition.x + 1][(int)playerPosition.y]) 
    {
      right = true;
    }
    if (!hasBeenHere[(int)playerPosition.x - 1][(int)playerPosition.y]) 
    {
      left = true;
    }
    if (!hasBeenHere[(int)playerPosition.x][(int)playerPosition.y - 1]) 
    {
      up = true;
    }
    if (!hasBeenHere[(int)playerPosition.x][(int)playerPosition.y + 1]) 
    {
      down = true;
    }

    if (right || left || up || down) 
    {
      for (int i = 0; i < 100; ++i) 
      {
        switch((int)random(0, 4)) 
        {
        case 0:
          if (left) 
          {
            playerPosition.x --;
            hasBeenHere[(int)playerPosition.x][(int)playerPosition.y] = true;
            return new PVector(-1, 0);
          }
        case 1:
          if (right) 
          {
            playerPosition.x ++;
            hasBeenHere[(int)playerPosition.x][(int)playerPosition.y] = true;
            return new PVector(1, 0);
          }
        case 2:
          if (down) 
          {
            playerPosition.y ++;
            hasBeenHere[(int)playerPosition.x][(int)playerPosition.y] = true;
            return new PVector(0, 1);
          }
        default:
          if (up) 
          {
            playerPosition.y --;
            hasBeenHere[(int)playerPosition.x][(int)playerPosition.y] = true;
            return new PVector(0, -1);
          }
        }
      }
    }
    //TODO - Make the walker walk twenty steps towards middle;


    {
      switch((int)random(0, 4)) 
      {
      case 0:
        playerPosition.x --;
        hasBeenHere[(int)playerPosition.x][(int)playerPosition.y] = true;
        return new PVector(-1, 0);
      case 1:
        playerPosition.x ++;
        hasBeenHere[(int)playerPosition.x][(int)playerPosition.y] = true;
        return new PVector(1, 0);
      case 2:
        playerPosition.y ++;
        hasBeenHere[(int)playerPosition.x][(int)playerPosition.y] = true;
        return new PVector(0, 1);
      default:
        playerPosition.y --;
        hasBeenHere[(int)playerPosition.x][(int)playerPosition.y] = true;
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
