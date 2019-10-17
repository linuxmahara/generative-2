void setup(){
  size(800, 800);
  pixelDensity(2);
  background(230);
  noLoop();
  noStroke();
  fill(0, 0, 0, 5);
}

float rec(float angle, int iteration){
  /*
  will basically just give you random nested sins and cos
  
  examples:
  sin(angle * sin(angle * cos(angle)))
  or
  cos(angle * sin(angle * sin(angle)))
  or
  sin(angle * cos(angle * sin(angle)))
  */
  
  if(iteration < 3){ //only do this 3 times
    float z = floor(random(0, 2)) == 1? cos(angle * rec(angle, iteration + 1)) : sin(angle * rec(angle, iteration + 1)); //randomly chooses either a cos or a sin
    return(z);
  }else{
    return angle;
  }
}

float r(float angle){
  float r = rec(angle, 0);
  return r * 200;
}

void draw(){
  translate(width/2, height/2);
  for(int j = 0; j < 1; j++){
    for(float angle = 0;angle < 100 * PI; angle += .001){
      //goes around the circle 50 times and plots the output of the randomized recursive function rec()
      float x = r(angle) * cos(angle);
      float y = r(angle) * sin(angle);
      ellipse(x, y, 2, 2);
    }
  }
}
