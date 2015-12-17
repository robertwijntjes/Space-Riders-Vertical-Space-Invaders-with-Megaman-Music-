class Roid extends GameObject
{
  float x,y;
  
  Roid(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
  void update()
  {
    y++;
  }
  
  void render()
  {
    pushMatrix();
    stroke(0);
    translate(0,0);
    rect(x,y,30,30);
    popMatrix();
  }
}
