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

  void draw()
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


  void update()
  {
    for (int i = 0; i < characters.length; i++) 
    {
      characters[i].update();
    }
  }


  void humanKilled()
  {
    humansAlive--;
    if (humansAlive <= 0)
    {
      endTime = (millis() - startTime) * 0.001f;
    }
  }
}
