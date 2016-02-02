import ddf.minim.*;

ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
boolean[] keys = new boolean[512];
boolean roidFall = true;
int lives = 10;
int score = 0;
int diffi = 1;
int mode = 0;
int highscore = 0;
PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;


Minim minim;
AudioPlayer player;
AudioInput input;
AudioPlayer intro;
AudioPlayer title;

void setup()
{
  size(700, 1000);

  minim = new Minim(this);
  player = minim.loadFile("gunfire.mp3");
  title = minim.loadFile("title.mp3");
  intro = minim.loadFile("intro.mp3");
  input = minim.getLineIn();
  img = loadImage("Roid.jpg");
  img2 = loadImage("Roid2.jpg");
  img3 = loadImage("roid3.jpg");
  img4 = loadImage("spaceship.png");
  img5 = loadImage("pewpewpew.png");
  img4.resize(50,50);
  imageMode(CENTER);

  Ship ship = new Ship( 'W', 'S', 'A', 'D', ' ', width/2, height/1.2f );
  gameObjects.add(ship);
}

void draw()
{
  background(0);
  switch(mode)
  {
  case 0:
    {
      background(0);
      textSize(45);
      text("Space Impact", width/2-110, 100);
      textSize(15);
      text("W/A/S/D : Forward/Left/Backwards/Right", width/2-110, 200);
      text("SpaceBar : Shoot", width/2-110, 225);
      text("Lose 1 life when impact on asteroid or \nasteroid is allowed to hit planet", width/2-110, 275);
      textSize(10);
      text("1 : to remove", width/2-110, 325);
      if (mode == 0)
      {
        intro.play();
      }
    }
  case 1:
    {
        if (mode == 1)
        {
          intro.close();
          title.play();       
        
      }
      textSize(12);
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
      if (lives > 0)
      {
        text("Lives Left: " + lives, 600, 50);
      } else
      {
        text("GAME OVER !", 600, 50);
      }
      text("Score: " +score, 600, 75);
    }
    if (mode == 1)
    {
      if (frameCount %60 == 0)
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
  if(score == 300)
  {
    diffi = 6;
  }
  if(score == 400)
  {
    diffi = 7;
  }
  if(score == 500)
  {
    diffi = 8;
  }
   if(score == 600)
   {
     diffi = 9;
   }
   if(score == 700)
   {
     diffi = 10;
   }
}
