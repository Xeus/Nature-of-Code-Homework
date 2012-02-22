// Simple Particle System
// Daniel Shiffman <http://www.shiffman.net>

// A simple Particle class

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  color randColor;
  
  float mass = random(0.01,1); // Let's do something better here!

  Particle(PVector l) {
    acceleration = new PVector(0,0);
    velocity = new PVector(random(-.3,0.3),random(-.1,.1));
    location = l.get();
    lifespan = 200.0;
    randColor = color(int(random(150,230)),int(random(90,130)),int(random(25, 90)));
  }

  void run() {
    update();
    display();
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 3;
  }

  // Method to display
  void display() {
    stroke(randColor,lifespan);
    fill(randColor,lifespan);
    ellipse(location.x,location.y,1,1);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

