public class GameObject
{
  PVector position = new PVector();

  float size;

  color aliveColor = color(0, 255, 0);
  color deadColor = color(0);
  
  boolean alive = false;
  
  public GameObject (PVector position)
  {
    //Our PVector position is equal to incoming position, and so forth
    this.position = position;
  }
  
  void draw()
  {
    //If we are alive, draw our dot
    if (alive)
    {
      fill(aliveColor);
    }
    else 
    {
      fill(deadColor);
    }
    rect(position.x, position.y, cellSize, cellSize);
  }
}
