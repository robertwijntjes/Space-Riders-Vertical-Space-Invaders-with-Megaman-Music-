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
    //Asteroid Physics.
  }

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
  }
  //Asteroid class as Images..as it holds the same physics of a square.
  //Self drawn Asteroids..
}

