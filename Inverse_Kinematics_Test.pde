//Now with 100% more GIT!!
import processing.serial.*;
Serial myPort;

int servo1, servo2;
byte[] servo_bytes;

PVector upArmPos, midArmPos, lowArmPos;
PVector halfPos, halfVec;
public float targetX, targetY, a1, a2;
public float leg0TargetX, leg0TargetY, leg1TargetX, leg1TargetY;

IK leg0 = new IK(0, 500*0.25, 0);
IK leg1 = new IK(1, 500*0.75, 0);

void setup(){
  size(500, 300);
  frameRate(330);
  smooth();
  
  lowArmPos = new PVector(0, 0);
  midArmPos = new PVector(0, 0);
  upArmPos = new PVector(0, 0);
  halfPos = new PVector(0, 0);
  halfVec = new PVector(150, 0);
  
   myPort = new Serial(this, "COM10", 115200, 'N', 8, 2.0);
   myPort.write(0xAA);
   myPort.write(0x0C); 
   myPort.write(0x04);  
   myPort.write(0x00); 
   myPort.write(0x70); 
   myPort.write(0x2E);
  
}

void draw(){
 Gait();
 background(200);
 leg0.update();
 leg1.update();
}