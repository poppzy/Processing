int spaceBetweenLines = 10;

void setup()
{
  size(1000, 1000);
}

void draw()
{
    //Clear background
  background(255, 255, 255);
  stroke(0, 255, 0);
  strokeWeight(2);

    //Draw our scan lines.
  for (int i = 0; i < height; i += spaceBetweenLines) 
  {
  	if (i % 3 == 0)
  	{
  		stroke (0, 0, 0, 255);
  	}
	else
	{
		stroke (0, 0, 0, 50);
	}
    line(0, 1000 - i, i, 0);
    line(1000, 1000 - i, 1000 - i, 0);
    line(1000, i, 1000 - i, 1000);
    line(i, 1000, 0, i);
  }
}
