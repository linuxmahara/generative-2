PVector lerp(PVector p1, PVector p2, float dis){
  float x = abs(p1.x - p2.x)*dis;
  float y = abs(p1.y - p2.y)*dis;
  x = p1.x < p2.x? x + p1.x : x + p2.x;
  y = p1.y < p2.y? y + p1.y : y + p2.y;
  PVector midPoint = new PVector(x, y);
  return midPoint;
}

class Poly{
  PVector[] points;
  
  public Poly(PVector[] _points){
    points = _points;
  }
  
  public void draw(){
    beginShape();
    for(int i = 0; i < this.points.length; i++){
      vertex(this.points[i].x, this.points[i].y);
    }
    endShape(CLOSE);
  }
  
  public Poly interpolate(){
    PVector[] newPoints = new PVector[this.points.length * 2];
    println(newPoints.length);
    for(int i = 0; i < newPoints.length - 1; i++){
      if(i%2 == 0){
        newPoints[i] = this.points[i / 2];
      }else{
        newPoints[i] = lerp(this.points[i/2], this.points[i/2+1], .5);
      }
    }
    newPoints[newPoints.length - 1] = lerp(this.points[0], this.points[this.points.length - 1], .5);
    
    return new Poly(newPoints);
  }
  
  public void randomize(float range){
    for(int i = 0; i < this.points.length; i++){
      PVector random = new PVector(random(-range, range), random(random(-range, range)));
      this.points[i] = this.points[i].add(random);
    }
  }
}

Poly square;


void setup(){
  PVector[] points = new PVector[]{new PVector(100, 100), new PVector(100, 400), new PVector(400, 400), new PVector(400, 100)};
  
  colorMode(HSB, 360, 100, 100, 1);
  size(500, 500);
  pixelDensity(2);
  noStroke();
  background(300);
  
  fill(random(360), random(0, 100), random(0, 100), .2);
  square = new Poly(points);
  square.randomize(5);
  Poly newSquare = square.interpolate();
  newSquare.randomize(0);
  for(int i = 0; i < 4; i++){
    newSquare = newSquare.interpolate();
    newSquare.randomize(i * 10);
    fill(random(360), random(30, 80), random(50, 100), .2);
    newSquare.draw();
  }
  
}

void draw(){
  
}
