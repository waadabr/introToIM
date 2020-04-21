//int lineLength = 5;
//PVector loc1, loc2, center;
//float angle = 0;
//float acceleration, velocity;

Rotator[] rotators;

void setup() {
  size (640, 360);
  rotators = new Rotator[200];
  for (int i=0; i<200; i++) {
    float x = random(width);
    float y = random(height);
    rotators[i] = new Rotator(x, y, i);
  }

}

void draw() {
  background(255);
  for (Rotator r : rotators){
    r.rotateLine();
    r.checkMouse();
    r.drawLine(rotators);
  }
  

}

class Rotator {
  float x, y, centerX, centerY, angle, acceleration, velocity, radius, direction; //initializes variables
  int index; //self rotator

  Rotator(float _centerX, float _centerY, int _index) { //make a constructor
    centerX = _centerX;
    centerY = _centerY;
    index = _index;
    angle = acceleration = velocity = 0;
    radius = random(20, 50);
    x = y = 0;

    float coinFlip = random(1);
    if (coinFlip> 0.5) {
      direction = 1;
    } else {
      direction = -1;
    }
  }

  void rotateLine() {
    velocity += acceleration;
    velocity *= direction; //multiply angle to go to opposite direction
    angle += velocity;
    acceleration = 0;
    velocity *= 0.98;
  }

  void drawLine(Rotator[] rotators) { //array with all rotators
    x = cos(angle)* radius + centerX; //translates (0,0) to specific x and y
    y = sin(angle)* radius + centerY;

    for (Rotator r : rotators) { //loops through all rotators
      if (index != r.index) { //if not self
        if (dist(x, y, r.x, r.y) < radius) { //checks distance between self and all ellipses
          pushStyle();
          stroke(255, 0, 0, 75);
          line(r.x, r.y, x, y);
          popStyle();
        }
      }
    }
    // ellipse(x, y, 10, 10); //debugging
  }

  void checkMouse() {
    if (dist(mouseX, mouseY, centerX, centerY) < radius // if mouse position is within the radius of our line
      && mouseX != pmouseX && mouseY != pmouseY) { 
      acceleration += 0.002 * direction; //adding this force to the acceleration
    }
  }
}
