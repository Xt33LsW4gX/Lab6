// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

int portalSize = 50;

boolean spacePressed;
boolean showPortals = true;

Flock flock;
Portal entrance;
Portal exit;

void setup() {
  size(800,600);
  
  // FLOCK
  flock = new Flock();
  // Adds an initial set of boids
  for (int i = 0; i < 200; i++) {
    Boid b = new Boid(width/2,height/2);
    flock.addBoid(b);
  }
  
  // PORTALS
  entrance = new Portal(width/4, height/2, portalSize, portalSize);
  exit = new Portal(width - width/4, height/2, portalSize, portalSize);
  
}

void draw() {
  input();
  update();
  render();
}

void input() {
  
}

void update() {
  if(showPortals) {
    flock.teleport(entrance, exit);
  }
}

void render() {
  background(255);
  flock.run();
  fill(0);
  
  if(showPortals) {
    entrance.display();
    exit.display();
    
    fill(0);
    text("Entrance", entrance.x + 20, entrance.y - 20);
    text("Exit", exit.x + 20, exit.y - 20);
  }
}

// Adds a new boid
void mouseClicked() {
  flock.addBoid(new Boid(mouseX,mouseY));
}


void keyPressed() {
  // Shows the portals
  if((key == ' ') && spacePressed == false) {
    showPortals = !showPortals;
    if(showPortals) {
      
    }
    spacePressed = true;
  }
  
  // Resets the project
  if(key == 'r') {
    showPortals = true;
    setup();
  }
}

void keyReleased() {
  if(key == ' ') {
    spacePressed = false;
  }
}