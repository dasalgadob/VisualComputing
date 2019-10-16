
float counter = 0;
void setup(){
  size(500,500);
  //noLoop();
}

void draw(){
  noStroke();
  background(255);
  fill(240);
  int radio=150;
  int xCenter=250, yCenter=250;
  for(int i=0;i<12;i++){
    if(int(floor(counter))%12 != i){
      double x=xCenter+(Math.sin((30*i*2*Math.PI)/360))*radio;
      double y=yCenter +(Math.cos((30*i*2*Math.PI)/360))*radio;
      circle((float)(x),(float) y,30);
    }
  }
  
  counter+=0.1;
}
