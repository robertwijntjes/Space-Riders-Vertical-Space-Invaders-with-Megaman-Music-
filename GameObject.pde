//Runs everything
class GameObject
{
  PVector pos;
  PVector forward;
  float w;
  float halfW;
  float speed = 5.0f;
  color c; 
  float theta = 0.0f;
 
  GameObject()
  {
    // Constructor chaining
    this(width * 0.5f, height  * 0.5f, 50);     
  }
  
  GameObject(float x, float y, float w)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    this.w = w;
    this.halfW = w * 0.5f;
  }
  
  void update()
  {

  }
  
  void render()
  {
    
  }  
}
