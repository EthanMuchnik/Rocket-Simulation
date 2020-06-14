int skyG = 175;
int skyB = 255;

int gY = 850;
int rocketH = 300;

String rocketFile = "Rocket.png";

public Rocket myRocket;
public Cloud cloud;
public Ground ground;

// PImage rocket;
void setup(){
    size(1200,900);
    frameRate(Constants.frameRate);
    myRocket = new Rocket(0,0, 500, 5,0.7, loadImage(rocketFile));
    ground = new Ground(gY);
}

void draw(){
    if(myRocket.thrustForceY() != 0) {
      rocketFile = "RocketThrust.png";
      rocketH = 350;
    }
    else {
      rocketFile = "Rocket.png";
      rocketH = 300;
    }
    
    myRocket.generalUpdate();
    myRocket.imagePrint(loadImage(rocketFile), rocketH);
    cloud = new Cloud(random(0, 1200), random(0, 900));
    cloud.imagePrint();
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
    textFont(createFont("OCR A Extended", 15));
    image(loadImage("StatsBox.png"), 925, 25);
    text("Height: " + round((float)(-1*myRocket.hPos)) + " m", 950, 50);
    text("Fuel Left: ", 950, 75);
    text("Meme Level: Over 9000", 950, 100);
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
