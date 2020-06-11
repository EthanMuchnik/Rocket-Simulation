class Sky{
    PImage skyImage;
    double skyX;
    double skyY;
    public Sky(double hPos,double wPos){
        this.skyImage = loadImage("images/cloudsB.png");
        this.skyY = (int)hPos;
        this.skyX = (int)wPos;
    }
    public void imagePrint(){
        image(skyImage,(float)(skyX),(float)(skyY));
        image(skyImage,(float)(skyX), (float)(skyY+skyImage.height));
        image(skyImage,(float)(skyX + skyImage.width),(float) (skyY));
        image(skyImage,(float)(skyX + skyImage.height), (float)(skyY+skyImage.height));
    }
    public void update(double hVel, double wVel){
        skyY-=hVel;
        skyX-=wVel;
        System.out.println("skyY" + skyY);
        System.out.println("skyX" + skyX);
        // System.out.println("hPos" + hPos);

        System.out.println("height" + skyImage.height);
        if(skyY > 0.0){
            // System.out.println(skyImage.height);
            skyY -=skyImage.height;
            System.out.println("down");
        }
        if((int)skyY < (-1)*skyImage.height){
            skyY +=skyImage.height;
            System.out.println("up");
        }
        if(skyX > 0.0){
            skyX -=skyImage.width;
            System.out.println("right");
        }
        if((int)skyX < (-1)*skyImage.width){
            skyX +=skyImage.width;
            System.out.println("left");
        }
        if(skyY > 0){
            skyY = 0;
        }
    }

    public void modY(double mod){
        skyY+=mod;
    };
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