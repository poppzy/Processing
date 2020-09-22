boolean moveLeft;
boolean moveRight;
boolean moveUp;
boolean moveDown;
float acceleration = 700;
float friction = 550;
float maxVelocity = 1000;
float deltaTime;
float time;
PVector velocityVector;
PVector ellipsePosistion;

void setup()
{
	frameRate(144);
	size(1000,1000);
	velocityVector = new PVector(0, 0);
	ellipsePosistion = new PVector(width / 2, height / 2);
}
void draw()
{
	long elapsedTime = millis();
	deltaTime = (elapsedTime - time) * 0.001f;
	background(220, 50, 50);

	if (!moveLeft)
	{
		if (velocityVector.x < 0)
		velocityVector.x += friction * deltaTime;
	}
	if (!moveRight)
	{
		if (velocityVector.x > 0)
		velocityVector.x -= friction * deltaTime;
	}
	if (!moveUp)
	{
		if (velocityVector.y < 0)
		velocityVector.y += friction * deltaTime;
	}
	if (!moveDown)
	{
		if (velocityVector.y > 0)
		velocityVector.y -= friction * deltaTime;
	}
	if (moveLeft)
	{
		if (velocityVector.x <= -maxVelocity)
		{
			velocityVector.x = -maxVelocity;
		}
		else 
		{
			velocityVector.x -= acceleration * deltaTime;
		}
	}
	if (moveRight)
	{
		if (velocityVector.x >= maxVelocity)
		{
			velocityVector.x = maxVelocity;
		}
		else 
		{
			velocityVector.x += acceleration * deltaTime;
		}
	}
	if (moveUp)
	{
		if (velocityVector.y <= -maxVelocity)
		{
			velocityVector.y = -maxVelocity;
		}
		else 
		{
			velocityVector.y -= acceleration * deltaTime;
		}
	}
		if (moveDown)
	{
		if (velocityVector.y >= maxVelocity)
		{
			velocityVector.y = maxVelocity;
		}
		else 
		{
			velocityVector.y += acceleration * deltaTime;
		}
	}
	velocityVector.limit(8 / deltaTime);
	ellipsePosistion.x += velocityVector.x * deltaTime;
	ellipsePosistion.y += velocityVector.y * deltaTime;
	ellipse(ellipsePosistion.x, ellipsePosistion.y, 70, 70);
	fill(35, 90, 255);
	time = elapsedTime;
}
