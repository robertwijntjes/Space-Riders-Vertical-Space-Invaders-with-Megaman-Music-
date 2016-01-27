import ddf.minim.*;
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
boolean[] keys = new boolean[512];
boolean roidFall = true;
int lives = 10;
int score = 0;
int diffi = 1;
int mode = 0;

Minim minim;
AudioPlayer player;
AudioInput input;

void setup()
{
  size(700, 1000);

  minim = new Minim(this);
  player = minim.loadFile("gunfire.mp3");
  input = minim.getLineIn();

  Ship ship = new Ship( 'W', 'S', 'A', 'D', ' ', width/2, height/1.2f );
  gameObjects.add(ship);
}

void draw()
{
  background(0);
  if(mode == 1)
  {
          if (frameCount == 60)
      {

        for (int i = 0; i < diffi; i ++)
        {
          Roid roid = new Roid(
          random(25, 675), random(25, 300));
          gameObjects.add(roid);
        }
        frameCount = 0;
      }
  }
  switch(mode)
  {
  case 1:
    {

      for (int i = gameObjects.size () - 1; i >= 0; i --)
      {
        GameObject runAll = gameObjects.get(i);
        runAll.update();
        runAll.render();
      }
      collisionRoid();
      collisionShip();
      difficultyCheck();
      collisionRoidsEnd();
      livesCheck();
      if (lives >= 0)
      {
        text("Lives Left: " + lives, 600, 50);
      } else
      {
        text("GAME OVER !", 600, 50);
      }
      text("Score: " +score, 600, 75);
      println(diffi);
    }
  }
}  

void keyPressed()
{
  keys[keyCode] = true;
  if (key >= '0' && key <='9')
  {
    mode = key - '0';
  }
}

void keyReleased()
{
  keys[keyCode] = false;
}  

void collisionRoid()
{
  for (int i = gameObjects.size () - 1; i >= 0; i --)
  {
    GameObject tis = gameObjects.get(i);
    if (tis instanceof Bullet)
    {
      for (int j = gameObjects.size () - 1; j >= 0; j --)
      {
        GameObject other = gameObjects.get(j);
        if (other instanceof Roid)
        {
          if ( tis.pos.y <= other.y && tis.pos.x > other.x && tis.pos.x < other.x + 25  )
          {
            gameObjects.remove(other);
            score++;
          }
        }
      }
    }
  }
}

void collisionShip()
{
  for (int i = gameObjects.size () - 1; i >= 0; i --)
  {
    GameObject tis = gameObjects.get(i);
    if (tis instanceof Ship)
    {
      for (int j = gameObjects.size () - 1; j >= 0; j --)
      {
        GameObject other = gameObjects.get(j);
        if (other instanceof Roid)
        {
          if (tis.pos.y - 50 < other.y && tis.pos.y > other.y && tis.pos.x > other.x && tis.pos.x < other.x + 25  )
          {
            if (lives <= 0)
            {
              gameObjects.remove(tis);
            }
            lives--;
            tis.pos.x = width/2;
            tis.pos.y = height-height/4;
          }
          if (lives <= 0)
          {
            gameObjects.remove(tis);
          }
        }
      }
    }
  }
}
void collisionRoidsEnd()
{
  for (int i = gameObjects.size () - 1; i >= 0; i --)
  {
    GameObject tis = gameObjects.get(i);
    if (tis instanceof Roid)
    {
      if (tis.y + 25 > height)
      {
        lives--;
        gameObjects.remove(tis);
      }
    }
  }
}

void livesCheck()
{
}
void difficultyCheck()
{
  if (score == 35)
  {
    diffi = 2;
  }
  if (score == 75)
  {
    diffi = 3;
  }
  if (score == 150)
  {
    diffi = 4;
  }
  if (score == 200)
  {
    diffi = 5;
  }
}


