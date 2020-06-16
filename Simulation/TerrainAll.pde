public class TerrainAll{
    
    ArrayList <Terrain> allTerrains;
    Terrain touchableOne;
    Terrain touchableTwo;
    int rand;

    // int

    public TerrainAll(){
        allTerrains = new ArrayList<Terrain>(0);
        // declareTerrains();
        allTerrains.add(new TerrainOne());
        allTerrains.add(new TerrainTwo());
        allTerrains.add(new TerrainThree());
        touchableOne = allTerrains.get(1);
        touchableTwo = allTerrains.get(2);
        rand = allTerrains.get(2).j();
    }
    public void imagePrint(double skyX, double skyY, double hPos, double wPos){
        rand =  (int)((wPos)%2700);
        // touchableOne = allTerrains.get(1);
        // touchableTwo = allTerrains.get(2)
        // System.out.println("num Objects" + allTerrains.get(0).j());
        // if(hPos<0 && hPos>-900){
        //     if(rand>0 && rand<=900){
        //         image(allTerrains.get(1).tTwo,(float)(skyX),(float)(skyY));
        //         image(allTerrains.get(0).tOne,(float)(skyX), (float)(skyY+900));
        //         image(allTerrains.get(1).tTwo,(float)(skyX + 1200),(float) (skyY));
        //         image(allTerrains.get(0).tOne,(float)(skyX + 1200), (float)(skyY+900));
        //         System.out.println("allTerrains.get(0).tOne");
        //     }
        //     else if(rand>=900 && rand<=1800 ){
        //         image(allTerrains.get(2).tThree,(float)(skyX),(float)(skyY));
        //         image(allTerrains.get(1).tTwo,(float)(skyX), (float)(skyY+900));
        //         image(allTerrains.get(2).tThree,(float)(skyX + 1200),(float) (skyY));
        //         image(allTerrains.get(1).tTwo,(float)(skyX + 1200), (float)(skyY+900));
        //         System.out.println("allTerrains.get(1).tTwo");

        //     }
        //     else if(rand>=1800 && rand<=2700  ){
        //         image(allTerrains.get(0).tOne,(float)(skyX),(float)(skyY));
        //         image(allTerrains.get(2).tThree,(float)(skyX), (float)(skyY+900)) ;
        //         image(allTerrains.get(0).tOne,(float)(skyX + 1200),(float) (skyY));
        //         image(allTerrains.get(2).tThree,(float)(skyX + 1200), (float)(skyY+900));
        //         System.out.println("allTerrains.get(2).tThree");
        //     }

        //     else if(rand<=0 && rand>=-900  ){
        //         image(allTerrains.get(0).tOne,(float)(skyX),(float)(skyY));
        //         image(allTerrains.get(2).tThree,(float)(skyX), (float)(skyY+900));
        //         image(allTerrains.get(0).tOne,(float)(skyX + 1200),(float) (skyY));
        //         image(allTerrains.get(2).tThree,(float)(skyX + 1200), (float)(skyY+900));
        //         System.out.println("else");
        //     }
        //     else if(rand<=-900 && rand>=-1800  ){
        //         image(allTerrains.get(2).tThree,(float)(skyX),(float)(skyY));
        //         image(allTerrains.get(1).tTwo,(float)(skyX), (float)(skyY+900));
        //         image(allTerrains.get(2).tThree,(float)(skyX + 1200),(float) (skyY));
        //         image(allTerrains.get(1).tTwo,(float)(skyX + 1200), (float)(skyY+900));
        //         System.out.println("else");
        //     }
        //     else if(rand<=-1800 && rand>=-2700  ){
        //         image(allTerrains.get(1).tTwo,(float)(skyX),(float)(skyY));
        //         image(allTerrains.get(0).tOne,(float)(skyX), (float)(skyY+900));
        //         image(allTerrains.get(1).tTwo,(float)(skyX + 1200),(float) (skyY));
        //         image(allTerrains.get(0).tOne,(float)(skyX + 1200), (float)(skyY+900));
        //         System.out.println("else");
        //     }
        // }
        // else{
        //     image(plain,(float)(skyX),(float)(skyY));
        //     image(plain,(float)(skyX), (float)(skyY+900));
        //     image(plain,(float)(skyX + 1200),(float) (skyY));
        //     image(plain,(float)(skyX + 1200), (float)(skyY+900));
        //     System.out.println("allTerrains.get(0).tOne");
        // }
    }


}