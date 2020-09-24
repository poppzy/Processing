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

public class Collisions_and_Zombies_07 extends PApplet {

CharacterManager characterManager;
int enemiesCount = 10;
boolean gameover = false;


public void setup()
{
  frameRate(144);
  
  init();
}


public void draw()
{
  background(220, 50, 50);
  Updatedeltatime();
  characterManager.update();
  characterManager.draw();
}


public void init()
{
  startTime = millis();
  characterManager = new CharacterManager(99, 1);
}
class Character
{
  //Our class variables
  PVector position; //Character position
  PVector velocity; //Character direction
  float characterHeight;
  float characterWidth;
  int characterColor;
  float size;


  //Human constructor
  Character(float characterHeight, float characterWidth, int characterColor)
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
  Character(float x, float y, float characterHeight, float characterWidth, int characterColor)
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
  public void update()
  {
    PVector move = velocity.copy();
    move.mult(deltaTime);
    position.add(move);
    ScreenWrap();
  }


  public void display()
  {
    fill(characterColor);
    ellipse(position.x, position.y, characterHeight, characterWidth);
  }

  public void ScreenWrap ()
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


  public boolean foundCollision(Character other)
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
public class CharacterManager
{
	Character[] characters;
	int humansAlive;

	CharacterManager(int numberOfHumans, int numberOfZombies)
	{
		characters = new Character[numberOfHumans + numberOfZombies];
		for (int i = 0; i < numberOfHumans; i++)
		{
			characters[i] = new Human(40, 40, color(random(128, 255), 0, 0));
		}


		for (int i = numberOfHumans; i < characters.length; i++)
		{
			characters[i] = new Zombie(width / 2, height / 2, 40, 40, color(0, random(128, 255), 0));
		}

		humansAlive = numberOfHumans;
	}

	public void draw()
	{
		for (int i = 0; i < characters.length; i++) 
		{
			characters[i].display();
		}

		if (humansAlive <= 0)
		{
		fill (0);
      	textSize(64);
      	textAlign(CENTER);
      	text("GAME OVER\nTOTAL TIME: " + endTime, width/2, height/2);
		}
	}


	public void update()
	{
		for (int i = 0; i < characters.length; i++) 
		{
			characters[i].update();
		}
	}


	public void humanKilled()
	{
		humansAlive--;
		if (humansAlive <= 0)
		{
			endTime = (millis() - startTime) * 0.001f;
		}
	}
}
public class Human extends Character
{
	public Human(float characterHeight, float characterWidth, int characterColor) 
	{
		super(characterHeight, characterWidth, characterColor);
	}
}
boolean resetbuttonDown = false;

public void keyPressed()
{
	if (resetbuttonDown == false && key == 'r')
  	{
    	resetbuttonDown = true;
		init();
  	}
}

public void keyReleased()
{
	if (key == 'r')
		resetbuttonDown = false;
}
float deltaTime;
float time;
float startTime;
float endTime;

public void Updatedeltatime()
{
	long elapsedTime = millis();
	deltaTime = (elapsedTime - time) * 0.001f;
	time = elapsedTime;
}
public class Zombie extends Character
{
	public Zombie(float x, float y, float characterHeight, float characterWidth, int characterColor) 
	{
		super(x, y, characterHeight, characterWidth, characterColor);
	}


	public void update()
	{
		super.update();
		lookingForHumans();
	}


	public void lookingForHumans()
	{	
		Character[] characters = characterManager.characters;

		for (int i = 0; i < characters.length; i++) 
		{
			if (characters[i] instanceof Human)
			{
				if (foundCollision(characters[i]))
				{
					Zombie newZombie = new Zombie(characters[i].position.x, characters[i].position.y, characters[i].characterHeight, characters[i].characterWidth, color(0, random(128, 255), 0));
					characters[i] = newZombie;
					characterManager.humanKilled();
				}
			}
		}
	}
}
  public void settings() {  size(1920, 1080); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Collisions_and_Zombies_07" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
