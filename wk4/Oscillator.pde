class Oscillator  {   

  PVector angle;
  PVector velocity;
  PVector amplitude;
  
  int randColor;

  Oscillator()  {   
    angle = new PVector();
    velocity = new PVector(random(-0.05,0.05),random(-0.05,0.05));
    amplitude = new PVector(random(width/2),random(height/2));    
    randColor = floor(random(255));
  }   

  void oscillate()  {
    angle.add(velocity);
  }   

  void display(float xCenter, float yCenter)  {   
    float x = sin(angle.x)*amplitude.x;
    float y = sin(angle.y)*amplitude.y;
    //float xMouseMoved = -1*width/2+mouseX;
    //float yMouseMoved = -1*height/2+mouseY;
    pushMatrix();
    translate(xCenter, yCenter);
    stroke(0);
    fill(randColor);
    // draw circle and line
    line(x,y,0,0);  
    ellipse(x,y,16,16);  
    popMatrix();
  }
}   



