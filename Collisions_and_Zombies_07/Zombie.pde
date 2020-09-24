public class Zombie extends Character
{
  public Zombie(float x, float y, float characterHeight, float characterWidth, color characterColor) 
  {
    super(x, y, characterHeight, characterWidth, characterColor);
  }


  void update()
  {
    super.update();
    lookingForHumans();
  }


  void lookingForHumans()
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
