// The class name starts with uppercase
class Ship extends GameObject
{
  // Fields!
  char forwards;
  char backwards;
  char left;
  char right;
  char fire;
  int shipSpeed = 5;
  
  // Constructor!!
  // HAS NO RETURN TYPE
  // Name is always the same as the class
  Ship()
  {
    // Constructor chaining. Call a constructor in the super class
    super(width * 0.5f, height  * 0.5f, 50);     
    println("In Ship DEfault Constructor");
  }
  
  Ship(char forwards,char backwards,char left, char right, char fire, float startX, float startY)
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
    forward.x = sin(theta);
    forward.y = - cos(theta);
    forward.mult(speed);
    if(pos.y > height/3)
    {
      if (keys[forwards])
      {
        pos.y = pos.y - shipSpeed;
      }    
    }
    if(keys[backwards])
    {
      if(pos.y < height-25)
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
      // Create a new bullet instance and add it to the arraylist of bullets
      Bullet bullet = new Bullet();
      bullet.pos.x = pos.x;
      bullet.pos.y = pos.y;
      bullet.pos.add(PVector.mult(forward, 6));
      bullet.c = c;
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
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);    
    stroke(0,100,255);
    line(- halfW, halfW, 0, - halfW);
    line(0, - halfW, halfW, halfW);
    line(halfW, halfW, 0, 0);
    line(- halfW, halfW, 0, 0);
    popMatrix();
  }   
}
