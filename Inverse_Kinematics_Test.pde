//Now with 100% more GIT!!
import processing.serial.*;
Serial myPort;  // Create object from Serial class

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
  frameRate(60);
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
 move();
 background(200);
 leg0.update();
 leg1.update();
}

void move(){
leg0TargetX = mouseX;
leg0TargetY = mouseY;
 
leg1TargetX = mouseX;
leg1TargetY = mouseY;
 //println(legX);
 //println(legY);
}



class IK{
  float legX, legY;
  int legNo;
  IK (int lN, float lX, float lY){
    legX = lX;
    legY = lY;
    legNo = lN;
  }

  void update(){
    
    if(legNo == 0){
     targetX =leg0TargetX;
     targetY = leg0TargetY; 
     
     a1 = constrain(a1, 0, 90);
     servo1 = int(map(a1,0,90,0,250));
     myPort.write(0xFF);
     myPort.write(0x00); 
     servo_bytes = new byte[2];
     servo_bytes[0] = (byte(servo1));
     servo_bytes[1] = (byte(servo1>>7));
     myPort.write(servo_bytes);
     myPort.write(0x7F);
     
     a2 = a2-30;
     a2 = constrain(a2, 0, 90);
     servo2 = int(map(a2,0,90,0,250));
     myPort.write(0xFF);
     myPort.write(0x01); 
     servo_bytes = new byte[2];
     servo_bytes[0] = (byte(servo2));
     servo_bytes[1] = (byte(servo2>>7));
     myPort.write(servo_bytes);
     myPort.write(0x7F);

    }
    else if(legNo == 1){
     targetX =leg1TargetX;
     targetY = leg1TargetY;
     

    }
    else if(legNo == 2){
      
    }
    else if(legNo == 3){
      
    } 
    
    upArmPos.set(targetX, targetY);
    lowArmPos.set(legX, legY);
    
     halfPos = PVector.add(lowArmPos, upArmPos);
     halfPos.div(2);
 
     float d = halfPos.dist(upArmPos);
     float Length = sqrt(100*100 - d*d);
 
     float a = atan2(lowArmPos.y - upArmPos.y, lowArmPos.x - upArmPos.x);
     a = a+(PI/2);
  
     float offsetX =  Length*(cos(a));
     float offsetY =  Length*(sin(a));
 
     midArmPos.set(halfPos.x-offsetX, halfPos.y-offsetY);
     
     stroke(0);
     line(lowArmPos.x, lowArmPos.y, midArmPos.x, midArmPos.y);
     line(midArmPos.x, midArmPos.y, upArmPos.x, upArmPos.y);
     
     textSize(18);
     a1 = degrees(atan2(lowArmPos.y - midArmPos.y, lowArmPos.x - midArmPos.x));
     a1 = map(a1, 0, -180, 0, 180);
     text(a1, legX, 15);
 
     a2 = degrees(atan2(midArmPos.y - upArmPos.y, midArmPos.x - upArmPos.x));
     if(a2 > 0){
       a2 = map(a2, 0, 180, 180, 0);
     }
     else{
       a2 = map(a2, 0, -180, -180, 0); 
     }
     a2 =  a1 - a2;
     text(a2, legX, 30);
     
     
      
  }
}