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
    myRocket = new Rocket(Constants.width/2,Constants.height, 5, 5,0.7);
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

// void keyPressed() {
//     if(key == 'a'){
//         x-=5;
//     }
//     else if(key == 'w'){
//         y-=5;
//     }
//     else if(key == 'd'){
//         x+=5;
//     }
//     else if(key == 's'){
//         y+=5;
//     }

// }
