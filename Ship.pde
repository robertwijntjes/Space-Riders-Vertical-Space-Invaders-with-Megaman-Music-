class Ship extends GameObject
{
  char forwards;
  char backwards;
  char left;
  char right;
  char fire;
  int shipSpeed = 5;

  Ship()
  {
    //super(width * 0.5f, height  * 0.5f, 50);
  }

  Ship(char forwards, char backwards, char left, char right, char fire, float startX, float startY)
  {
    super(startX, startY, 50);
    this.backwards = backwards;
    this.forwards = forwards;
    this.left = left;
    this.right = right;
    this.fire = fire;
  }

  int elapsed = 12;

  void update()
  {
    forward.y = - cos(1);
    forward.mult(speed);
    if (pos.y > height/3)
    {
      if (keys[forwards])
      {
        pos.y = pos.y - shipSpeed;
      }
    }
    if (keys[backwards])
    {
      if (pos.y < height-25)
      {
        pos.y = pos.y + shipSpeed;
      }
    }  
    if (keys[left])
    {
      pos.x = pos.x - shipSpeed;  
    }
    if (keys[right])
    {
      pos.x = pos.x + shipSpeed;
    }      

    if (keys[fire]  && elapsed > 12)
    {
      Bullet bullet = new Bullet();
      bullet.pos.x = pos.x;
      bullet.pos.y = pos.y;
      bullet.pos.add(PVector.mult(forward, 6));
      bullet.colour = colour;
      bullet.theta = theta;
      gameObjects.add(bullet);
      elapsed = 0;

      player.play();
      player = minim.loadFile("gunfire.mp3");
    }
    if (pos.x < 0)
    {
      pos.x = width;
    }

    if (pos.x > width)
    {
      pos.x = 0;
    }
    elapsed ++;
    //All the ships controls aswell as sound effects for generation of a bullet.
  }

  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);    
    stroke(0, 100, 255);
    image(img4,0,0);
    popMatrix();
    //Renders the ship as an image
  }
}

