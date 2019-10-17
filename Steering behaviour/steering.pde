import java.util.*;

/*
a basic implementation of Craig Reynolds steering behaviour for autonomous agents algorithm
*/


Agent[] agents = new Agent[1];

void setup(){
  size(800, 800);
  pixelDensity(2);
  
  for(int i = 0; i < agents.length; i++){
    agents[i] = new Agent();
  }
}

void draw(){
  background(200, 200, 200);
  for(int i = 0; i < agents.length; i++){
    agents[i].update();
    agents[i].show();
  }
}

class Agent{
  PVector pos;
  PVector vel;
  PVector acc;
  float size = 5;
  float speed = 4;
  
  public Agent(){
    this.pos = new PVector(width/2, height/2);
    this.vel = new PVector(random(-speed, speed), random(-speed, speed));
    this.acc = new PVector(0, 0);
  }
  
  public void show(){
    push();
    translate(this.pos.x, this.pos.y);
    rotate(this.vel.heading() - PI/2);
    beginShape();
    vertex(0, 0);
    vertex(-this.size, -this.size*4);
    vertex(this.size, -this.size*4);
    endShape(CLOSE);
    pop();
  }
  
  public void update(){
    this.addForce(this.desiredAngle().mult(.1));
    this.vel.add(this.acc);
    this.vel = this.vel.normalize().mult(speed);
    this.pos.add(this.vel);
    this.acc.mult(0);
  }
  
  public void addForce(PVector force){
    this.acc.add(force);
  }
  
  private PVector desiredAngle(){
    PVector desired = new PVector(mouseX - this.pos.x, mouseY - this.pos.y);
    desired.normalize();
    return desired.sub(this.vel).mult(speed);
  }
}
