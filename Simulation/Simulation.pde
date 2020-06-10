double xPos = 0;
double yPos = 0;

double speedX = 0;
double speedY = 0;

Rocket myRocket;

// PImage rocket;
void setup(){
    size(1200,900);
    frameRate(Constants.frameRate);
    // rocket = loadImage("images/rocket/smallRocket.png");
    myRocket = new Rocket(Constants.rHeight/2,Constants.rWidth/2, 500, 5,0.7);
}
void draw(){
    yPos+=speedY;
    xPos+=speedX;
    background(125, 150, 100);
    rect((int)xPos, (int)yPos, 60, 60);

    speedX+=0.2;
    speedY+=0.2;
    myRocket.imagePrint();
    myRocket.generalUpdate();
}

void keyPressed() {

    String aKey = (Character.toString(key));
    if(aKey.equals("a")){
            myRocket.thrust();
        }
    else if(aKey.equals("k")){
        myRocket.leftTurn();
    }
    else if(aKey.equals("j")){
        myRocket.rightTurn();
    }
}
