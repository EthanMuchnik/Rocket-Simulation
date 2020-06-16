class Sky{
    PShape skyImage;
    double skyX;
    double skyY;
    int skyG= 175;
    int skyB = 255;
    int skyHeight = 900;
    int skyWidth = 1200;
    double modC;
    Clouds cloud;
    TerrainAll terrain;
    public Sky(double hPos,double wPos){
        this.skyImage = createShape(RECT, 0, 0, skyWidth, skyHeight);
        this.skyY = (int)hPos;
        this.skyX = (int)wPos;
        cloud = new Clouds();
    }
    public void imagePrint(){
        modC = myRocket.getHPos() * 0.002;
        skyG = 175 + (int)modC;
        skyB = 255 + (int)modC;
        if(skyB < 0){
          skyB = 0;
        }
        if(skyG < 0){
          skyG = 0;
        }
        if(skyB > 255){
          skyB = 255;
        }
        if(skyG > 175){
          skyG = 175;
        }

        skyImage.setStroke(false);
        skyImage.setFill(color(0, skyG, skyB));
        shape(skyImage,(float)(skyX),(float)(skyY));
        shape(skyImage,(float)(skyX), (float)(skyY+skyHeight));
        shape(skyImage,(float)(skyX + skyWidth),(float) (skyY));
        shape(skyImage,(float)(skyX + skyWidth), (float)(skyY+skyHeight));
        cloud.imagePrint(skyX, skyY, myRocket.getHPos(), myRocket.hVelF, myRocket.wVelF);
        // terrain Code which is commented out but will by made better in future
        // terrain.imagePrint(skyX, skyY, myRocket.getHPos(), myRocket.getWPos());
    }
    public void update(double hVel, double wVel){
        skyY-=hVel;
        skyX-=wVel;
        
        if(skyY >= 0.0){
            skyY -=skyHeight;
        }
        if((int)skyY <= (-1)*skyHeight){
            skyY +=skyHeight;
        }
        if(skyX >= 0.0){
            skyX -=skyWidth;
        }
        if((int)skyX <= (-1)*skyWidth){
            skyX +=skyWidth;
        }
        if(skyY > 0 || (skyY<-899.99&&skyY>-900.00)){
            skyY = 0;
        }
    }

    public void modY(double mod){
        skyY+=mod;
    }
}
