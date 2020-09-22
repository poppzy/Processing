class Ball
{
  //Our class variables
  PVector position; //Ball position
  PVector velocity; //Ball direction
  float ballHeight;
  float ballWidth;
  color ballColor;


  //Ball Constructor, called when we type new Ball(x, y);
  Ball(float x, float y, float ballHeight, float ballWidth, color ballColor)
  {
    //Set our position when we create the code.
    position = new PVector(x, y);

    //Create the velocity vector and give it a random direction.
    velocity = new PVector();
    velocity.x = random(11) - 5;
    velocity.y = random(11) - 5;
    this.ballHeight = ballHeight;
    this.ballWidth = ballWidth;
    this.ballColor = ballColor;
  }

  //Update our ball
  void update()
  {
    position.x += velocity.x;
    position.y += velocity.y;
    ballCollision();
  }

  void display()
  {
    fill(ballColor);
    ellipse(position.x, position.y, ballHeight, ballWidth);
  }

  void ballCollision()
  {
    if (position.x > width || position.x < 0)
    {
      velocity.x *= -1; //If the ball touches the end of the screen in x led will bounce back in the other direction
    }
    if (position.y > height || position.y < 0)
    {
      velocity.y *= -1; //If the ball touches the end of the screen in y led will bounce back in the other direction
    }
  }
}
