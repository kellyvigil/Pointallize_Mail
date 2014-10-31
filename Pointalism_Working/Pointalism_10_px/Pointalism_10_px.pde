// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs preload="moonwalk.jpg"; */

PImage img;
int smallPoint, largePoint;



void setup() {
  size(1920, 1080);
  img = loadImage("rio.jpg");
  smallPoint = 12;
  largePoint = 12;
  imageMode(CENTER);
  noStroke();
  background(255);
}

void draw() { 





  


 for (int i = 0; i < 1000; i++)
  {
    drawADot();
  }
}

void drawADot()
{

  int imageWidth = img.width;
  int imageHeight = img.height;
  int ptSize = int(random(100)) + 4;

  float pointillize = map(0, 0, width, smallPoint, largePoint);
  int x = int(random(0, imageWidth/8));
  int y = int(random(0, imageHeight/8));








  
   // If we are an even column

     
    color pix = img.get(x*8, y*8);
    fill(pix, 255);
    ellipse(x*8, y*8, pointillize, pointillize);
    
  
}


// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs preload="moonwalk.jpg"; */

PImage img;
int smallPoint, largePoint;



void setup() {
  size(1920, 1080);
  img = loadImage("rio.jpg");
  smallPoint = 12;
  largePoint = 12;
  imageMode(CENTER);
  noStroke();
  background(255);
}

void draw() { 





  //}}


 for (int i = 0; i < 1000; i++)
  {
    drawADot();
  }
}

void drawADot()
{

  int imageWidth = img.width;
  int imageHeight = img.height;
  int ptSize = int(random(100)) + 4;

  float pointillize = map(0, 0, width, smallPoint, largePoint);
  int x = int(random(0, imageWidth/8));
  int y = int(random(0, imageHeight/8));








  //for (int y = 0; y < height; y++) {
  // for (int x = 0; x < width; x++) {
  //int loc = x + y*width;


  //add tenth_pixel_image code


  //float r = red(img.pixels[loc]);
  //float g = green(img.pixels[loc]);
  //float b = blue(img.pixels[loc]);



  //if ((x*10 % 10 == 0) && (y*10 % 10 == 0))
  { // If we are an even column

    //if (mousePressed){  
    color pix = img.get(x*8, y*8);
    fill(pix, 255);
    ellipse(x*8, y*8, pointillize, pointillize);
    //}
  }
}


