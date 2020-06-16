public class TerrainOne extends Terrain{
    int numObjects;
    ArrayList <HitBox> hBox;

    PImage tOne;
    int tHPos;
    int tWPos;
    public TerrainOne(){
        numObjects = 5;
        hBox = new ArrayList <HitBox>();
        tOne = loadImage("images/rocket/S.png");
    }
    public void makeBoxes(){

    }
}