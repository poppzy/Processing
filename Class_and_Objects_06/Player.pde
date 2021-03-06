class Player
{
  float acceleration = 2500;
  float friction = 10;
  float maxVelocity = 1500;
  PVector velocityVector;
  PVector ellipsePosition;
  int playerWidth = 70;
  int playerHeight = 70;


  Player()
  {
    ellipsePosition = new PVector(width / 2, height / 2);
    velocityVector = new PVector(0, 0);
  }


  void move()
  {
    playerCollision();

    PVector moveVector = input();
    moveVector.mult(acceleration * deltaTime);

    if (moveVector.mag() == 0)
    {
      moveVector.x = -velocityVector.x * friction * deltaTime;
      moveVector.y = -velocityVector.y * friction * deltaTime;
    }

    velocityVector.x += moveVector.x;
    velocityVector.y += moveVector.y;

    velocityVector.limit(maxVelocity);
    ellipsePosition.x += velocityVector.x * deltaTime;
    ellipsePosition.y += velocityVector.y * deltaTime;

  }


  void display()
  {
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
