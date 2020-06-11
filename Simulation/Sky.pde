class Sky{
    PImage skyImage;
    int skyX;
    int skyY;
    public Sky(double hPos,double wPos){
        this.skyImage = loadImage("images/clouds.png");
        this.skyY = (int)hPos;
        this.skyX = (int)wPos;
    }
    public void imagePrint(){
        image(skyImage,skyX,skyY);
        image(skyImage,skyX, skyY+skyImage.height);
        image(skyImage,skyX + skyImage.width, skyY);
        image(skyImage,skyX + skyImage.height, skyY+skyImage.height);
    }
    public void update(double hVel, double wVel, double hPos){
        skyY-=hVel;
        skyX-=wVel;
        if(skyY >= 0 && (int)hPos<=0){
            System.out.println(skyImage.height);
            skyY -=skyImage.height;
            System.out.println("down");
        }
        if(skyY <= (-1)*skyImage.height){
            skyY +=skyImage.height;
            System.out.println("up");
        }
        if(skyX >= 0){
            skyX -=skyImage.width;
            System.out.println("right");
        }
        if(skyX <= (-1)*skyImage.width){
            skyX +=skyImage.width;
            System.out.println("left");
        }
    }
//     public void down(){
//   if(skyY >= 0){
//     skyY -=skyImage.height;
//     System.out.println("down");
//   }
// }
// public void up(){
//   skyY=skyY-10;
//   if(skyY <= (-1)*skyImage.height && hPos<=-10){
//     skyY +=skyImage.height;
//     System.out.println("up");
//   }
// }

// public void right(){
//   skyX=skyX+10;
//   if(skyX >= 0){
//     skyX -=skyImage.width;
//     System.out.println("right");
//   }
// }

// public void left(){
//   skyX=skyX-10;
//   if(skyX <= (-1)*skyImage.width){
//     skyX +=skyImage.width;
//     System.out.println("left");
//   }
// }


}