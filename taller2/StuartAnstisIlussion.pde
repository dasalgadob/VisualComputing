


boolean goRight = true;
boolean showBlackRectangles=true;
float Xposition = 0; 

void setup(){
  size(1000,600);
  background(255);
  noStroke();

}

void draw(){
  fill(255);
  rect(0, 0, 1000, 600);
  
  fill(0);
  if(showBlackRectangles){
    for(int i=0; i<1000; i+=40){
      rect(i, 0, 20, 600);
    }
  }
     
  fill(#ffff00);
  rect(Xposition, 100, 80, 40);
  fill(#116133); //Green #116133 //Blue #000060
  rect(Xposition, 200, 80, 40);
  
  fill(#000060); //Green #116133 //Blue #000060
  rect(Xposition, 300, 80, 40);
  if (goRight){
    Xposition+= 0.7;
  }else{
    Xposition-= 0.7;
  }

  if( Xposition > 1000 || Xposition < 0){
    goRight = !goRight;
  }

}

void mouseClicked() {
  showBlackRectangles = !showBlackRectangles;  
}
