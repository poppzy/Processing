int frame = 0;
int numberOfPoints = 100;

float posX;
float posY;

void setup()
{
  size(640, 480);
  strokeWeight(10);
}

void draw()
{
  clearBackground();
  posX = width / 2;
  posY = height / 2;
  sineCurve();
  cosCurve();
  Circle(100);

  frame++;
}

void clearBackground()
{
  background(0);
}

void sineCurve()
{
  for (int i = 0; i < numberOfPoints; ++i)
  {
    stroke(random(100, 255), random(100, 255), random(100, 255));
    point(i * 24, height / 2 + sin((frame * 0.025) + (i * 0.100)) * 200);  
  }
}

void cosCurve()
{
  for (int i = 0; i < numberOfPoints; ++i)
  {
    stroke(random(100, 255), random(100, 255), random(100, 255));
    point(i * 24, height / 2 + cos((frame * 0.025) + (i * 0.100) + radians(90)) * 200);  
  }
}

void Circle(int numberOfPoints)
{
	float direction = 0;
  float v = 200;

	for (int i = 0; i < numberOfPoints; ++i) 
	{
  stroke(random(100, 255), random(100, 255), random(100, 255));
  
	float dX = cos(direction) * v;
	float dY = sin(direction) * v;

	direction += (TWO_PI) * 2 / numberOfPoints * frame * 0.005f;

	point(posX + dX * (float) i / numberOfPoints, posY + dY * (float) i / numberOfPoints);
	}
}
