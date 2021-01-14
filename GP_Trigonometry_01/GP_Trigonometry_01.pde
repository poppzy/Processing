int frame = 0;
int numberOfPoints = 100;

void setup()
{
  size(640, 480);
  strokeWeight(10);
}

void draw()
{
  clearBackground();
  sineCurve();
  cosCurve();
  frame++;
}

void clearBackground()
{
  background(0);
}

void sineCurve()
{
  stroke(255);
  
  for (int i = 0; i < numberOfPoints; ++i)
  {
    point(i * 7, height / 2 + sin((frame * 0.025) + (i * 0.100)) * 200);  
  }
}

void cosCurve()
{
  stroke(255, 0, 0);

  for (int i = 0; i < numberOfPoints; ++i)
  {
    point(i * 7, height / 2 + cos((frame * 0.025) + (i * 0.100) + radians(90)) * 200);  
  }
}
