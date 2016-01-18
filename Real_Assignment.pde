import ddf.minim.*;
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
boolean[] keys = new boolean[512];
boolean roidFall = true;

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

  if (frameCount == 60)
  {

    for (int i = 0; i < 1; i ++)
    {
      Roid roid = new Roid(
      random(25, 675), random(25, 300));
      gameObjects.add(roid);
    }
    frameCount = 0;
  }

  for (int i = gameObjects.size () - 1; i >= 0; i --)
  {
    GameObject runAll = gameObjects.get(i);
    runAll.update();
    runAll.render();
  }
  println("size: " + gameObjects.size());
  collisionRoid();
  collisionShip();
}  

void keyPressed()
{
  keys[keyCode] = true;
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
          if(tis.pos.y - 50 <= other.y && tis.pos.x > other.x && tis.pos.x < other.x + 25  )
          {
            gameObjects.remove(tis);
          }
        }
      }
    }
  }
}


