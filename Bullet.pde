class Bullet extends GameObject
{

  Bullet()
  {
    speed = 20.0f;
  }

  void render()
  {
    pushMatrix();
    stroke(255, 0, 0);
    translate(pos.x, pos.y);
    line(0, -5, 0, 10);
    popMatrix();
  }

  void update()
  {
    forward.x = sin(0);
    forward.y = - cos(speed);

    forward.mult(speed);
    pos.add(forward);

    if (pos.y < 0)
    {
      gameObjects.remove(this);
    }
    //println(pos.y);
  }
}
