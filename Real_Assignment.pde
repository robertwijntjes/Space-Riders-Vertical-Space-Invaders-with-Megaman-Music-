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

  Ship ship = new Ship('W', 'S', 'A', 'D', ' ', 200, height / 2);
  gameObjects.add(ship);
}

void draw()
{
  background(0);

  if (frameCount == 60)
  {

    for (int i = 0; i < 2; i ++)
    {
      Roid roid = new Roid(
      random(10, 700), random(10, 300));
      gameObjects.add(roid);
    }
    frameCount = 0;
  }

  for (int i = gameObjects.size () - 1; i >= 0; i --)
  {
    GameObject go = gameObjects.get(i);
    go.update();
    go.render();
    /*if(gameObjects.get(i).pos.x)
    {
    }*/
  }
}  

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}  


