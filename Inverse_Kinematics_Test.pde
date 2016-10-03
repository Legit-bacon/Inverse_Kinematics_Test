//Now with 100% more GIT!!
import peasy.*;

PeasyCam cam;

import processing.serial.*;
Serial myPort;

int servo1, servo2, servo3;
byte[] servo_bytes;

PVector upArmPos, midArmPos, lowArmPos;
PVector halfPos, halfVec;
public float targetX, targetY, targetZ, a1, a2, a3;
public float leg0TargetX, leg0TargetY, leg0TargetZ;
public float leg1TargetX, leg1TargetY, leg1TargetZ;

IK Leg0 = new IK(0, 450*0.25, 0, 0);      //FIX Z ISSUE!!!
IK Leg1 = new IK(1, 450*0.75, 0, 0);      //FIX Z ISSUE!!!
//leg2
//leg3

Gait Gait0 = new Gait(0, -60, -115);
Gait Gait1 = new Gait(1, -60, 115);
Gait Gait2 = new Gait(2, 60, 115);
Gait Gait3 = new Gait(3, 60, -115);

void setup(){
  size(450, 450, P3D);
  frameRate(60);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(100);
  cam.setMaximumDistance(800);
  smooth();


  
  lowArmPos = new PVector(0, 0, 0);
  midArmPos = new PVector(0, 0, 0);
  upArmPos = new PVector(0, 0, 0);
  halfPos = new PVector(0, 0, 0);
  halfVec = new PVector(150, 0, 0);
  
   myPort = new Serial(this, "COM4", 115200, 'N', 8, 2.0);
   myPort.write(0xAA);
   myPort.write(0x0C); 
   myPort.write(0x04);  
   myPort.write(0x00); 
   myPort.write(0x70); 
   myPort.write(0x2E);
  
}

void draw(){
  Gait0.update();
  Gait1.update();
  background(0);
  lights();

  stroke(255);
  beginShape();
  vertex(-100, -100, -100);
  vertex( 100, -100, -100);
  vertex(   0,    0,  100);
  
  vertex( 100, -100, -100);
  vertex( 100,  100, -100);
  vertex(   0,    0,  100);

  vertex( 100, 100, -100);
  vertex(-100, 100, -100);
  vertex(   0,   0,  100);

  vertex(-100,  100, -100);
  vertex(-100, -100, -100);
  vertex(   0,    0,  100);
  endShape();

 Leg0.update();
 Leg1.update();
}