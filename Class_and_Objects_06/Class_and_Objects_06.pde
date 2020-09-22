float deltaTime;
float time;
Player oscar;
Ball[] enemies;
int enemiesCount = 10;
boolean gameover = false;

void setup()
{
  frameRate(144);
  size(1000, 1000);
  oscar = new Player();
  enemies = new Ball[enemiesCount];
  for (int i = 0; i < enemiesCount; ++i)
  {
    enemies[i] = new Ball(100, 100, 40, 40, color(random(0, 255), random(0, 255), random (0, 255)));
  }
}
void draw()
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
      textSize(32);
      text("Game Over", 415, 500);
    }
  }
  time = elapsedTime;
}
boolean roundCollision(float x1, float y1, float size1, float x2, float y2, float size2)
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
