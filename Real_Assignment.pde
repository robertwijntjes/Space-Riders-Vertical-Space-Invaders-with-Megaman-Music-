/*

  Name: Robert Wijntjes
  C_Number: C14356786
  Project: Game with encapsulation,inheritance and polymorphism.
  Date: 10/02/2016.

*/
import ddf.minim.*;
//Added in Library

ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
//ArrayList Init 

boolean[] keys = new boolean[512];
boolean roidFall = true;
int lives = 10;
int score = 0;
int diffi = 1;
int mode = 0;
int counter = 0;
//Global Variables.

PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
//Adding Images.

Minim minim;
AudioPlayer player;
AudioInput input;
AudioPlayer intro;
AudioPlayer title;
AudioPlayer ending;
//Initialising Minims

void setup()
{
  size(700, 1000);

  minim = new Minim(this);
  player = minim.loadFile("gunfire.mp3");
  title = minim.loadFile("title.mp3");
  intro = minim.loadFile("intro.mp3");
  ending = minim.loadFile("gameover.mp3");
  input = minim.getLineIn();
  img = loadImage("Roid.jpg");
  img2 = loadImage("Roid2.jpg");
  img3 = loadImage("roid3.jpg");
  img7 = loadImage("roid4.jpg");
  img4 = loadImage("spaceship.png");
  img5 = loadImage("pewpewpew.png");
  img4.resize(50, 50);
  img6 = loadImage("Buttons.png");
  imageMode(CENTER);
  //Adds in Static Features

  Ship ship = new Ship( 'W', 'S', 'A', 'D', ' ', width/2, height/1.2f );
  gameObjects.add(ship);
  //Initialise the Ship Object
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
      text("Space Riders", width/2-110, 100);
      textSize(15);
      text("W/A/S/D : Forward/Left/Backwards/Right", width/2-110, 200);
      text("SpaceBar : Shoot", width/2-110, 225);
      text("Lose 1 life when impact on asteroid or \nasteroid is allowed to hit planet", width/2-110, 275);
      text("1 : To Begin Adventure.", width/2-110, 325);
      text("2 : To End Adventure.", width/2-110, 350);
      image(img6, width/2 - 25, 410, 195, 70);
      if (mode == 0)
      {
        intro.play();
      }
    }
    //Case 1 for Menu and sound effects
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
      
      if (lives > 0)
      {
        textSize(15);
        text("Lives Left: " + lives, 590, 50);
        text("Score: " +score, 590, 75);
      } else
      {
        textSize(50);
        text("GAME OVER !", 250, 400);
        text("Score: " +score,250,500);
        title.close();
        ending.play();
      }
      textSize(15);
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
    case 2:
    {
      if(mode == 2)
      {
        exit();
      }
    }
  }
  //Case 1 for full game and sound effects
}  

void keyPressed()
{
  keys[keyCode] = true;
  if (key >= '0' && key <='9')
  {
    mode = key - '0';
  }
  //To recognise pressed keys
}

void keyReleased()
{
  keys[keyCode] = false;
  //Swtich to help with key recognition
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
  //Collision from Bullet to Asteroid (Roid)
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
  //Collision from Ship to Asteroid (Roid)
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
  //Check for off screen Roid Removal
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
  if (score == 300)
  {
    diffi = 6;
  }
  if (score == 400)
  {
    diffi = 7;
  }
  if (score == 500)
  {
    diffi = 8;
  }
  if (score == 600)
  {
    diffi = 9;
  }
  if (score == 700)
  {
    diffi = 10;
  }
  //Difficulty Meter.
}

