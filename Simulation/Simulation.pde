double xPos = 0;
double yPos = 0;

double speedX = 0;
double speedY = 0;

int skyG = 175;
int skyB = 255;

int gY = 850;

public Rocket myRocket;
public Cloud cloud;
public Ground ground;

// PImage rocket;
void setup(){
    size(1200,900);
    frameRate(Constants.frameRate);
    // rocket = loadImage("images/rocket/smallRocket.png");
    myRocket = new Rocket(0,0, 500, 5,0.7);
    ground = new Ground(gY);
}

void draw(){
    
  
    myRocket.generalUpdate();
    myRocket.imagePrint();
    cloud = new Cloud(random(0, 1200), random(0, 900));
    cloud.imagePrint();
    // theSky.imagePrint();
    ground.drawGround(gY);
    if(myRocket.hPos > -400 && myRocket.hVelI < 0) {
      gY -= myRocket.hVelI;
    }
    else if(myRocket.hPos > -400 && myRocket.hVelI > 0 && gY > 850) {
      gY -= myRocket.hVelI;
    }
    if(gY < 850) {
      gY = 850;
    }
    
}

void keyPressed() {

    String aKey = (Character.toString(key));
    if(aKey.equals("w")){
            myRocket.thrust();
        }
    else if(aKey.equals("a")){
        myRocket.leftTurn();
    }
    else if(aKey.equals("d")){
        myRocket.rightTurn();
    }
}
