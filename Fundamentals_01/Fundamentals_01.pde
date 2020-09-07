void setup()
{
  size(768, 432);
}

void draw()
{
  background(100, 100, 100);
  stroke(0, 0, 0);
  strokeWeight(10);
  drawO();
  drawS();
  drawC();
  drawA();
  drawR();
}
void drawO()
{
	noFill();
	ellipse(161, 207, 112, 201);
}
void drawS()
{
	arc(290, 159, 100, 100, 1.54, 5.36);
  arc(290, 258, 100, 100, -1.54, 3.06);
}
void drawC()
{
	arc(417, 209, 130, 198, 1.06, 5.18);
}
void drawA()
{
	line(530, 115, 469, 300);
  line(530, 115, 598, 300);
  line(568, 220, 497, 220);
}
void drawR()
{
  line(625, 110, 625, 305);
  arc(603, 165, 170, 113, 4.98, 7.56);
  line(625, 219, 688, 304);
}
