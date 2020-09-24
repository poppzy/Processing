CharacterManager characterManager;
int enemiesCount = 10;
boolean gameover = false;


void setup()
{
  frameRate(144);
  size(1920, 1080);
  init();
}


void draw()
{
  background(220, 50, 50);
  Updatedeltatime();
  characterManager.update();
  characterManager.draw();
}


void init()
{
  startTime = millis();
  characterManager = new CharacterManager(99, 1);
}