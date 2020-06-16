public class TerrainTwo extends Terrain{
    int numObjects;
    ArrayList <HitBox> hBox;
    
    PImage tTwo;
    int tHPos;
    int tWPos;


    public TerrainTwo(){
        numObjects = 5;
        hBox = new ArrayList <HitBox>();
        tTwo = loadImage("images/rocket/T.png");
    }
    // public PImage imageReturn(){
    //     return tTwo;
    // }
    public void makeBoxes(){
        
    }
    public int j(){
        return 5;
    }
}