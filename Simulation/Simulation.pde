import processing.sound.*;
SoundFile file;
SoundFile normalRocketMusic;

ArrayList<Character> keys;

public Rocket myRocket;

boolean song;
void setup(){
    size(1200,900);
    frameRate(Constants.frameRate);
    setupKeys();
    myRocket = new Rocket(0,0, 15000, 5,0.7);
    normalRocketMusic = new SoundFile(this,"normal.mp3");
    file = new SoundFile(this, "shootingstars.mp3");
    file.play();
    song = true;
}
void draw(){
    background(125, 150, 100);
    myRocket.generalUpdate();
    myRocket.imagePrint();
    textFont(createFont("OCR A Extended", 15));
    image(loadImage("images/rocket/StatsBox.png"), 925, 25);
    text("Height: " + round((float)(-1*myRocket.getHPos())) + " m", 950, 50);
    text("Width: " + (int)(-1*myRocket.getHPos()) + " m",950,75);
    text("Fuel Left: " + ((int)myRocket.massC - (int)myRocket.massE) + " kg", 950, 100);
    text("Meme Level: Over 9000 ", 950, 125);
    text("Percent Thrust " +(int)(100*(myRocket.perThrust)) + " %", 950, 150);
    text("thrust Y " + (-1)*(int)myRocket.thrustFY + " N", 950, 175);
    text("thrust X " + (-1)*(int)myRocket.thrustFX + " N", 950, 200);
    text("Velocity Y " + (-1)*(int)(myRocket.hVelF*Constants.frameRate) + " m/s", 950, 225);
    text("Velocity X " + (int)(myRocket.wVelF*Constants.frameRate) + " m/s", 950, 250);
    

    keysBool();

    if(myRocket.hPos<=-100000 && song == true){
      file.pause();
      normalRocketMusic.play();
      song = false;
    }
    else if(myRocket.hPos>-100000 && song == false){
      file.play();
      normalRocketMusic.pause();
      song = true;
    }
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

void keysBool(){
  if(getKey('w')){
    myRocket.thrust();
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
  if(getKey('k')){
    myRocket.tUp();
  }
  if(getKey('j')){
    myRocket.tDown();
  }
}
