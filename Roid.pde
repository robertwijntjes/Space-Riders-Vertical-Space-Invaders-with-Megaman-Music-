class Roid extends GameObject
{
  Roid(float x, float y)
  {
    this.x = x;
    this.y = y;
  }

  void update()
  {
    y++;
    if(y + 30 > height)
    {
      gameObjects.remove(this);
    }
  }

  void render()
  {
    stroke(0);
    rect(x, y, 30, 30);
  }
}

