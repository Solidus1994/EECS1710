int numDog = 1;
int numRunaway = (int)(1+Math.random()*(15-5+1));

Dog[] dog = new Dog[numDog];
Runaway[] runaway = new Runaway[numRunaway];

void setup(){
  size(1080,720,P2D);
  
  for (int i=0; i<dog.length; i++) {
    dog[i] = new Dog(random(width), random(height));
  }
  
  for (int i=0; i<runaway.length; i++) {
    runaway[i] = new Runaway(random(width), random(height));
  }
}

void draw() {
  background(255);
  
  for (int i=0; i<runaway.length; i++) {
    runaway[i].run();
  }
  
  for (int i=0; i<dog.length; i++) {
    dog[i].run();
  }
}


class Runaway {
  
  PVector position;
  float sizeVal;
  boolean alive = true;
  
  Runaway(float x, float y) {
    position = new PVector(x, y);
    sizeVal = random(1, 1);
  }

  void draw() {
    if (alive) {
      ellipseMode(CENTER);
      noStroke();
      fill(0);
      ellipse(position.x, position.y, sizeVal, sizeVal);
    }
  }
  
  void run() {
    draw();
  }
  
}

class Dog {

  boolean debug = true;
  PVector position, target;
  PImage faceCurrent, dog1, dog2, doga1, doga2;
  float margin = 50;
  int foodChoice;
  
  boolean isBothered = false;
  int botheredMarkTime = 0;
  int botheredTimeout = 5000;
  float botheredSpread = 5;
  
  boolean isBlinking = false;
  int blinkMarkTime = 0;
  int blinkTimeout = 100;
  int blinkDuration = 50;
  
  boolean isHunting = false;
  
  float triggerDistance1 = 100;
  float triggerDistance2 = 25;
  float movementSpeed = 0.1;
    
  Dog(float x, float y) {
    position = new PVector(x, y);
    pickEscapeTarget();
    
    dog1 = loadImage("dog1.png");
    dog1.resize(dog1.width/3, dog1.height/3);
    dog2 = loadImage("dog2.png");
    dog2.resize(dog1.width, dog1.height);
    doga1 = loadImage("doga1.png");
    doga1.resize(dog1.width, dog1.height);
    doga2 = loadImage("doga2.png");
    doga2.resize(dog1.width, dog1.height);
    
    faceCurrent = dog1;
  }
  
  void update() {
    PVector mousePos = new PVector(mouseX, mouseY);
    isBothered = position.dist(mousePos) < triggerDistance1;
    
    if (isBothered) {
      isHunting = false;
      botheredMarkTime = millis();
      faceCurrent = dog2;
      if (position.dist(target) < triggerDistance2) {
        pickEscapeTarget();
      }
    } else if (!isBothered && millis() > botheredMarkTime + botheredTimeout) {
      if (!isBlinking && millis() > blinkMarkTime + blinkTimeout) {
        isBlinking = true;
        blinkMarkTime = millis();
      } else if (isBlinking && millis() > blinkMarkTime + blinkDuration) {
        isBlinking = false;
      }
  
      if (isBlinking) {
        faceCurrent = doga2;
      } else {
        faceCurrent = doga1;
      }   
      
      if (!isHunting) {
        pickFoodTarget();
        isHunting = true;
      }
    } else if (!isBothered && millis() > botheredMarkTime + botheredTimeout/6) {
      faceCurrent = dog1;
    }
  
    if (isBothered || isHunting) {
      position = position.lerp(target, movementSpeed).add(new PVector(random(-botheredSpread, botheredSpread), random(-botheredSpread, botheredSpread)));
    }
    
    if (isHunting && position.dist(target) < 5) {
      runaway[foodChoice].alive = false; 
      pickFoodTarget();
    }
    
    position.y += sin(millis()) / 2;
  }
  
  void draw() {    
    ellipseMode(CENTER);
    rectMode(CENTER);
    imageMode(CENTER);
  
    image(faceCurrent, position.x, position.y);
  
  }
  
  void run() {
    update();
    draw();
  }
  
  void pickEscapeTarget() {
    target = new PVector(random(margin, width-margin), random(margin, height-margin));
  }
  
  void pickFoodTarget() {
    foodChoice = int(random(runaway.length));
    if (runaway[foodChoice].alive) {
      target = runaway[foodChoice].position;
    }
  }
  
}
