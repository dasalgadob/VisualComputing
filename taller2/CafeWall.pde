void setup () {
        size(500, 500);
}

void draw (){
        background(0);//Fondo negro
        //Llenar con celdas blancas
        fill(255);
        for (int row = 0; row < 10; row += 2) {
            //Create odd rows
            for (int i = 0; i < 10; i++) {//Range defined to be able to scroll 
                rect((i * 100), row * 50, 50, 50);
            }
            //Create even rows
            for (int i = 0; i < 10; i++) {//Range defined to be able to scroll 
                rect( - mouseX + (i * 100), (row + 1) * 50, 50, 50);
            }
        }
        
    }
