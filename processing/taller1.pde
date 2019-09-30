PGraphics pg;
PImage img;
void setup(){
  size(1400, 800);
  img = loadImage("tree.jpg");
  pg = createGraphics(img.width, img.height);
  println(img.height);
  println(img.width);
}

void draw(){
  pg.beginDraw();
  //pg.background(255);
  pg.background(255);
  pg.stroke(255);
  //pg.line(20, 20, 100, 100);
  pg.loadPixels();
  if (keyPressed) {
  if (key == 'g' || key == 'G') {
    grayScale();
  }
  else if(key == 'l'|| key == 'L' ){
    luma();
  }
  else if (key == 's' || key == 'S'){
    sharpen();
  }
  else if(key== 'e' || key == 'E'){
    edgeDetection();
  }
  else if(key == 'b' || key =='B'){
    blur();
  }
  else if(key == 'h' || key == 'H'){
    histogram();
  }
  else if (key == '1' || key == '2' || key == '3'|| key == '4' ){
    segmentation(Character.getNumericValue(key));
  }
  } else{
    //blur();
    sameImage();
    //edgeDetection();
    //histogram();  
    //segmentation(1);
}
  //pg.updatePixels();
  image(img, 10, 30, img.width, img.height);
  image(pg, 700, 30, img.width, img.height);
  pg.endDraw();
  //noLoop();
}

void grayScale(){
  img.loadPixels();
  for(int x=0;x<img.width;x++){
   for (int y=0; y<img.height; y++) {
   color c =img.pixels[img.width*y+x];
   int avg = (int(red(c)) + int(green(c)) + int(blue(c)))/3;
   color grayScale = color(avg,avg,avg);
   pg.pixels[img.width*y + x] =  grayScale;
  }
  }
}

void luma(){
  img.loadPixels();
  for(int x=0;x<img.width;x++){
   for (int y=0; y<img.height; y++) {
   color c =img.pixels[img.width*y+x];
   int avg = (int(red(c)) + int(green(c)) + int(blue(c)))/3;
   color lumaScale = color(0.2126*red(c),0.7152*green(c),0.0722*blue(c));
   pg.pixels[img.width*y + x] =  lumaScale;
  }
  }
}

void sameImage(){
  println("same image");
  img.loadPixels();
  for(int x=0;x<img.width;x++){
   for (int y=0; y<img.height; y++) {
     //println(img.width*y + x);
   pg.pixels[img.width*y + x] =  img.pixels[img.width*y + x];
  }
  }
}

void edgeDetection(){
  println("Edge detection");
  float[][] edgeConvolution = new float[][]{new float[]{1,0,-1}, new float[]{1,0,-1}, new float[]{1,0,-1}};
  //printMatrix(edgeConvoelution);
   convOperation(edgeConvolution);
}

void sharpen(){
  println("Sharpen");
  float[][] edgeConvolution = new float[][]{new float[]{-1,-1,-1}, new float[]{-1,9,-1}, new float[]{-1,-1,-1}};
  //printMatrix(edgeConvolution);
   convOperation(edgeConvolution);
}

void blur(){
  println("Blur");
  float[][] edgeConvolution = new float[][]{new float[]{1.0/9.0,1.0/9.0,1.0/9.0}, new float[]{1.0/9.0,1.0/9.0,1.0/9.0}, new float[]{1.0/9.0,1.0/9.0,1.0/9.0}};
  //printMatrix(edgeConvolution);
   convOperation(edgeConvolution);
}

void convOperation(float[][] convMatrix){
  println("Conv operation");
  int[] newPixels = padding(1); 
  int newWidth, newHeight;
  newWidth = img.width+ 2;
  newHeight = img.height+ 2;
  //Iterate in x until newWidth-3
  for(int x=0; x<=newWidth-3;x++){
  //Interate in y until newHeight-3
    for(int y=0;y<=newHeight-3; y++ ){
  //Iterate in x of convolution
  float sumR=0.0;
  float sumG=0.0;
  float sumB=0.0;
  //println("new conv");
      for(int xM=0; xM<convMatrix.length; xM++){
        //Interate on y of convolution
        for(int yM=0; yM<convMatrix[xM].length; yM++){
          //println("r:" + red(newPixels[newWidth*y +x]));
          //println("g:" + green(newPixels[newWidth*y +x]));
          //println("b:" + blue(newPixels[newWidth*y +x]));
          sumR+= (float) red(newPixels[newWidth*(y+yM) + (x +xM)]) *convMatrix[xM][yM];
          sumG+=  (float) green(newPixels[newWidth*(y+yM) + (x +xM)])*convMatrix[xM][yM];
          sumB+=  (float) blue(newPixels[newWidth*(y+yM) + (x +xM)])*convMatrix[xM][yM];
        }//End y conv
        //println("SumR:" + sumR);
        //println("SumG:" + sumG);
        //println("SumB:" + sumB);
      }//End x conv
      //println("SumR:" + sumR);
      //println("SumG:" + sumG);
      //println("SumB:" + sumB);
      pg.pixels[img.width*y+x] = color(sumR, sumG, sumB);
      //break;
    }//End y iteration
    //break;
  }//ENd x iteration  
}

int[] padding(int paddingSize){
  img.loadPixels();
  int newWidth, newHeight;
  newWidth = img.width+ 2*paddingSize;
  newHeight = img.height+ 2*paddingSize;
  int[] newPixels = new int[(img.width+ 2*paddingSize) * (img.height+ 2*paddingSize)];
  for(int x=0;x<img.width+ 2*paddingSize;x++){
   for (int y=0; y<img.height + 2*paddingSize; y++) {
     //if first row or last row or first column or last column
     if(x==0 || x== img.width+ 2*paddingSize -1 || y==0 || y== img.height + 2*paddingSize-1){
       newPixels[newWidth*y +x] = color(0,0,0);
     }
     //else
     else{
       newPixels[newWidth*y +x] = img.pixels[img.width*(y-paddingSize) + (x-paddingSize)];
     }
    }//end y for
  }//end x for
  return newPixels;
}//end padding

void printMatrix(int[][] matrix){
  for(int i=0; i<matrix.length; i++){
    for(int j=0; j<matrix.length; j++){
        print(matrix[i][j]);
    }
    println();
  }
}


void histogram(){
  int[] histogram = new int[256];

  for(int x=0; x<img.width; x++){
   for(int y=0; y<img.height; y++){
     color c = img.pixels[img.width*y +x];
     int grayScale = (int)(blue(c) + green(c) + red(c))/3;
     histogram[grayScale] +=1;
   }
  }
  
  int histMax = max(histogram);
  println("hist max:" + histMax);
  int steps= img.width/256;
  for(int i=0; i<img.width; i+=steps){
    if(i/2<=255){
      //println("i:" + i/2 + " frequency: "+ histogram[i/2]);
    println("x1:"+ i);
    println("y1:"+ pg.height);
    println("x2:"+ i);
    println("y2:"+ (pg.height - histogram[i/2] * img.height / histMax));
    line(i,pg.height*2,i,pg.height*2 - histogram[i/2] * img.height / histMax);
    }
  }
  
}


void segmentation(int quartile){
  println("segmentation");
   for(int x=0; x<img.width; x++){
   for(int y=0; y<img.height; y++){
     color c = img.pixels[img.width*y +x];
     int grayScale = (int)(blue(c) + green(c) + red(c))/3;
      if(grayScale/64 == quartile-1){
        pg.pixels[img.width*y +x] = color(grayScale,grayScale,grayScale);
      }
      else{
        pg.pixels[img.width*y +x] =color(200,0,0);
      }
   }
  }
  
}
  
