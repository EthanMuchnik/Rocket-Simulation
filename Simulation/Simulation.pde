double xPos = 0;
double yPos = 0;

double speedX = 0;
double speedY = 0;

void setup(){
    size(1200,900);
    frameRate(Constants.frameRate);
}
void draw(){
    yPos+=speedY;
    xPos+=speedX;
    background(125, 150, 100);
    rect((int)xPos, (int)yPos, 60, 60);

    speedX+=0.2;
    speedY+=0.2;


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
