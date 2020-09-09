int spaceBetweenLines = 10;

void setup()
{
  size(1000, 1000);
}

void draw()
{
    //Clear background
  background(255, 255, 255);
  stroke(0, 0, 0);
  strokeWeight(2);

    //Draw our scan lines.
  for (int i = 0; i < height; i += spaceBetweenLines) 
  {
  	if (i % 3 == 0)
  	{
  		stroke (0, 0, 0, 200);
  	}
	else
	{
		stroke (0, 0, 0, 50);
	}
    line(height, i, i, 0);
    line(i, height, 0, i);
    line(height, i, height - i, height);
    line(0, height - i, i, 0);
  }
}
