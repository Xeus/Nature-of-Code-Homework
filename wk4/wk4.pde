/* Ben Turner, week #3 homework
 * Uses Daniel Shiffman's code for sine waves, springs,
 * oscillators, etc., from Nature of Code */

// float y1 = map(noise(theta),0,1,100,300);
// float y2 = map(sin(theta*

// see additivewave

// repellers added in 3 separate places

ArrayList<ParticleSystem2> systems;

ParticleSystem ps;
ParticleSystem ps2;
Repeller repeller;
Repeller repeller2;
Repeller[] repellers = new Repeller[60];

// An array of objects
Oscillator[] oscillators = new Oscillator[10];
Oscillator[] oscillatorsAttached = new Oscillator[10];

// Two wave objects
Wave wave0;
Wave wave1;

PVector firstEllipse, midEllipse;

// Mover object
Bob bob;

// Spring object
Spring spring;

void setup() {
  size(640,360);
  smooth();
  systems = new ArrayList<ParticleSystem2>();
  // Initialize a wave with starting point, width, amplitude, and period
  wave0 = new Wave(new PVector(50,height/2),550,100,700);
  wave1 = new Wave(new PVector(250,height/2+10),550,100,320);
  // Initialize all objects
  for (int i = 0; i < oscillators.length; i++) {
    oscillators[i] = new Oscillator();
    oscillatorsAttached[i] = new Oscillator();
  }
  firstEllipse = new PVector();
  midEllipse = new PVector();
  
  // Create objects at starting location
  // Note third argument in Spring constructor is "rest length"
  spring = new Spring(width/2,10,100); 
  bob = new Bob(width/2,100); 
  
  ps = new ParticleSystem(new PVector(width/2,50));
  ps2 = new ParticleSystem(new PVector(width/2+200,50));
  repeller = new Repeller(width/2-30,150);
  repeller2 = new Repeller(width/2+230,200);
  
  // Initialize all objects
  for (int i = 0; i < repellers.length; i++) {
    repellers[i] = new Repeller(random(width),random(height));
  }
  
  systems.add(new ParticleSystem2(1,new PVector(random(width),random(height))));
  systems.add(new ParticleSystem2(1,new PVector(random(width),random(height))));
  systems.add(new ParticleSystem2(1,new PVector(random(width),random(height))));
  systems.add(new ParticleSystem2(1,new PVector(random(width),random(height))));
}

void draw() {
  
  PVector gravity = new PVector(0,0.1);
  ps.applyForce(gravity);
  ps.applyRepeller(repeller);
  ps.applyRepeller(repeller2);
  ps2.applyForce(gravity);
  ps2.applyRepeller(repeller);
  ps2.applyRepeller(repeller2);
  
  for (int i = 0; i < repellers.length; i++) {
    ps.applyRepeller(repellers[i]);
    ps2.applyRepeller(repellers[i]);
  }
  
  repeller.display();
  repeller2.display();
  
  background(0);
  
  ps.addParticle();
  ps2.addParticle();
  for (ParticleSystem2 psX: systems) {
    psX.run();
    psX.addParticle();
    for (int i = 0; i < repellers.length; i++) {
      psX.applyRepeller(repellers[i]);
    }
  }
  
  for (int i = 0; i < repellers.length; i++) {
    repellers[i].display();
  }
  
  //fill(0);
  //text("science: you can't explain that.", 5, 15);
  
  ps.run();
  ps2.run();
  /*
   // Update and display waves
  wave0.calculate();
  wave0.display();
  
  wave1.calculate();
  firstEllipse = wave1.display();

  rectMode(CORNER);
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  // Run all objects
  for (int i = 0; i < oscillators.length; i++) {
    oscillators[i].oscillate();
    oscillators[i].display(mouseX,mouseY);
    oscillatorsAttached[i].oscillate();
    oscillatorsAttached[i].display(firstEllipse.x,firstEllipse.y);
  }
  
  fill(0);
  
  // Apply a gravity force to the bob
  bob.applyForce(gravity);
  
  // Connect the bob to the spring (this calculates the force)
  spring.connect(bob);
  // Constrain spring distance between min and max
  spring.constrainLength(bob,30,200);
  
  // Update bob
  bob.update();
  // If it's being dragged
  bob.drag(mouseX,mouseY);
  
  // Draw everything
  spring.displayLine(bob); // Draw a line between spring and bob
  bob.display(); 
  spring.display(firstEllipse.x,firstEllipse.y); 
  */
}

/*

// For mouse interaction with bob

void mousePressed()  {
  bob.clicked(mouseX,mouseY);
}

void mouseReleased()  {
  bob.stopDragging(); 
}

*/

void mousePressed() {
  systems.add(new ParticleSystem2(1,new PVector(mouseX,mouseY)));
}
