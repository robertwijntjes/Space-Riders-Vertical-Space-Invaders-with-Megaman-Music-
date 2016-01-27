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
  }

  void render()
  {
    stroke(0);
    image(img, x, y, 30, 30);
    fill(150);
    
  }
}

