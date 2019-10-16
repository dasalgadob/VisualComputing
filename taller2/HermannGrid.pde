void setup(){
  size(800,500);

}

void draw(){
    background(255);
    fill(0);
    for(int x = 0; x <= 800; x += 50) {
        for(int y = 0; y < 500; y += 50) {
            rect(x, y, 42, 42); 
        }
    }
}
