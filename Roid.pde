class Roid extends GameObject
{

  Roid(float x, float y)
  {
    this.rRoid = rRoid = random(1,3);
    this.rRoid = round(rRoid);
    this.x = x;
    this.y = y;
  }

  void update()
  {
    y++;
    println(rRoid);
  }

  void render()
  {
    stroke(0);
    image(img, x, y, 30, 30);
  }
}

