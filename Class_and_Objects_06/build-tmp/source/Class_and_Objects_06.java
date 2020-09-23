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

public class Class_and_Objects_06 extends PApplet {

float deltaTime;
float time;
Player oscar;
Ball[] enemies;
int enemiesCount = 10;
boolean gameover = false;

public void setup()
{
  frameRate(144);
  
  oscar = new Player();
  enemies = new Ball[enemiesCount];
  for (int i = 0; i < enemiesCount; ++i)
  {
    enemies[i] = new Ball(100, 100, 40, 40, color(random(0, 255), random(0, 255), random (0, 255)));
  }
}
public void draw()
{
  background(220, 50, 50);
  println("speedX: " + oscar.velocityVector.x + "speedY: " + oscar.velocityVector.y);
  long elapsedTime = millis();
  deltaTime = (elapsedTime - time) * 0.001f;
  oscar.move();
  oscar.display();

  for (int i = 0; i < enemiesCount; ++i) 
  {
    Ball enemy = enemies[i];
    enemy.update();
    enemy.display();
    if (roundCollision(enemy.position.x, enemy.position.y, enemy.ballHeight / 2, oscar.ellipsePosition.x, oscar.ellipsePosition.y, oscar.playerWidth / 2))
    {
      gameover = true;
    }
    if (gameover)
    {
      fill (0, 255, 0);
      textSize(64);
      textAlign(CENTER, CENTER);
      text("GAME OVER", width/2, height/2);
    }
  }
  time = elapsedTime;
}
public boolean roundCollision(float x1, float y1, float size1, float x2, float y2, float size2)
{
  float maxDistance = size1 + size2;

  //first a quick check to see if we are too far away in x or y direction
  //if we are far away we dont collide so just return false and be done.
  if (abs(x1 - x2) > maxDistance || abs(y1 - y2) > maxDistance)
  {
    return false;
  }
  //we then run the slower distance calculation
  //dist uses Pythagoras to get exact distance, if we still are to far away we are not colliding.
  else if (dist(x1, y1, x2, y2) > maxDistance)
  {
    return false;
  }
  //We now know the points are closer then the distance so we are colliding!
  else
  {
    return true;
  }
}
class Ball
{
  //Our class variables
  PVector position; //Ball position
  PVector velocity; //Ball direction
  float ballHeight;
  float ballWidth;
  int ballColor;


  //Ball Constructor, called when we type new Ball(x, y);
  Ball(float x, float y, float ballHeight, float ballWidth, int ballColor)
  {
    //Set our position when we create the code.
    position = new PVector(x, y);

    //Create the velocity vector and give it a random direction.
    velocity = new PVector();
    velocity.x = random(11) - 5;
    velocity.y = random(11) - 5;
    this.ballHeight = ballHeight;
    this.ballWidth = ballWidth;
    this.ballColor = ballColor;
  }

  //Update our ball
  public void update()
  {
    position.x += velocity.x;
    position.y += velocity.y;
    ballCollision();
  }

  public void display()
  {
    fill(ballColor);
    ellipse(position.x, position.y, ballHeight, ballWidth);
  }

  public void ballCollision()
  {
    if (position.x > width || position.x < 0)
    {
      velocity.x *= -1; //If the ball touches the end of the screen in x led will bounce back in the other direction
    }
    if (position.y > height || position.y < 0)
    {
      velocity.y *= -1; //If the ball touches the end of the screen in y led will bounce back in the other direction
    }
  }
}
boolean moveLeft;
boolean moveRight;
boolean moveUp;
boolean moveDown;

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

public PVector input()
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
class Player
{
  float acceleration = 2500;
  float friction = 10;
  float maxVelocity = 1500;
  PVector velocityVector;
  PVector ellipsePosition;
  int playerWidth = 70;
  int playerHeight = 70;


  Player()
  {
    ellipsePosition = new PVector(width / 2, height / 2);
    velocityVector = new PVector(0, 0);
  }


  public void move()
  {
    playerCollision();

    PVector moveVector = input();
    moveVector.mult(acceleration * deltaTime);

    if (moveVector.mag() == 0)
    {
      moveVector.x = -velocityVector.x * friction * deltaTime;
      moveVector.y = -velocityVector.y * friction * deltaTime;
    }

    velocityVector.x += moveVector.x;
    velocityVector.y += moveVector.y;

    velocityVector.limit(maxVelocity);
    ellipsePosition.x += velocityVector.x * deltaTime;
    ellipsePosition.y += velocityVector.y * deltaTime;

  }


  public void display()
  {
    fill(35, 90, 255);
    ellipse(ellipsePosition.x, ellipsePosition.y, playerWidth, playerHeight);
  }


  public void playerCollision()
  {
    if (ellipsePosition.x + playerWidth / 2 > width || ellipsePosition.x - playerWidth / 2 < 0)
    {
      velocityVector.x *= -1; //If the ball touches the end of the screen in x led will bounce back in the other direction
    }
    if (ellipsePosition.y + playerHeight / 2 > height || ellipsePosition.y - playerHeight / 2 < 0)
    {
      velocityVector.y *= -1; //If the ball touches the end of the screen in y led will bounce back in the other direction
    }
  }
}
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Class_and_Objects_06" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
