class Wave {
  
  int xspacing = 8; // How far apart should each horizontal location be spaced
  int w;            // Width of entire wave
  float r,g,b;
  float xoff = 0.0;
  float xoff2 = 0.03;
  
  PVector originMoving;
  
  PVector origin;          // Where does the wave's first point start
  float theta = 0.0;       // Start angle at 0
  float amplitude;         // Height of wave
  float period;            // How many pixels before the wave repeats
  float dx;                // Value for incrementing X, to be calculated as a function of period and xspacing
  float[] yvalues;         // Using an array to store height values for the wave (not entirely necessary)

  Wave(PVector o, int w_, float a, float p) {
    origin = o.get();
    originMoving = new PVector();
    w = w_;
    period = p;
    amplitude = a;
    dx = (TWO_PI / period) * xspacing;
    yvalues = new float[w/xspacing];
    r = random(0,255);
    g = random(0,255);
    b = random(0,255);
  }


  void calculate() {
    // Increment theta (try different values for 'angular velocity' here
    theta += 0.05;

    // For every x value, calculate a y value with sine function
    float x = theta;
    for (int i = 0; i < yvalues.length; i++) {
      yvalues[i] = sin(x)*amplitude;
      x+=dx;
    }
  }

  PVector display() {
    
    // A simple way to draw the wave with an ellipse at each location
    for (int x = 0; x < yvalues.length; x++) {
      xoff = xoff + 0.001;
      xoff2 = xoff2 + 0.001;
      stroke(0);
      //fill(0,50);
      fill(r,255*noise(xoff),b,100);
      ellipseMode(CENTER);
      ellipse(origin.x+x*xspacing,origin.y+yvalues[x],16,16);
      originMoving.x = origin.x;
      originMoving.y = origin.y+yvalues[0];
    }
    return originMoving;
  }
  
}

