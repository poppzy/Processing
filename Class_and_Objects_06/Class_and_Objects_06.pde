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
      textSize(64);
      textAlign(CENTER, CENTER);
      text("GAME OVER", width/2, height/2);
    }
  }
  time = elapsedTime;
}

