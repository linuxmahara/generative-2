int spacing = 50;
int intensity = 80;
int diffuse = 1;

float g = random(255);
float b = random(255);

void setup(){
  size(720, 720);
  background(90);
  noStroke();
  stroke(80, g, b, 120);
  noFill();
  strokeWeight(1);
}

void draw(){
  for(int y = height; y > 0; y -= spacing){
    float newColor = map(y + 160, 0, height, 0, 255) ;
    fill(newColor, g, b);
    float xoff = 0;
    beginShape();
    vertex(width, 0);
    vertex(0, 0);
    for(int x = 0; x < width; x += 1){
      float n = noise(xoff)*y + y;
      vertex(x, n);
      xoff += .008;
    }
    endShape();
  }
  noLoop();
}
