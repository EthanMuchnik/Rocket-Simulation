public class TerrainAll{
    
    ArrayList <Terrain> allTerrains;
    Terrain touchableOne;
    Terrain touchableTwo;
    int rand;

    PImage plain;

    // int

    public TerrainAll(){
        allTerrains = new ArrayList<Terrain>(0);
        // declareTerrains();
        allTerrains.add(new TerrainOne());
        allTerrains.add(new TerrainTwo());
        allTerrains.add(new TerrainThree());
        touchableOne = allTerrains.get(1);
        touchableTwo = allTerrains.get(2);
        plain = loadImage("images/rocket/plain.png");
    }
    public void imagePrint(double skyX, double skyY, double hPos, double wPos){
        rand =  (int)((wPos)%3600);
        // touchableOne = allTerrains.get(1);
        // touchableTwo = allTerrains.get(2)
        // System.out.println("num Objects" + allTerrains.get(0).j());
        if(hPos<0 && hPos>=-900){
            // System.out.println(scraa);
            if(rand>=0 && rand<=1200){
                image(plain,(float)(skyX),(float)(skyY));
                image(allTerrains.get(0).tImage,(float)(skyX), (float)(skyY+900));
                image(plain,(float)(skyX + 1200),(float) (skyY));
                image(allTerrains.get(1).tImage,(float)(skyX + 1200), (float)(skyY+900));
                System.out.println("plain");
            }
            else if(rand>=1200 && rand<=2400 ){
                image(plain,(float)(skyX),(float)(skyY));
                image(allTerrains.get(1).tImage,(float)(skyX), (float)(skyY+900));
                image(plain,(float)(skyX + 1200),(float) (skyY));
                image(allTerrains.get(2).tImage,(float)(skyX + 1200), (float)(skyY+900));
                System.out.println("plain");

            }
            else if(rand>=2400 && rand<=3600  ){
                image(plain,(float)(skyX),(float)(skyY));
                image(allTerrains.get(2).tImage,(float)(skyX), (float)(skyY+900));
                image(plain,(float)(skyX + 1200),(float) (skyY));
                image(allTerrains.get(0).tImage,(float)(skyX + 1200), (float)(skyY+900));
                System.out.println("plain");
            }

            else if(rand<=0 && rand>=-1200  ){
                image(plain,(float)(skyX),(float)(skyY));
                image(allTerrains.get(2).tImage,(float)(skyX), (float)(skyY+900));
                image(plain,(float)(skyX + 1200),(float) (skyY));
                image(allTerrains.get(0).tImage,(float)(skyX + 1200), (float)(skyY+900));
                System.out.println("plain");
            }
            else if(rand<=-1200 && rand>=-2400  ){
                image(plain,(float)(skyX),(float)(skyY));
                image(allTerrains.get(1).tImage,(float)(skyX), (float)(skyY+900));
                image(plain,(float)(skyX + 1200),(float) (skyY));
                image(allTerrains.get(2).tImage,(float)(skyX + 1200), (float)(skyY+900));
                System.out.println("plain");
            }
            else if(rand<=-2400 && rand>=-3600  ){
                image(plain,(float)(skyX),(float)(skyY));
                image(allTerrains.get(0).tImage,(float)(skyX), (float)(skyY+900));
                image(plain,(float)(skyX + 1200),(float) (skyY));
                image(allTerrains.get(1).tImage,(float)(skyX + 1200), (float)(skyY+900));
                System.out.println("plain");
            }
        }
        else if(hPos==0){
System.out.println("bisha");
            if(rand>=0 && rand<=1200){
                image(allTerrains.get(0).tImage,(float)(skyX),(float)(skyY));
                image(allTerrains.get(0).tImage,(float)(skyX), (float)(skyY+900));
                image(allTerrains.get(1).tImage,(float)(skyX + 1200),(float) (skyY));
                image(allTerrains.get(1).tImage,(float)(skyX + 1200), (float)(skyY+900));
                System.out.println("plain");
            }
            else if(rand>=1200 && rand<=2400 ){
                image(allTerrains.get(1).tImage,(float)(skyX),(float)(skyY));
                image(allTerrains.get(1).tImage,(float)(skyX), (float)(skyY+900));
                image(allTerrains.get(2).tImage,(float)(skyX + 1200),(float) (skyY));
                image(allTerrains.get(2).tImage,(float)(skyX + 1200), (float)(skyY+900));
                System.out.println("plain");

            }
            else if(rand>=2400 && rand<=3600  ){
                image(allTerrains.get(2).tImage,(float)(skyX),(float)(skyY));
                image(allTerrains.get(2).tImage,(float)(skyX), (float)(skyY+900));
                image(allTerrains.get(0).tImage,(float)(skyX + 1200),(float) (skyY));
                image(allTerrains.get(0).tImage,(float)(skyX + 1200), (float)(skyY+900));
                System.out.println("plain");
            }

            else if(rand<=0 && rand>=-1200  ){
                image(allTerrains.get(2).tImage,(float)(skyX),(float)(skyY));
                image(allTerrains.get(2).tImage,(float)(skyX), (float)(skyY+900));
                image(allTerrains.get(0).tImage,(float)(skyX + 1200),(float) (skyY));
                image(allTerrains.get(0).tImage,(float)(skyX + 1200), (float)(skyY+900));
                System.out.println("plain");
            }
            else if(rand<=-1200 && rand>=-2400  ){
                image(allTerrains.get(1).tImage,(float)(skyX),(float)(skyY));
                image(allTerrains.get(1).tImage,(float)(skyX), (float)(skyY+900));
                image(allTerrains.get(2).tImage,(float)(skyX + 1200),(float) (skyY));
                image(allTerrains.get(2).tImage,(float)(skyX + 1200), (float)(skyY+900));
                System.out.println("plain");
            }
            else if(rand<=-2400 && rand>=-3600  ){
                image(allTerrains.get(0).tImage,(float)(skyX),(float)(skyY));
                image(allTerrains.get(0).tImage,(float)(skyX), (float)(skyY+900));
                image(allTerrains.get(1).tImage,(float)(skyX + 1200),(float) (skyY));
                image(allTerrains.get(1).tImage,(float)(skyX + 1200), (float)(skyY+900));
                System.out.println("plain");
            }
        }
        // if(hPos<=-900 && hPos>=-1800){
        //     // System.out.println(scraa);
        //     if(rand>=0 && rand<=900){
        //         image(allTerrains.get(0).tImage,(float)(skyX),(float)(skyY));
        //         image(plain,(float)(skyX), (float)(skyY+900));
        //         image(allTerrains.get(0).tImage,(float)(skyX + 1200),(float) (skyY));
        //         image(plain,(float)(skyX + 1200), (float)(skyY+900));
        //         System.out.println("plain");
        //     }
        //     else if(rand>=900 && rand<=1800 ){
        //         image(allTerrains.get(1).tImage,(float)(skyX),(float)(skyY));
        //         image(plain,(float)(skyX), (float)(skyY+900));
        //         image(allTerrains.get(1).tImage,(float)(skyX + 1200),(float) (skyY));
        //         image(plain,(float)(skyX + 1200), (float)(skyY+900));
        //         System.out.println("allTerrains.get(1).tImage");

        //     }
        //     else if(rand>=1800 && rand<=2700  ){
        //         image(allTerrains.get(2).tImage,(float)(skyX),(float)(skyY));
        //         image(plain,(float)(skyX), (float)(skyY+900));
        //         image(allTerrains.get(2).tImage,(float)(skyX + 1200),(float) (skyY));
        //         image(plain,(float)(skyX + 1200), (float)(skyY+900));
        //         System.out.println("allTerrains.get(1).tImage");
        //     }

        //     else if(rand<=0 && rand>=-900  ){
        //         image(allTerrains.get(2).tImage,(float)(skyX),(float)(skyY));
        //         image(plain,(float)(skyX), (float)(skyY+900));
        //         image(allTerrains.get(2).tImage,(float)(skyX + 1200),(float) (skyY));
        //         image(plain,(float)(skyX + 1200), (float)(skyY+900));
        //         System.out.println("allTerrains.get(1).tImage");
        //     }
        //     else if(rand<=-900 && rand>=-1800  ){
        //         image(allTerrains.get(1).tImage,(float)(skyX),(float)(skyY));
        //         image(plain,(float)(skyX), (float)(skyY+900));
        //         image(allTerrains.get(1).tImage,(float)(skyX + 1200),(float) (skyY));
        //         image(plain,(float)(skyX + 1200), (float)(skyY+900));
        //         System.out.println("allTerrains.get(1).tImage");
        //     }
        //     else if(rand<=-1800 && rand>=-2700  ){
        //         image(allTerrains.get(0).tImage,(float)(skyX),(float)(skyY));
        //         image(plain,(float)(skyX), (float)(skyY+900));
        //         image(allTerrains.get(0).tImage,(float)(skyX + 1200),(float) (skyY));
        //         image(plain,(float)(skyX + 1200), (float)(skyY+900));
        //         System.out.println("allTerrains.get(1).tImage");
        //     }
        // }
        
        else{
            image(plain,(float)(skyX),(float)(skyY));
            image(plain,(float)(skyX), (float)(skyY+900));
            image(plain,(float)(skyX + 1200),(float) (skyY));
            image(plain,(float)(skyX + 1200), (float)(skyY+900));
            System.out.println("plain");
        }
    }


}