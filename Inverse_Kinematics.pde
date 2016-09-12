
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
     
     a1 = constrain(a1, 0, 90);
     servo1 = int(map(a1,0,90,0,250));
     myPort.write(0xFF);
     myPort.write(0x03); 
     servo_bytes = new byte[2];
     servo_bytes[0] = (byte(servo1));
     servo_bytes[1] = (byte(servo1>>7));
     myPort.write(servo_bytes);
     myPort.write(0x7F);
     
     a2 = a2-30;
     a2 = constrain(a2, 0, 90);
     servo2 = int(map(a2,0,90,0,250));
     myPort.write(0xFF);
     myPort.write(0x04); 
     servo_bytes = new byte[2];
     servo_bytes[0] = (byte(servo2));
     servo_bytes[1] = (byte(servo2>>7));
     myPort.write(servo_bytes);
     myPort.write(0x7F);

     

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
     text(a1, legX, legY+15);
 
     a2 = degrees(atan2(midArmPos.y - upArmPos.y, midArmPos.x - upArmPos.x));
     if(a2 > 0){
       a2 = map(a2, 0, 180, 180, 0);
     }
     else{
       a2 = map(a2, 0, -180, -180, 0); 
     }
     a2 =  a1 - a2;
     text(a2, legX, legY+30); 
  }
  
}