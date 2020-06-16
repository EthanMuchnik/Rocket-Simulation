class Clouds{
    PImage spread;
    PImage top;
    PImage dif;
    PImage plain;
    double hCloud = 0;
    double wCloud = 0;
    double rand = 0;
    double randP = 0;
    public Clouds(){

        this.spread = loadImage("images/rocket/spreadOut.png");
        this.top = loadImage("images/rocket/topBottom.png");
        this.dif = loadImage("images/rocket/difTypes.png");
        this.plain = loadImage("images/rocket/plain.png");
        // prev = "spreadOut";

    }
    public void imagePrint(double skyX, double skyY, double hPos, double hVel, double wVel){

        rand =  ((-1)*hPos)%2700;
        randP = ((hPos)*(-1) + 900)%2700;
        System.out.println("rand" + rand);
        System.out.println("randP" + randP);

        if(hPos>-1800){
            image(plain,(float)(skyX),(float)(skyY));
            image(plain,(float)(skyX), (float)(skyY+900));
            image(plain,(float)(skyX + 1200),(float) (skyY));
            image(plain,(float)(skyX + 1200), (float)(skyY+900));
            System.out.println("spread");
        }
        else if(hPos<=-1800 && hPos>=-2700){
            if( hPos<-1800&& hPos>-2700){
                image(spread,(float)(skyX),(float)(skyY));
                image(plain,(float)(skyX), (float)(skyY+900));
                image(spread,(float)(skyX + 1200),(float) (skyY));
                image(plain,(float)(skyX + 1200), (float)(skyY+900));
                System.out.println("spread");
            }
            else if(rand>0 && rand<=900 && randP>=900 && randP<=1800 ){
                image(top,(float)(skyX),(float)(skyY));
                image(spread,(float)(skyX), (float)(skyY+900));
                image(top,(float)(skyX + 1200),(float) (skyY));
                image(spread,(float)(skyX + 1200), (float)(skyY+900));
                System.out.println("spread");
            }
            else if(rand>=900 && rand<=1800 && randP>=1800 && randP<=2700 ){
                image(dif,(float)(skyX),(float)(skyY));
                image(top,(float)(skyX), (float)(skyY+900));
                image(dif,(float)(skyX + 1200),(float) (skyY));
                image(top,(float)(skyX + 1200), (float)(skyY+900));
                System.out.println("top");

            }
            else if(rand>=1800 && rand<=2700 && randP>=0 && randP<=900 ){
                image(spread,(float)(skyX),(float)(skyY));
                image(dif,(float)(skyX), (float)(skyY+900)) ;
                image(spread,(float)(skyX + 1200),(float) (skyY));
                image(dif,(float)(skyX + 1200), (float)(skyY+900));
                System.out.println("dif");
            }

            else{
                image(spread,(float)(skyX),(float)(skyY));
                image(dif,(float)(skyX), (float)(skyY+900));
                image(spread,(float)(skyX + 1200),(float) (skyY));
                image(dif,(float)(skyX + 1200), (float)(skyY+900));
                System.out.println("else");

            }
        }
        
    }
    // public void update(double hVelF, double wVelF){

    // }
    public double returnRand(){
        return rand;
    }

}