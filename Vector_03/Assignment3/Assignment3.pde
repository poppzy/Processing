PVector pos = new PVector();
PVector dir = new PVector();
float speed = 0.05;
float size = 50;

void setup() 
{
    size(1000, 1000);
    pos.x = width/2;
    pos.y = height/2;
}
void draw()
{
    background(0, 255, 0);
    pos.add(dir);
    ellipse(pos.x, pos.y, size, size);
    fill(255, 0, 0);
    bounce();

    if (mousePressed == true)
    {
        line(pos.x, pos.y, mouseX, mouseY);
    }
}
void bounce()
{
    //Change ball direction at edge
    if (pos.x <= 0 || pos.x >= width)
    {
        dir.x = dir.x * -1;
    }
    if (pos.y <= 0 || pos.y >= height)
    {
        dir.y = dir.y * -1;
    }
}
void mousePressed()
{
    pos.x = mouseX;
    pos.y = mouseY;
    //stop the ball
    dir.x = 0;
    dir.y = 0;
}
void mouseReleased() 
{
    //Get input, calculate new direction and speed
    PVector input = new PVector(mouseX, mouseY);
    dir = input.sub(pos);
    dir = dir.mult(speed);
}
