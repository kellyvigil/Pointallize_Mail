  // The next line is needed if running in JavaScript Mode with Processing.js
  /* @pjs preload="moonwalk.jpg"; */
  
  
  PImage img[] = new PImage[2];
  
  int smallPoint, largePoint;
  
  final int DOTSPERDRAW = 100;
  
  int numberOfDots = 0;
  
  final int MAXDOTS = DOTSPERDRAW * 100; 
  
  PImage workingImage ;
  
  int index;
  
  
  
  
  void setup() {
    size(1920, 1080);
    //img = loadImage("rio.jpg");
  
  
    img[0] = loadImage("drake.png");
    img[1] = loadImage("river.png");
  
    workingImage = img[0];
  
    smallPoint = 8;
    largePoint = 8;
    imageMode(CENTER);
    image(workingImage, 960, 540);
    noStroke();
    background(255);
  }
  
  
  
  void draw() { 
  
  
    if (mousePressed) {
  
      if (numberOfDots > 100000) {
        index = (index + 1) % img.length;
        workingImage = img[index];
        numberOfDots = 0;
      }
  
      if (numberOfDots == 0) {
        background(255);
      } 
  
  
      for (int i = 0; i < DOTSPERDRAW; i++) //drawADot 1000x each time void draw() is drawn once (speed up pixel load time)
      {
        drawADot(workingImage);
      }
  
      numberOfDots += DOTSPERDRAW;
  
      println( "number of dots = " + numberOfDots);
    }
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
  
  
    //float r = red(theImage.pixels[loc]);  // finds red value of the above grabbed location 'loc'.
    //float g = green(theImage.pixels[loc]);  // finds green value of the above grabbed location 'loc'.
    //float b = blue(theImage.pixels[loc]);  // finds blue value of the above grabbed location 'loc'.
    color argb = color(0, 0, 0, 255);
    int a = (argb >> 24) & 0xFF;
    int r = (argb >> 16) & 0xFF;  // Faster way of getting red(argb)
    int g = (argb >> 8) & 0xFF;   // Faster way of getting green(argb)
    int b = argb & 0xFF;          // Faster way of getting blue(argb)
    color pix = theImage.get(x*8, y*8);
    
    //if ((x*10 % 10 == 0) && (y*10 % 10 == 0))
    // If we are an even column
  
    //if (mousePressed) {  // do the following drawings when the mouse is pressed (later to be data input).
    
    if (pix == color(252,240,186,255) || a == 0) {
    
    
    }
    else {
      
      fill(pix, 255);  // sets fill color according to the 'loc' RGB value and opacity level
      ellipse(x*8, y*8, pointillize, pointillize);  // draws an ellipse at every x,y location devisable by eight; width and height is equal to the map() formula set in 'pointillize'.
    
    
    }  
    // }
    // }
    // }
  }

