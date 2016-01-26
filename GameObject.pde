//Runs everything
abstract class GameObject
{
  PVector pos;
  PVector forward;
  float x,y;
  float w;
  float widthH;
  float speed = 20;
  color colour;
  float theta = 0.0f;

  GameObject()
  {
    this(width * 0.5f, height  * 0.5f, 50);
  }

  GameObject(float x, float y, float w)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, -1);

    this.widthH = w * 0.5f;
  }

  abstract void update();


  abstract void render();

}

