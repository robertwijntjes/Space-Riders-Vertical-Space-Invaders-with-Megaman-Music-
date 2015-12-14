class Bullet extends GameObject
{
  
  Bullet()
  {
    speed = 20.0f;
  }
  
  void render()
  {
    stroke(255,0,0);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    line(0, -5, 0, 10);
    popMatrix();    
  }
  
  void update()
  {
    forward.x = sin(0);
    forward.y = - cos(speed);
      
    forward.mult(speed);
    pos.add(forward);
    
  }
}
