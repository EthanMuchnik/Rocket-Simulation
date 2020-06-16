public class TerrainThree extends Terrain{
    int numObjects;
    ArrayList <HitBox> hBox;

    PImage tThree;

    public TerrainThree(){
        numObjects = 5;
        hBox = new ArrayList <HitBox>();
        tThree = loadImage("images/rocket/D.png");
    }
    public void makeBoxes(){
        
    }
}