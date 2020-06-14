class Sky{
    PShape skyImage;
    double skyX;
    double skyY;
    int skyG = 175;
    int skyB = 255;
    int skyWidth = 1200;
    int skyHeight = 900;
    public Sky(double hPos,double wPos){
        this.skyImage = createShape(RECT, 0, 0, skyWidth, skyHeight);
        this.skyY = (int)hPos;
        this.skyX = (int)wPos;
    }
    public void imagePrint(){
        //sky starts to darken once it leaves the troposphere
        if(myRocket.hPos < -13000 && myRocket.hVelI < 0){
          skyG -= 1;
          skyB -= 1;
        }
        if(myRocket.hVelI > 0 && skyG <= 175 && skyB <= 255){
            skyG += 1;
            skyB += 1;
        }
        skyImage.setStroke(false);
        skyImage.setFill(color(0, skyG, skyB));
        shape(skyImage,(float)(skyX),(float)(skyY));
        shape(skyImage,(float)(skyX), (float)(skyY+skyHeight));
        shape(skyImage,(float)(skyX + skyWidth),(float) (skyY));
        shape(skyImage,(float)(skyX + skyWidth), (float)(skyY+skyHeight));
    }
    public void update(double hVel, double wVel){
        skyY-=hVel;
        skyX-=wVel;
        System.out.println("skyY" + skyY);
        System.out.println("skyX" + skyX);
        // System.out.println("hPos" + hPos);

        if(skyY >= 0.0){
            // System.out.println(skyHeight);
            skyY -=skyHeight;
            System.out.println("down");
        }
        if((int)skyY <= (-1)*skyHeight){
            skyY +=skyHeight;
            System.out.println("up");
        }
        if(skyX >= 0.0){
            skyX -=skyWidth;
            System.out.println("right");
        }
        if((int)skyX <= (-1)*skyWidth){
            skyX +=skyWidth;
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
//     skyY -=skyHeight;
//     System.out.println("down");
//   }
// }
// public void up(){
//   skyY=skyY-10;
//   if(skyY <= (-1)*skyHeight && hPos<=-10){
//     skyY +=skyHeight;
//     System.out.println("up");
//   }
// }

// public void right(){
//   skyX=skyX+10;
//   if(skyX >= 0){
//     skyX -=skyWidth;
//     System.out.println("right");
//   }
// }

// public void left(){
//   skyX=skyX-10;
//   if(skyX <= (-1)*skyWidth){
//     skyX +=skyWidth;
//     System.out.println("left");
//   }
// }


}
