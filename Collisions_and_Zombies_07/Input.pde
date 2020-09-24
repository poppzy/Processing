boolean resetbuttonDown = false;

void keyPressed()
{
  if (resetbuttonDown == false && key == 'r')
  {
    resetbuttonDown = true;
    init();
  }
}

void keyReleased()
{
  if (key == 'r')
    resetbuttonDown = false;
}
