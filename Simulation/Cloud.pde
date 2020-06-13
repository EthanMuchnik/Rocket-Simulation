class Cloud{
   PImage cloudImage;
   float cloudX;
   float cloudY;
   int counter;
   int cloudWidth = 1200;
   int cloudHeight = 900;
   
   public Cloud(double hPos, double wPos){
        this.cloudImage = loadImage("Cloud.png");
        this.cloudY = (float)hPos;
        this.cloudX = (float)wPos;
   }

   public void imagePrint(){
        //cloud starts to darken once it leaves the troposphere
        if(myRocket.hPos < -6500 && myRocket.hPos > -25000){
          image(cloudImage, cloudX, cloudY);
        }
    }
}
