class Player
{
  float acceleration = 700;
  float friction = 550;
  float maxVelocity = 1000;
  PVector velocityVector;
  PVector ellipsePosition;
  int playerWidth = 70;
  int playerHeight = 70;
  boolean b = true;

  Player()
  {
    ellipsePosition = new PVector(width / 2, height / 2);
    velocityVector = new PVector(0, 0);
  }

  void move()
  {
    playerCollision();

    if (!moveLeft)
    {
      if (velocityVector.x < 0)
      {
        velocityVector.x += friction * deltaTime;
        if (velocityVector.x > 0) 
        {
          velocityVector.x = 0;
        }
      }
    }
    if (!moveRight)
    {
      if (velocityVector.x > 0)
      {
        velocityVector.x -= friction * deltaTime;
        if (velocityVector.x < 0)
        {
          velocityVector.x = 0;
        }
      }
    }
    if (!moveUp)
    {
      if (velocityVector.y < 0)
      {
        velocityVector.y += friction * deltaTime;
        if (velocityVector.y > 0) 
        {
          velocityVector.y = 0;
        }
      }
    }
    if (!moveDown)
    {
      if (velocityVector.y > 0)
      {
        velocityVector.y -= friction * deltaTime;
        if (velocityVector.y < 0)
        {
          velocityVector.y = 0;
        }
      }
    }
    if (moveLeft)
    {
      if (velocityVector.x <= -maxVelocity)
      {
        velocityVector.x = -maxVelocity;
      } else 
      {
        velocityVector.x -= acceleration * deltaTime;
      }
    }
    if (moveRight)
    {
      if (velocityVector.x >= maxVelocity)
      {
        velocityVector.x = maxVelocity;
      } else 
      {
        velocityVector.x += acceleration * deltaTime;
      }
    }
    if (moveUp)
    {
      if (velocityVector.y <= -maxVelocity)
      {
        velocityVector.y = -maxVelocity;
      } else 
      {
        velocityVector.y -= acceleration * deltaTime;
      }
    }
    if (moveDown)
    {
      if (velocityVector.y >= maxVelocity)
      {
        velocityVector.y = maxVelocity;
      } else 
      {
        velocityVector.y += acceleration * deltaTime;
      }
    }
  }
  void display()
  {
    velocityVector.limit(8 / deltaTime);
    ellipsePosition.x += velocityVector.x * deltaTime;
    ellipsePosition.y += velocityVector.y * deltaTime;
    fill(35, 90, 255);
    ellipse(ellipsePosition.x, ellipsePosition.y, playerWidth, playerHeight);
  }
  void playerCollision()
  {
    if (ellipsePosition.x + playerWidth / 2 > width || ellipsePosition.x - playerWidth / 2 < 0)
    {
      velocityVector.x *= -1; //If the ball touches the end of the screen in x led will bounce back in the other direction
    }
    if (ellipsePosition.y + playerHeight / 2 > height || ellipsePosition.y - playerHeight / 2 < 0)
    {
      velocityVector.y *= -1; //If the ball touches the end of the screen in y led will bounce back in the other direction
    }
  }
}
