public class TerrainAll{
    
    ArrayList <Terrain> allTerrains;
    int rand;

    PImage plain;

    // int

    public TerrainAll(){
        allTerrains = new ArrayList<Terrain>(0);
        // declareTerrains();
        allTerrains.add(new TerrainOne());
        allTerrains.add(new TerrainTwo());
        allTerrains.add(new TerrainThree());
        plain = loadImage("images/rocket/plain.png");
    }
    public void imagePrint(double skyX, double skyY, double hPos, double wPos){
        rand =  (int)((wPos)%3600);
        if(hPos<0 && hPos>=-900){
            if(rand>=0 && rand<=1200){
                image(plain,(float)(skyX),(float)(skyY));
                image(allTerrains.get(0).tImage,(float)(skyX), (float)(skyY+900));
                image(plain,(float)(skyX + 1200),(float) (skyY));
                image(allTerrains.get(1).tImage,(float)(skyX + 1200), (float)(skyY+900));
            }
            else if(rand>=1200 && rand<=2400 ){
                image(plain,(float)(skyX),(float)(skyY));
                image(allTerrains.get(1).tImage,(float)(skyX), (float)(skyY+900));
                image(plain,(float)(skyX + 1200),(float) (skyY));
                image(allTerrains.get(2).tImage,(float)(skyX + 1200), (float)(skyY+900));
            }
            else if(rand>=2400 && rand<=3600  ){
                image(plain,(float)(skyX),(float)(skyY));
                image(allTerrains.get(2).tImage,(float)(skyX), (float)(skyY+900));
                image(plain,(float)(skyX + 1200),(float) (skyY));
                image(allTerrains.get(0).tImage,(float)(skyX + 1200), (float)(skyY+900));
            }

            else if(rand<=0 && rand>=-1200  ){
                image(plain,(float)(skyX),(float)(skyY));
                image(allTerrains.get(2).tImage,(float)(skyX), (float)(skyY+900));
                image(plain,(float)(skyX + 1200),(float) (skyY));
                image(allTerrains.get(0).tImage,(float)(skyX + 1200), (float)(skyY+900));
            }
            else if(rand<=-1200 && rand>=-2400  ){
                image(plain,(float)(skyX),(float)(skyY));
                image(allTerrains.get(1).tImage,(float)(skyX), (float)(skyY+900));
                image(plain,(float)(skyX + 1200),(float) (skyY));
                image(allTerrains.get(2).tImage,(float)(skyX + 1200), (float)(skyY+900));
            }
            else if(rand<=-2400 && rand>=-3600  ){
                image(plain,(float)(skyX),(float)(skyY));
                image(allTerrains.get(0).tImage,(float)(skyX), (float)(skyY+900));
                image(plain,(float)(skyX + 1200),(float) (skyY));
                image(allTerrains.get(1).tImage,(float)(skyX + 1200), (float)(skyY+900));
            }
        }
        else if(hPos==0){
            if(rand>=0 && rand<=1200){
                image(allTerrains.get(0).tImage,(float)(skyX),(float)(skyY));
                image(allTerrains.get(0).tImage,(float)(skyX), (float)(skyY+900));
                image(allTerrains.get(1).tImage,(float)(skyX + 1200),(float) (skyY));
                image(allTerrains.get(1).tImage,(float)(skyX + 1200), (float)(skyY+900));
            }
            else if(rand>=1200 && rand<=2400 ){
                image(allTerrains.get(1).tImage,(float)(skyX),(float)(skyY));
                image(allTerrains.get(1).tImage,(float)(skyX), (float)(skyY+900));
                image(allTerrains.get(2).tImage,(float)(skyX + 1200),(float) (skyY));
                image(allTerrains.get(2).tImage,(float)(skyX + 1200), (float)(skyY+900));
            }
            else if(rand>=2400 && rand<=3600  ){
                image(allTerrains.get(2).tImage,(float)(skyX),(float)(skyY));
                image(allTerrains.get(2).tImage,(float)(skyX), (float)(skyY+900));
                image(allTerrains.get(0).tImage,(float)(skyX + 1200),(float) (skyY));
                image(allTerrains.get(0).tImage,(float)(skyX + 1200), (float)(skyY+900));
            }

            else if(rand<=0 && rand>=-1200  ){
                image(allTerrains.get(2).tImage,(float)(skyX),(float)(skyY));
                image(allTerrains.get(2).tImage,(float)(skyX), (float)(skyY+900));
                image(allTerrains.get(0).tImage,(float)(skyX + 1200),(float) (skyY));
                image(allTerrains.get(0).tImage,(float)(skyX + 1200), (float)(skyY+900));
            }
            else if(rand<=-1200 && rand>=-2400  ){
                image(allTerrains.get(1).tImage,(float)(skyX),(float)(skyY));
                image(allTerrains.get(1).tImage,(float)(skyX), (float)(skyY+900));
                image(allTerrains.get(2).tImage,(float)(skyX + 1200),(float) (skyY));
                image(allTerrains.get(2).tImage,(float)(skyX + 1200), (float)(skyY+900));
            }
            else if(rand<=-2400 && rand>=-3600  ){
                image(allTerrains.get(0).tImage,(float)(skyX),(float)(skyY));
                image(allTerrains.get(0).tImage,(float)(skyX), (float)(skyY+900));
                image(allTerrains.get(1).tImage,(float)(skyX + 1200),(float) (skyY));
                image(allTerrains.get(1).tImage,(float)(skyX + 1200), (float)(skyY+900));
            }
        }
        else{
            image(plain,(float)(skyX),(float)(skyY));
            image(plain,(float)(skyX), (float)(skyY+900));
            image(plain,(float)(skyX + 1200),(float) (skyY));
            image(plain,(float)(skyX + 1200), (float)(skyY+900));
        }
    }
}