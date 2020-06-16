class Clouds{
    //Made Clouds
    PImage spread;
    PImage top;
    PImage dif;
    PImage plain;
    PImage world;
    PImage pika;
    PImage boys;
    PImage ground;
    double hCloud = 0;
    double wCloud = 0;
    double rand = 0;
    double randP = 0;
    public Clouds(){

        this.spread = loadImage("images/rocket/spreadOut.png");
        this.top = loadImage("images/rocket/topBottom.png");
        this.dif = loadImage("images/rocket/difTypes.png");
        this.plain = loadImage("images/rocket/plain.png");
        this.world = loadImage("images/rocket/world.png");
        this.pika = loadImage("images/rocket/pika.png");
        this.boys = loadImage("images/rocket/boys.png");
        this.ground = loadImage("images/rocket/background.png");
    }
    public void imagePrint(double skyX, double skyY, double hPos, double hVel, double wVel){

        rand =  ((-1)*hPos)%2700;
        randP = ((hPos)*(-1) + 900)%2700;
        if(hPos>=0){
            image(ground,(float)(skyX),(float)(skyY+300));
            image(ground,(float)(skyX), (float)(skyY+900+300));
            image(ground,(float)(skyX + 1200),(float) (skyY+300));
            image(ground,(float)(skyX + 1200), (float)(skyY+900+300));
        }
        else if(hPos>-900 && hPos<0){
            image(plain,(float)(skyX),(float)(skyY+300));
            image(ground,(float)(skyX), (float)(skyY+900+300));
            image(plain,(float)(skyX + 1200),(float) (skyY+300));
            image(ground,(float)(skyX + 1200), (float)(skyY+900+300));
        }
        // else if(hPos>-900 && hPos<-500){
        //     image(plain,(float)(skyX),(float)(skyY));
        //     image(plain,(float)(skyX), (float)(skyY+900));
        //     image(plain,(float)(skyX + 1200),(float) (skyY));
        //     image(plain,(float)(skyX + 1200), (float)(skyY+900));
        // }
        else if(hPos<=-900 && hPos>=-27000){
            if( hPos<-900&& hPos>-1800){
                image(spread,(float)(skyX),(float)(skyY));
                image(plain,(float)(skyX), (float)(skyY+900));
                image(spread,(float)(skyX + 1200),(float) (skyY));
                image(plain,(float)(skyX + 1200), (float)(skyY+900));
            }
            else if( hPos<-1800&& hPos>-2700){
                image(spread,(float)(skyX),(float)(skyY));
                image(spread,(float)(skyX), (float)(skyY+900));
                image(spread,(float)(skyX + 1200),(float) (skyY));
                image(spread,(float)(skyX + 1200), (float)(skyY+900));
            }
            else if(rand>0 && rand<=900 && randP>=900 && randP<=1800 ){
                image(top,(float)(skyX),(float)(skyY));
                image(spread,(float)(skyX), (float)(skyY+900));
                image(top,(float)(skyX + 1200),(float) (skyY));
                image(spread,(float)(skyX + 1200), (float)(skyY+900));
            }
            else if(rand>=900 && rand<=1800 && randP>=1800 && randP<=2700 ){
                image(dif,(float)(skyX),(float)(skyY));
                image(top,(float)(skyX), (float)(skyY+900));
                image(dif,(float)(skyX + 1200),(float) (skyY));
                image(top,(float)(skyX + 1200), (float)(skyY+900));
            }
            else if(rand>=1800 && rand<=2700 && randP>=0 && randP<=900 ){
                image(spread,(float)(skyX),(float)(skyY));
                image(dif,(float)(skyX), (float)(skyY+900)) ;
                image(spread,(float)(skyX + 1200),(float) (skyY));
                image(dif,(float)(skyX + 1200), (float)(skyY+900));
            }
            else{
                image(spread,(float)(skyX),(float)(skyY));
                image(dif,(float)(skyX), (float)(skyY+900));
                image(spread,(float)(skyX + 1200),(float) (skyY));
                image(dif,(float)(skyX + 1200), (float)(skyY+900));
            }
        }
        else if(hPos<-27000 && hPos>-27900){
            image(plain,(float)(skyX),(float)(skyY));
            image(dif,(float)(skyX), (float)(skyY+900));
            image(plain,(float)(skyX + 1200),(float) (skyY));
            image(dif,(float)(skyX + 1200), (float)(skyY+900));
        }   
        else if(hPos<=-100000){
            if(rand>0 && rand<=900 && randP>=900 && randP<=1800 ){
                image(pika,(float)(skyX),(float)(skyY));
                image(world,(float)(skyX), (float)(skyY+900));
                image(pika,(float)(skyX + 1200),(float) (skyY));
                image(world,(float)(skyX + 1200), (float)(skyY+900));
            }
            else if(rand>=900 && rand<=1800 && randP>=1800 && randP<=2700 ){
                image(boys,(float)(skyX),(float)(skyY));
                image(pika,(float)(skyX), (float)(skyY+900));
                image(boys,(float)(skyX + 1200),(float) (skyY));
                image(pika,(float)(skyX + 1200), (float)(skyY+900));
            }
            else if(rand>=1800 && rand<=2700 && randP>=0 && randP<=900 ){
                image(world,(float)(skyX),(float)(skyY));
                image(boys,(float)(skyX), (float)(skyY+900)) ;
                image(world,(float)(skyX + 1200),(float) (skyY));
                image(boys,(float)(skyX + 1200), (float)(skyY+900));
            }
        }
    }
}