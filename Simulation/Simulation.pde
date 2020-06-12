double xPos = 0;
double yPos = 0;

double speedX = 0;
double speedY = 0;

int skyG = 175;
int skyB = 255;

public Rocket myRocket;

// PImage rocket;
void setup(){
    size(1200,900);
    frameRate(Constants.frameRate);
    // rocket = loadImage("images/rocket/smallRocket.png");
    myRocket = new Rocket(0,0, 500, 5,0.7);
}

void draw(){
    yPos+=speedY;
    xPos+=speedX;

    background(0, 0, 0);
    rect((int)xPos, (int)yPos, 60, 60);

    speedX+=0.2;
    speedY+=0.2;
    myRocket.generalUpdate();
    myRocket.imagePrint();
    // theSky.imagePrint();
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
