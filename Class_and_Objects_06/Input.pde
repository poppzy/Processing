boolean moveLeft;
boolean moveRight;
boolean moveUp;
boolean moveDown;

//Key pressed, set our variables to true
void keyPressed()
{
  if (keyCode == LEFT || key == 'a')
    moveLeft = true;
  else if (keyCode == RIGHT || key == 'd')
    moveRight = true;
  else if (keyCode == UP || key == 'w')
    moveUp = true;
  else if (keyCode == DOWN || key == 's')
    moveDown = true;
}

//When a key is released, we will set our variable to false
void keyReleased()
{
  if (keyCode == LEFT || key == 'a')
    moveLeft = false;
  else if (keyCode == RIGHT || key == 'd')
    moveRight = false;
  else if (keyCode == UP || key == 'w')
    moveUp = false;
  else if (keyCode == DOWN || key == 's')
    moveDown = false;
}

PVector input()
{
  PVector input = new PVector();

  if (moveLeft)
      input.x += -1;

  if (moveRight) 
    input.x +=  1;

  if (moveUp)    
    input.y += -1;

  if (moveDown)  
    input.y +=  1;

  input.normalize();
  return input;
}
