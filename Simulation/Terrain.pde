class Ground {
    PImage groundBlock;
    
    public Ground(){
        this.groundBlock = loadImage("Ground.png");
    }
    
    public void drawGround() {
        for(int i = 0; i <= 1200; i += 50) {
            image(groundBlock, i, 850);
        }
    }
}
