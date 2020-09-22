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

public class Input_and_Motion_04 extends PApplet {

boolean moveLeft;
boolean moveRight;
boolean moveUp;
boolean moveDown;
float acceleration = 700;
float friction = 550;
float maxVelocity = 1000;
float deltaTime;
float time;
PVector velocityVector;
PVector ellipsePosistion;

public void setup()
{
	frameRate(144);
	
	velocityVector = new PVector(0, 0);
	ellipsePosistion = new PVector(width / 2, height / 2);
}
public void draw()
{
	long elapsedTime = millis();
	deltaTime = (elapsedTime - time) * 0.001f;
	background(220, 50, 50);

	if (!moveLeft)
	{
		if (velocityVector.x < 0)
		velocityVector.x += friction * deltaTime;
	}
	if (!moveRight)
	{
		if (velocityVector.x > 0)
		velocityVector.x -= friction * deltaTime;
	}
	if (!moveUp)
	{
		if (velocityVector.y < 0)
		velocityVector.y += friction * deltaTime;
	}
	if (!moveDown)
	{
		if (velocityVector.y > 0)
		velocityVector.y -= friction * deltaTime;
	}
	if (moveLeft)
	{
		if (velocityVector.x <= -maxVelocity)
		{
			velocityVector.x = -maxVelocity;
		}
		else 
		{
			velocityVector.x -= acceleration * deltaTime;
		}
	}
	if (moveRight)
	{
		if (velocityVector.x >= maxVelocity)
		{
			velocityVector.x = maxVelocity;
		}
		else 
		{
			velocityVector.x += acceleration * deltaTime;
		}
	}
	if (moveUp)
	{
		if (velocityVector.y <= -maxVelocity)
		{
			velocityVector.y = -maxVelocity;
		}
		else 
		{
			velocityVector.y -= acceleration * deltaTime;
		}
	}
		if (moveDown)
	{
		if (velocityVector.y >= maxVelocity)
		{
			velocityVector.y = maxVelocity;
		}
		else 
		{
			velocityVector.y += acceleration * deltaTime;
		}
	}
	velocityVector.limit(8 / deltaTime);
	ellipsePosistion.x += velocityVector.x * deltaTime;
	ellipsePosistion.y += velocityVector.y * deltaTime;
	ellipse(ellipsePosistion.x, ellipsePosistion.y, 70, 70);
	fill(35, 90, 255);
	time = elapsedTime;
}
//Key pressed, set our variables to true
public void keyPressed()
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
public void keyReleased()
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
  public void settings() { 	size(1000,1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Input_and_Motion_04" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
