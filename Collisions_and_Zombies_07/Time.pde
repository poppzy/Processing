float deltaTime;
float time;
float startTime;
float endTime;

public void Updatedeltatime()
{
  long elapsedTime = millis();
  deltaTime = (elapsedTime - time) * 0.001f;
  time = elapsedTime;
}
