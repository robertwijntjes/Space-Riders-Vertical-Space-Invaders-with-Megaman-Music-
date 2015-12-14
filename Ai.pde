class Star extends GameObject
{
  float points;
  float rotSpeed;
  float radius;
  float rot;
  
  
  Star(float x, float y)
  {
    this.c = c;
    this.radius = radius;
    this.points = points;
    rot = 0.0f;
    rotSpeed = 0.01f;
  }
  
  void update()
  {
    rot += rotSpeed;
    if (rot > TWO_PI)
    {
      rot = 0;
    }
  }
  
  void render()
  {
    pushMatrix();
    translate(0,0);
    rect(pos.x,pos.y,10,10);
    popMatrix();
  }
}
