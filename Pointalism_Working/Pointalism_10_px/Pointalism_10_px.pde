  import gifAnimation.*;
  import org.rsg.carnivore.*;
  import org.rsg.lib.Log;
  GifMaker gifExport;
  CarnivoreP5 c;
  
  
  PImage img[] = new PImage[2];
  
  PImage workingImage;
  
  PImage img2;
  
  int index;
  
  int drawnDots = 0;
  
  int sm = 7;
  
  int lr = 4;
  
  int drawSpeed = 100;
  
  int maxDots = 200000;
  
  boolean packet = false;
  
  boolean tcpDitected = false;
  
  
  
  
  
  
  void setup() {
  
    size(1920, 1080);
  
    Log.setDebug(true); // Uncomment for verbose mode
    c = new CarnivoreP5(this); 
  
    img[0] = loadImage("painting.png");
  
    img[1] = loadImage("drake.png");
  
  
    workingImage = img[0];
  
    imageMode(CENTER);
  
    image(workingImage, 960, 540);
  
    noStroke();
  
    background(0);
  
    img2 = loadImage("dickbuttsmall.png");
  }
  
  
  
  void packetEvent(CarnivorePacket p) {
  
    println("(" + p.strTransportProtocol + " packet) " + p.senderSocket() + " > " + p.receiverSocket() + " || dots = " + drawnDots);
  
    //println("dots = " + drawnDots);
  
    drawADot(workingImage);
  
    if (p.strTransportProtocol == "TCP" || p.strTransportProtocol == "UDP") {
  
      packet = true;
    }
  
    else {
      packet = false;
    } 
  
    if (packet) {
  
      tcpDitected = true;
      packet = false;
    }
  
    if (!packet) {
      
    }
    
  }
  
  
  
  void draw() { 
  
  
    if (drawnDots > maxDots) { // when drawnDots is greater than maxDots move to the next image and set drawn dots back to 0
  
      index = (index + 1) % img.length;
      workingImage = img[index];
      drawnDots = 0;
      //gifExport.finish();
    }
  
    if (drawnDots == 0) { // when drawnDots is 0 set the background to black
  
      background(0);
    } 
  
    drawADot(workingImage);
  
    //for (int i = 0; i < drawSpeed; i++){
  
    //}
  }
  
  
  void drawADot(PImage theImage) {
  
  
  
    if (tcpDitected) {
  
      int imageWidth = theImage.width; // interger 'imageWidth' = width of image
      int imageHeight = theImage.height;  // interger 'imageHeight' = height of image
      int ptSize = int(random(100)) + 4;  //  ptSize is a random number between 0 - 100 with 4 added after the random number is chosen
  
      int x = int(random(0, imageWidth/12)); // x is a random interger between 0 and imageWidth/(n). This later allows the multiplication of the x value to map out ellipeses every (n) pixels 
      int y = int(random(0, imageHeight/12)); // y is a random interger between 0 and imageHeight/(n). This later allows the multiplication of the x value to map out ellipeses every (n) pixels
  
      int loc = (x + y*width)*8;  // grabs a location on the image data strip to later find the color of that data point.
  
      color argb = color(0, 0, 0, 255);
      int a = (argb >> 24) & 0xFF;
      int r = (argb >> 16) & 0xFF;  // Faster way of getting red(argb)
      int g = (argb >> 8) & 0xFF;   // Faster way of getting green(argb)
      int b = argb & 0xFF;          // Faster way of getting blue(argb)
  
      color pix = theImage.get(x*12, y*12); // get the color of every 8th x 8th pixel
  
  
  
      boolean drawThis = false; //drawThis boolean
  
  
  
      if (pix == color(252, 240, 186)) { // if the color of the pixel is yellow
  
        drawThis = false;
      } 
  
      else {
  
        drawThis = true;
      } 
  
      if (drawThis) { // if drawThis is true do the following
  
        fill(pix, 255);  // sets fill color according to the 'loc' RGB value and opacity level
  
        ellipse(x*12, y*12, sm, sm);  // draws an ellipse at every x,y location devisable by eight; width and height is equal to the map() formula set in 'pointillize'.
  
  
        //image(img2, x*8, y*8, sm, sm);
  
  
        drawnDots += 1; // if a dot is drawn, count it
      }
  
      if (!drawThis) { // do nothing if drawThis is false i.e. if color(252,240,186)
      
      }
      
    }
  
    tcpDitected = false;
    
  }
  

