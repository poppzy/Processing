class Character
{
  //Our class variables
  PVector position; //Character position
  PVector velocity; //Character direction
  float characterHeight;
  float characterWidth;
  color characterColor;
  float size;


  //Human constructor
  Character(float characterHeight, float characterWidth, color characterColor)
  {
    position = new PVector(random(0, width), random(0, height));
    velocity = new PVector();
    velocity.x = random(100, 200);
    velocity.y = random(100, 200);

    if (round(random(1)) == 1)
    {
      velocity.x *= -1;
    }
    if (round(random(1)) == 1)
    {
      velocity.y *= -1;
    }

    this.characterHeight = characterHeight;
    this.characterWidth = characterWidth;
    this.characterColor = characterColor;
    size = characterWidth / 2;
  }


  //Zombie constructor
  Character(float x, float y, float characterHeight, float characterWidth, color characterColor)
  {
    //Set our position when we create the code.
    position = new PVector(x, y);

    //Create the velocity vector and give it a random direction.
    velocity = new PVector();
    velocity.x = random(50, 100);
    velocity.y = random(50, 100);

    if (round(random(1)) == 1)
    {
      velocity.x *= -1;
    }
    if (round(random(1)) == 1)
    {
      velocity.y *= -1;
    }

    this.characterHeight = characterHeight;
    this.characterWidth = characterWidth;
    this.characterColor = characterColor;
    size = characterWidth / 2;
  }


  //Update our character
  void update()
  {
    PVector move = velocity.copy();
    move.mult(deltaTime);
    position.add(move);
    ScreenWrap();
  }


  void display()
  {
    fill(characterColor);
    ellipse(position.x, position.y, characterHeight, characterWidth);
  }

  void ScreenWrap ()
  {
    if (position.x < -size)
      position.x += width + characterWidth;
    else if (position.x > width + size)
      position.x -= width + characterWidth;

    if (position.y < -size)
      position.y += height + characterHeight;
    else if (position.y > height + size)
      position.y -= height + characterHeight;
  }


  boolean foundCollision(Character other)
  {

    float maxDistance = size + other.size;

    //first a quick check to see if we are too far away in x or y direction
    //if we are far away we dont collide so just return false and be done.
    if (abs(position.x - other.position.x) > maxDistance || abs(position.y - other.position.y) > maxDistance)
    {
      return false;
    }
    //we then run the slower distance calculation
    //dist uses Pythagoras to get exact distance, if we still are to far away we are not colliding.
    else if (PVector.dist(position, other.position) > maxDistance)
    {
      return false;
    }
    //We now know the points are closer then the distance so we are colliding!
    else
    {
      return true;
    }
  }
}
