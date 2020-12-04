Particle[] particles;

void setup()
{
  size(500, 500);
  
   particles = new Particle[51];
   
   
   for(int i = 0; i < particles.length-1; i++)
   {
     particles[i] = new Particle(250, 250, Math.random()+2, Math.random()*360, 255);
   }
   particles[50] = new OddballParticle(250, 250, Math.random()*3+2, Math.random()*360, 155);
}

void draw()
{
  background(0);
  
  for(int i = 0; i < particles.length; i++)
   {
     particles[i].move();
     particles[i].show();
   }
   
   fill(0);
   //ellipse(250, 250, 75, 75);
}

class Particle
{
  double myX, myY, mySpeed, myAngle;
  color myColor;
  
  Particle(double x_, double y_, double speed_, double angle_, color color_)
  {
    myX = x_;
    myY = y_;
    mySpeed = speed_;
    myAngle = angle_;
    myColor = color_;
  }
  
  void move()
  {
    myX += Math.cos(myAngle) * mySpeed;
    myY += Math.sin(myAngle) * mySpeed;
    
    if(myX < 0 || myY < 0 || myX > 500 || myY > 500)
    {
      myX = 250;
      myY = 250;
    }
  }
  
  void show()
  {
    fill(myColor);
    
    noStroke();
    ellipse((int)myX, (int)myY, 10, 10);
    
    //strokeWeight(2);
    //stroke(myColor);
    //line((float)myX, (float)myY, (float)(myX-(Math.cos(myAngle) * (mySpeed*3))), (float)(myY-(Math.sin(myAngle) * (mySpeed*3))));
  }
}

class OddballParticle extends Particle
{
  OddballParticle(double x_, double y_, double speed_, double angle_, color color_)
  {
    super(x_, y_, speed_, angle_, color_); 
  }
  
  void move()
  {
    myX += Math.cos(myAngle) * mySpeed;
    myY += Math.sin(myAngle) * mySpeed;
    
    if(myX < 0 || myY < 0 || myX > 500 || myY > 500)
    {
      myX = 250;
      myY = 250;
      mySpeed = Math.random()*3+2;
      myAngle = Math.random()*360;
    }
  }
  
  void show()
  {
    fill(myColor);
    
    noStroke();
    ellipse((int)myX, (int)myY, 25, 25);
  }
}
