PImage img[] = new PImage[2];
int smallPoint, largePoint;
final int DOTSPERDRAW = 500;
int numberOfDots = 0;
final int MAXDOTS = DOTSPERDRAW * 100; 
PImage workingImage ;
int index;

void setup() {
  size(810, 455);
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

  for (int i = 0; i < DOTSPERDRAW; i++)
  {
    drawADot(workingImage);
  }

  numberOfDots += DOTSPERDRAW;
}

void drawADot(PImage theImage)
{

  int imageWidth = theImage.width;
  int imageHeight = theImage.height;
  int ptSize = int(random(100)) + 4;

  float pointillize = map(mouseX, 0, width, smallPoint, largePoint); //not used right now but for controlling ellipse size
  int x = int(random(0, imageWidth/8));
  int y = int(random(0, imageHeight/8));




  color pix = theImage.get(x*8, y*8);
  fill(pix, 255);
  ellipse(x*8, y*8, pointillize, pointillize);
}
