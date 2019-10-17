float RANGE = .05;
float DISTANCE = 300;
float OPACITY = .02;
int NUM_OF_CIRCLES = 100;
float STARTING_DENSITY = 0;
int frame = 0;

Particle[] particles = new Particle[NUM_OF_CIRCLES];

void setup(){
  size(700, 700);
  pixelDensity(2);
  strokeWeight(1);
  colorMode(HSB, 360, 100, 100, 1);
  stroke(0, 0, 0, OPACITY);
  for(int i = 0; i < particles.length; i++){
    particles[i] = new Particle(i / particles.length * 2 * PI);
  }
}

void draw(){
  frame++;
  translate(width/2, height/2);
  for(int i = 0; i < particles.length; i++){
    particles[i].update();
    particles[i].show();
    for(int other = 0; other < particles.length; other++){
      if(other != i && PVector.dist(particles[i].pos, particles[other].pos) < i / 3){
        line(particles[i].pos.x, particles[i].pos.y, particles[other].pos.x, particles[other].pos.y);
      }
    }
  }
  if(frame > 500){
    noLoop();
  }
}

class Particle{
  PVector pos;
  PVector vel;
  float size;
  color col;
  public Particle(float angle){
    angle = random(0, 2*PI);
    pos = new PVector(STARTING_DENSITY * cos(angle), STARTING_DENSITY * sin(angle));
    vel = new PVector(cos(angle), sin(angle));
    size = random(3, 10);
    col = color(random(360), random(100), random(100), .05);
  }
  
  public void update(){
    this.vel.add(new PVector(random(-RANGE, RANGE), random(-RANGE, RANGE)));
    this.pos.add(this.vel.normalize());
  }
  
  public void show(){
    fill(this.col);
    //ellipse(this.pos.x, this.pos.y, this.size, this.size);
  }
}
