import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Extra2 extends PApplet {

int frame = 0;
int spaceBetweenLines = 10;

public void setup()
{
  
}

public void draw()
{
    //Clear background
  background(255, 255, 255);
  stroke(0, 255, 0);
  strokeWeight(2);

    //Draw our scan lines.
  for (int i = 0; i < 1000; i += spaceBetweenLines)
  {
    	if (i % 3 == 0)
  		{
  			stroke (0, 0, 0, 255);
  		}
      	else
		{
			stroke (0, 0, 0, 50);
		}
    line(0, 1000 - (i + frame) % 1000, (i + frame) % 1000, 0);
    line((i + frame) % 1000,0, 1000, (i + frame) % 1000);
    line(1000, (i + frame) % 1000, 1000 - (i + frame) % 1000, 1000);
    line(1000 - (i + frame) % 1000, 1000, 0, 1000 - (i + frame) % 1000);
  }
  frame ++;
}
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Extra2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
