String words = "Sean M Burgess // Interaction + Graphic Designer";
String rev = new String(reverse(words.toCharArray()));

float segLength = words.length();
float stepSize;
float[] x = new float[words.length()+1];
float[] y = new float[words.length()+1];

PFont font;

void setup() {
  fullScreen(P3D);
  textMode(SHAPE);
  smooth(6);
  
  font = createFont("UniversLTStd-Bold", 10);
  textFont(font, 50);
}

void draw() {  
  background(249, 66, 58);
  noCursor();
 
  PVector loc = new PVector(mouseX, mouseY);
  //draw first section of string
  dragSegment(0, loc.x, loc.y, segLength, ' ');
  //creates rest of section to follow
  for(int i=0; i<x.length-1; i++) {
    char currentLetter = rev.charAt(i);
    stepSize = textWidth(currentLetter) + 5;
    dragSegment(i+1, x[i], y[i], segLength, currentLetter);
    }
    //largeLetter();
    
  }

void dragSegment(int i, float xin, float yin, float bin, char gin ) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * stepSize;
  y[i] = yin - sin(angle) * stepSize;
  segment(x[i], y[i], angle, bin, gin);
}

void segment(float xx, float yy, float a, float b, char g) { 
  pushMatrix();
  translate(xx, yy, a);
  rotate(a);
  rotateZ(a);
  rotateX(-a);
  rotateY(a);
  textSize(70);
  fill(255);
  text(g, b, 0);
  popMatrix();
}
void largeLetter(){
 pushMatrix();
    translate(-width/4, height/4, -300);
    textSize(1500);
    fill(255);
    textLeading(920);
    text("se" + "\n" + "an",0,100);
    
    popMatrix(); 
}