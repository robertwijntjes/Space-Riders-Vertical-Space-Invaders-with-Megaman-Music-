class Roid extends GameObject
{

  Roid(float x, float y)
  {
    this.rRoid = rRoid = random(1,4);
    this.rRoid = round(rRoid);
    this.x = x;
    this.y = y;
  }

  void update()
  {
    y++;
  }
  //sends roid up towards the screen and then is removed and life --1.
  void render()
  {
    stroke(0);
    if(rRoid == 1)
    {
      image(img, x + 15, y, 30, 30);
    }
    if(rRoid == 2)
    {
      image(img2, x + 15, y, 30, 30);
    }
    if(rRoid == 3)
    {
      image(img3, x + 15, y, 30, 30);
    }
    if(rRoid == 4)
    {
      image(img7, x + 15, y, 30, 30);
    }
    
  }
  //Asteroid class as Images..as it holds the same physics of a square.
  //Self drawn Asteroids..and spawns using processing random generator and rounding.
}

