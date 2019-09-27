/**
http://www.walkingrandomly.com/?p=151

where t denotes time, 
p is a phase factor between 0 and 2*pi 
and d is the strength of the damping term. 

The larger you make d, the more quickly the pendulum oscillations will decay.
**/

ArrayList<PVector> points;

float a1 = 1.f;
float a2 = 1.f;
float a3 = 1.f;
float a4 = 1.f;

float f1=3.001;
float f2=2;
float f3=3;
float f4=2;

float d1=0.004;
float d2=0.0065;
float d3=0.008;
float d4=0.019;

float p1=0;
float p2=0;
float p3=PI/2;
float p4=3*PI/2;

float t = 0;
float x, y;
float scale = 100;

void setup(){
  size(500, 500);

  points = new ArrayList<PVector>();

  for(int i=0; i<100; i++){
    x = exp(-d1 * t) * sin(t * f1 + p1) * a1 + exp(-d2 * t) * sin(t * f2 + p2) * a2;
    y = exp(-d3 * t) * sin(t * f3 + p3) * a3 + exp(-d4 * t) * sin(t * f4 + p4) * a4;
    points.add(new PVector(x*scale, y*scale));
    t += 0.1;
  }
  
}

void draw(){
  background(0, 75);
  translate(width/2, height/2);
  stroke(255);
  noFill();

  for(int i=0; i<points.size()-3; i++){
    PVector a = points.get(i);
    PVector b = points.get(i+1);
    PVector c = points.get(i+2);
    PVector d = points.get(i+3);
    strokeWeight(map(i, 0, points.size(), 0.2, 4));
    curve(a.x, a.y, b.x, b.y, c.x, c.y, d.x, d.y);
  }
  
  x = exp(-d1 * t) * sin(t * f1 + p1) * a1 + exp(-d2 * t) * sin(t * f2 + p2) * a2;
  y = exp(-d3 * t) * sin(t * f3 + p3) * a3 + exp(-d4 * t) * sin(t * f4 + p4) * a4;
  points.add(new PVector(x*scale, y*scale));
  points.remove(0);
  t += 0.1;
  
}

void init(){
  
  a1 = random(0.1, 2);
  a2 = random(0.1, 2);
  a3 = random(0.1, 2);
  a4 = random(0.1, 2);
  
  f1 = random(1, 4);
  f2 = random(1, 4);
  f3 = random(1, 4);
  f4 = random(1, 4);
  
  d1 = random(0.0001, 0.01);
  d2 = random(0.0001, 0.01);
  d3 = random(0.0001, 0.01);
  d4 = random(0.0001, 0.01);
  d4 = random(0.0001, 0.01);
  
  p1  =random(0, 2*PI);
  p2 = random(0, 2*PI);
  p3 = random(0, 2*PI);
  p4 = random(0, 2*PI);
  
  print("f1: " +f1 +"\n"
        +"f2: " +f2 +"\n"
        +"f3: " +f3 +"\n"
        +"f4: " +f4 +"\n"
        +"a1: " +a1 +"\n"
        +"a2: " +a2 +"\n"
        +"a3: " +a3 +"\n"
        +"a4: " +a4 +"\n"
        +"d1: " +d1 +"\n"
        +"d2: " +d2 +"\n"
        +"d3: " +d3 +"\n"
        +"d4: " +d4 +"\n"
        +"p1: " +p1 +"\n"
        +"p2: " +p2 +"\n"
        +"p3: " +p3 +"\n"
        +"p4: " +p4 +"\n");
}


void mouseClicked(){
  init();
}
