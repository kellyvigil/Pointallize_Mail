// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs preload="moonwalk.jpg"; */


PImage img[] = new PImage[2];

int smallPoint, largePoint;

final int DOTSPERDRAW = 500;

int numberOfDots = 0;

final int MAXDOTS = DOTSPERDRAW * 100; 

PImage workingImage ;

int index;


void setup() {
  size(810, 450);
  //img = loadImage("rio.jpg");
  
  img[0] = loadImage("http://assets2.exame.abril.com.br/assets/images/2014/8/506584/size_810_16_9_rio.jpg");
  img[1] = loadImage("http://upload.wikimedia.org/wikipedia/commons/1/1e/Pilcomayo_rio.jpg");
  img[1].resize(810, 0);
  
  smallPoint = 12;
  largePoint = 12;
  imageMode(CENTER);
  noStroke();
  background(255);
  workingImage = img[0];
}



void draw() { 

  if (numberOfDots > MAXDOTS) {
      index = (index + 1) % img.length;
      workingImage = img[index];
      numberOfDots = 0;
    }
  
  
 for (int i = 0; i < DOTSPERDRAW; i++) //drawADot 1000x each time void draw() is drawn once (speed up pixel load time)
  {
    drawADot(workingImage);
  }
  
  numberOfDots += DOTSPERDRAW;
  
}



void drawADot(PImage theImage)
{
  
  

  int imageWidth = theImage.width; // interger 'imageWidth' = width of image
  int imageHeight = theImage.height;  // interger 'imageHeight' = height of image
  int ptSize = int(random(100)) + 4;  //  ptSize is a random number between 0 - 100 with 4 added after the random number is chosen
  
  

  float pointillize = map(mouseX, 0, width, smallPoint, largePoint); // pointalize is a float determined by the 'x' position of the mouse. It creates a value between 0 - 100 that is translated to 0 = smallPoint's size and 100 = large point's size. This generates all floats inbetween smallPoint and largePoint.
  int x = int(random(0, imageWidth/8)); // x is a random interger between 0 and imageWidth/(n). This later allows the multiplication of the x value to map out ellipeses every (n) pixels 
  int y = int(random(0, imageHeight/8)); // y is a random interger between 0 and imageHeight/(n). This later allows the multiplication of the x value to map out ellipeses every (n) pixels



  //for (int y = 0; y < height; y++) {
  // for (int x = 0; x < width; x++) {
  int loc = (x + y*width)*8;  // grabs a location on the image data strip to later find the color of that data point.


  //add tenth_pixel_image code


  float r = red(theImage.pixels[loc]);  // finds red value of the above grabbed location 'loc'.
  float g = green(theImage.pixels[loc]);  // finds green value of the above grabbed location 'loc'.
  float b = blue(theImage.pixels[loc]);  // finds blue value of the above grabbed location 'loc'.



  //if ((x*10 % 10 == 0) && (y*10 % 10 == 0))
   // If we are an even column

    if (mousePressed){  // do the following drawings when the mouse is pressed (later to be data input).
    //color pix = img.get(x*8, y*8);
    
    
    fill(r,g,b, 100);  // sets fill color according to the 'loc' RGB value and opacity level
    ellipse(x*8, y*8, pointillize, pointillize);  // draws an ellipse at every x,y location devisable by eight; width and height is equal to the map() formula set in 'pointillize'.  
    
    
     }
   // }
  // }
  
}

