import processing.pdf.*;

void setup(){
  size(700, 700);
  width = 700;
  height = 700;
  pixelDensity(2);
  stroke(0, 150);
  colorMode(HSB, 360, 100, 100, 1.0);
  background(0, 0, 0);
}

int iter = 0;
void draw(){
  iter++;
  push();
  translate(width/2, height/2);
  rotate(random(-1, 1) * PI);
  branch(50, 300);  //#############################################
  pop();
  if(iter > 1000){
    fill(0, 0, 0, .8);
    strokeWeight(0);
    ellipse(width/2, height/ 2, 150, 150);
    //noFill();
    //strokeWeight(100);
    //stroke(0, 0, 0, .8);
    //ellipse(width/2, height/2, 700, 400);
    noLoop(); 
    dispose();
  }
  
  
}

void branch(float len, float hue){
  if(len < 10){
    return;
  }
  push();
  //stroke(random(360), 50 + len, 130 - (len * 3), map(len, 10, 50, .1, .8));
  stroke(hue, 50 + len, 130 - (len * 3));
  strokeWeight(map(len, 10, 50, 1, 15));
  translate(0, -len);
  rotate(random(-.8, .8) * PI);
  line(0, 0, 0, -len);
  branch(len*.88, hue);
  pop();
}
