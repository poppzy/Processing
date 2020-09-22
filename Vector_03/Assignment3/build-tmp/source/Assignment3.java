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

public class Assignment3 extends PApplet {

PVector pos = new PVector();
PVector dir = new PVector();
float speed = 0.05f;
float size = 50;

public void setup() 
{
    
    pos.x = width/2;
    pos.y = height/2;
}
public void draw()
{
    background(0, 255, 0);
    pos.add(dir);
    ellipse(pos.x, pos.y, size, size);
    fill(255, 0, 0);
    bounce();

    if (mousePressed == true)
    {
        line(pos.x, pos.y, mouseX, mouseY);
    }
}
public void bounce()
{
    //Change ball direction at edge
    if (pos.x <= 0 || pos.x >= width)
    {
        dir.x = dir.x * -1;
    }
    if (pos.y <= 0 || pos.y >= height)
    {
        dir.y = dir.y * -1;
    }
}
public void mousePressed()
{
    pos.x = mouseX;
    pos.y = mouseY;
    //stop the ball
    dir.x = 0;
    dir.y = 0;
}
public void mouseReleased() 
{
    //Get input, calculate new direction and speed
    PVector input = new PVector(mouseX, mouseY);
    dir = input.sub(pos);
    dir = dir.mult(speed);
}
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Assignment3" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
