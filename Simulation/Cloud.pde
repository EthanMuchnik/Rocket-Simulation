class Cloud{
   PImage cloudImage;
   float cloudX;
   float cloudY;
   int counter;
   
   public Cloud(double hPos, double wPos){
        this.cloudImage = loadImage("Cloud.png");
        this.cloudY = (float)hPos;
        this.cloudX = (float)wPos;
   }
   public void imagePrint(){
        if(myRocket.hPos < -6500 && myRocket.hPos > -25000){
          image(cloudImage, cloudX, cloudY);
        }
   }
}
