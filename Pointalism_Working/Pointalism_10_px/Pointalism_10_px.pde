import gifAnimation.*;
GifMaker gifExport;


// X1CIqHNfM3Vi5OuxqpktKDTIU                           << twitter Consermer API Key
// SUPqNPbxlYWnLznusEpSEKokNXoeG4scbFscdTgTJIY6R5zSA9  << twitter Consumer API Secret
// 387406776-05Uk4V5KmTjfu035FPtleMngacrc97PesgaKSrtV  << twitter Access Token
// Us4wFQjOxyMsLSdFhq4xMO0M65uBzyBYMyCDVQDRmm8Z3       << twitter Access Token Secret

  /*
  import twitter4j.conf.*;
  import twitter4j.*;
  import twitter4j.auth.*;
  import twitter4j.api.*;
  import java.util.*;
  
  Twitter twitter;
  String searchString = "digital";  
  List<Status> tweets;
  
  int currentTweet;
  */
  
  
  
  PImage img[] = new PImage[2];
  
  PImage workingImage;
  
  PImage img2;
  
  int index;
  
  int drawnDots = 0;
  
  int sm = 40;
  
  int lr = 4;
  
  int drawSpeed = 100;
  
  int maxDots = 100000;
  
  
  
  /*( boolean sketchFullScreen() {
   return true;
   }
   */
   
   
  
  void setup() {
    
    size(1920, 1080);
    /*
    ConfigurationBuilder cb = new ConfigurationBuilder();
    cb.setOAuthConsumerKey("X1CIqHNfM3Vi5OuxqpktKDTIU");
    cb.setOAuthConsumerSecret("SUPqNPbxlYWnLznusEpSEKokNXoeG4scbFscdTgTJIY6R5zSA9");
    cb.setOAuthAccessToken("387406776-05Uk4V5KmTjfu035FPtleMngacrc97PesgaKSrtV");
    cb.setOAuthAccessTokenSecret("Us4wFQjOxyMsLSdFhq4xMO0M65uBzyBYMyCDVQDRmm8Z3");
    
    TwitterFactory tf = new TwitterFactory(cb.build());
    
    twitter = tf.getInstance();
    
    getNewTweets();
    
    
    
    currentTweet = 0;
    */
  
    img[0] = loadImage("dickbutt.png");
  
    img[1] = loadImage("river.png");
    
  
    workingImage = img[0];
  
    imageMode(CENTER);
  
    image(workingImage, 960, 540);
  
    noStroke();
  
    background(255);
    
    img2 = loadImage("dickbuttsmall.png");
    
 // thread("refreshTweets");
    
    //frameRate(30);
    
    
 // gifExport = new GifMaker(this, "dickbutt_export.gif");
 // gifExport.setRepeat(0); // make it an "endless" animation
 // gifExport.setTransparent(255); // make white the transparent color -- match browser bg color
 // gifExport.setDelay(1000/30);  //12fps in ms
    

    
  }
  
  
  
  void draw() { 
  
  
    if (mousePressed) { 
  
      if (drawnDots > maxDots) { // when drawnDots is greater than maxDots move to the next image and set drawn dots back to 0
        
        index = (index + 1) % img.length;
        workingImage = img[index];
        drawnDots = 0;
        gifExport.finish();
        
      }
  
      if (drawnDots == 0) { // when drawnDots is 0 set the background to black
        
        background(255);
      
      } 
  
  
      for (int i = 0; i < drawSpeed; i++){ //drawADot drawSpeed times each time void draw() is drawn once (speed up pixel load time)
      
        drawADot(workingImage);
        
      }
      
      /*  if (numberOfDots > 950000) {
        
       sm = 1;
       lr = 3;
       
       }
       
       else if (numberOfDots > 900000) {
         
       sm = 50;
       lr = 50;
       
       } 
       
       else if (numberOfDots > 800000) {
         
       sm = 15;
       lr = 20;
       
       } 
       
       else if (numberOfDots > 600000) {
         
       sm = 9;
       lr = 12;
       
       } 
       
       else if (numberOfDots > 400000) {
         
       sm = 6;
       lr = 9;
       
       } 
       
       else if (numberOfDots > 20000) {
         
       sm = 3;
       lr = 5;
       
       } 
       
       else if (numberOfDots > 8000) {  
         
       sm = 1;
       lr = 3;
       
       } */
       
       
       
       
    }
    
    /*
    fill(0, 40);
    
    rect(0, 0, width, height);
    
    currentTweet = currentTweet + 1;
    
    if (currentTweet >= tweets.size()){
      
    currentTweet = 0;
    
    }
    
    Status status = tweets.get(currentTweet);
    
    fill(200);
    
    text(status.getText(), random(width), random(height), 300, 200);
    
    delay(250);
    
    */
    
   // gifExport.setDelay(1);
   // gifExport.addFrame();
    
  }
  
  /*void getNewTweets() {
    
    try {
      
    Query query = new Query(searchString); // try to get tweets here
    
    QueryResult result = twitter.search(query);
    
    tweets = result.getTweets();
    
    } 
    catch (TwitterException te) {
      
    System.out.println("Failed to search tweets: " + te.getMessage()); // deal with the case where we can't get them here
    
    System.exit(-1);
    
    }
    
  }
  
  
   void refreshTweets(){
     
     while (true){
       
        getNewTweets();

        println("Updated Tweets"); 

        delay(0);
    }

   }
   
   */
  
 
  void drawADot(PImage theImage){
  
  
  
    int imageWidth = theImage.width; // interger 'imageWidth' = width of image
    int imageHeight = theImage.height;  // interger 'imageHeight' = height of image
    int ptSize = int(random(100)) + 4;  //  ptSize is a random number between 0 - 100 with 4 added after the random number is chosen

    int x = int(random(0, imageWidth/8)); // x is a random interger between 0 and imageWidth/(n). This later allows the multiplication of the x value to map out ellipeses every (n) pixels 
    int y = int(random(0, imageHeight/8)); // y is a random interger between 0 and imageHeight/(n). This later allows the multiplication of the x value to map out ellipeses every (n) pixels
   
    int loc = (x + y*width)*8;  // grabs a location on the image data strip to later find the color of that data point.
    
    color argb = color(0, 0, 0, 255);
    int a = (argb >> 24) & 0xFF;
    int r = (argb >> 16) & 0xFF;  // Faster way of getting red(argb)
    int g = (argb >> 8) & 0xFF;   // Faster way of getting green(argb)
    int b = argb & 0xFF;          // Faster way of getting blue(argb)
  
    color pix = theImage.get(x*8, y*8); // get the color of every 8th x 8th pixel
  
    boolean drawThis = false; //drawThis boolean
      
    if (pix == color(252, 240, 186)) { // if the color of the pixel is yellow
  
      drawThis = false; 
      
    } 
    
    else {
  
      drawThis = true;
      
    } 
  
    if (drawThis) { // if drawThis is true do the following
  
      //fill(pix, 255);  // sets fill color according to the 'loc' RGB value and opacity level
  
      //ellipse(x*4, y*4, sm, sm);  // draws an ellipse at every x,y location devisable by eight; width and height is equal to the map() formula set in 'pointillize'.
  
  
      image(img2, x*8, y*8, sm, sm);
      
      
      drawnDots += 1; // if a dot is drawn, count it
      
    }
  
    if (!drawThis) { // do nothing if drawThis is false i.e. if color(252,240,186)
      
    }
  
    println("dot count = " + drawnDots);
  
  
  }
  
  
  
  

