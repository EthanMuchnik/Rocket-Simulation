class Ground {
    PImage groundBlock;
    int groundY;
    
    public Ground(int groundY){
        this.groundBlock = loadImage("Ground.png");
        this.groundY = groundY;
    }
    
    public void drawGround(int y) {
        for(int i = 0; i <= 1200; i += 50) {
            image(groundBlock, i, y);
        }
    }
}
