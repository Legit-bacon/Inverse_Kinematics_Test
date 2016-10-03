//Now with 100% more GIT!!
import processing.serial.*;
Serial myPort;

int servo1, servo2, servo3;
byte[] servo_bytes;

PVector upArmPos, midArmPos, lowArmPos;
PVector halfPos, halfVec;
public float targetX, targetY, targetZ, a1, a2, a3;
public float leg0TargetX, leg0TargetY, leg0TargetZ;
public float leg1TargetX, leg1TargetY, leg1TargetZ;

IK Leg0 = new IK(0, 450*0.25, 0, 0);
IK Leg1 = new IK(1, 450*0.75, 0, 0);

void setup(){
  size(450, 450);
  frameRate(60);
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
 Gait();
 background(200);
 Leg0.update();
 Leg1.update();
}