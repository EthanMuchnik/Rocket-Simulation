double xPos = 0;
double yPos = 0;

double speedX = 0;
double speedY = 0;

ArrayList<Character> keys;

public Rocket myRocket;


// PImage rocket;
void setup(){
    size(1200,900);
    frameRate(Constants.frameRate);
    setupKeys();
    // rocket = loadImage("images/rocket/smallRocket.png");
    myRocket = new Rocket(0,0, 500, 5,0.7);
}
void draw(){
    // yPos+=speedY;
    // xPos+=speedX;

    background(125, 150, 100);
    // rect((int)xPos, (int)yPos, 60, 60);

    // speedX+=0.2;
    // speedY+=0.2;
    
    myRocket.generalUpdate();
    myRocket.imagePrint();
    textFont(createFont("OCR A Extended", 15));
    image(loadImage("images/rocket/StatsBox.png"), 925, 25);
    text("Height: " + round((float)(-1*myRocket.getHPos())) + " m", 950, 50);
    text("Fuel Left: ", 950, 75);
    text("Meme Level: Over 9000", 950, 100);
    // text("rand" + myRocket.returnThing(), 950, 125);
    
    // for(int i = 0; i<keys.size();i++){
    //   System.out.println(keys.get(i));
    // }
    keysBool();
    // theSky.imagePrint();
}
void setupKeys() {
    keys = new ArrayList<Character>();
}
boolean checkSetup() {
    if(keys == null) {
        println("Make sure you call setupKeys() in setup()!");
        return true;
    }

    return false;
}
void keyPressed() {
    if(checkSetup()) return;
    if(!keys.contains((Character) key)) {
        keys.add((Character) key);
    }
}
void keyReleased() {
    if(checkSetup()) return;
    keys.remove((Character) Character.toUpperCase(key));
    keys.remove((Character) Character.toLowerCase(key));
}

boolean getKey(char c) {
    if(checkSetup()) return false;
    return keys.contains(Character.toUpperCase(c)) || keys.contains(Character.toLowerCase(c));
}
// void keyPressed() {

//     String aKey = (Character.toString(key));
//     if(aKey.equals("a")){
//             myRocket.thrust();
//         }
//     else if(aKey.equals("k")){
//         myRocket.leftTurn();
//     }
//     else if(aKey.equals("j")){
//         myRocket.rightTurn();
//     }
// }

void keysBool(){
  if(getKey('w')){
    myRocket.thrust();
    // System.out.println("jyo mam");
  }
  else{
    myRocket.noThrust();
  }
  if(getKey('a')){
    myRocket.leftTurn();
  }
  if(getKey('d')){
    myRocket.rightTurn();
  }
}