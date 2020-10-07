public class GameObject {
  
  float x, y;   //Keep track of our positon
  float size;    //our size

  //Keep track if we are alive
  boolean alive = false;

  //Constructor
  public GameObject (float x, float y, float size) {
    //Our X is equal to incoming X, and so forth
    this.x = x;
    this.y = y;
    this.size = size;
  }

  void draw()
  {
    //If we are alive, draw our dot.
    if (alive) {
      rect(x, y, size, size);    
    }
  }
}
