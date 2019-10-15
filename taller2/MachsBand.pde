
void setup(){
size(700,500);
}

void draw(){
//Setup background to white
background(255);
int mouseYPosition = mouseY;
int heightToAdd=int(map(mouseYPosition,0,500,0,21));
int heightRect =40 +heightToAdd;
fill(#424242);
rect(167, 50, 50,heightRect);

fill(#565656);
rect(140, 110, 100, heightRect);

fill(#7a7a7a);
rect(115, 170, 150, heightRect);

fill(#989898);
rect(90, 230, 200, heightRect);

fill(#b6b6b6);
rect(70, 290, 250, heightRect);

noStroke(); //Removes the line outside the figure to be able to see the visual effect

}
