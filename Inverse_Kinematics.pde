
class IK{
  float legX, legY, legZ;
  int legNo;
  IK (int lN, float lX, float lY, float lZ){
    legX = lX;
    legY = lY;
    legZ = lZ;
    legNo = lN;
  }

  void update(){
    
    if(legNo == 0){
     targetX = leg0TargetX;
     targetY = leg0TargetY;
     targetZ = leg0TargetZ;
    }
    else if(legNo == 1){
     targetX = leg1TargetX;
     targetY = leg1TargetY;
     targetZ = leg1TargetZ;
    }
    else if(legNo == 2){
     targetX = leg2TargetX;
     targetY = leg2TargetY;
     targetZ = leg2TargetZ;
    }
    else if(legNo == 3){
     targetX = leg3TargetX;
     targetY = leg3TargetY;
     targetZ = leg3TargetZ;
    } 
    
    upArmPos.set(targetX, targetY, targetZ);
    lowArmPos.set(legX, legY, legZ);
    
    
    float d0 = upArmPos.dist(lowArmPos);
    float d1 = dist(legX, legY, targetX, targetY);
    upArmPos.set(targetX, (targetY + (d0-d1)), legZ);
    
    
     halfPos = PVector.add(lowArmPos, upArmPos);
     halfPos.div(2);
 
     float d = halfPos.dist(upArmPos);
     float Length = sqrt(100*100 - d*d);
 
     float a = atan2(lowArmPos.y - upArmPos.y, lowArmPos.x - upArmPos.x);
     a = a+(PI/2);
  
     float offsetX =  Length*(cos(a));
     float offsetY =  Length*(sin(a));
     //float offsetZ = 
 
     midArmPos.set(halfPos.x-offsetX, halfPos.y-offsetY, legZ);
     
     stroke(255);
     noFill();
     

     /*beginShape();
     vertex(targetX, targetY, targetZ);
     vertex(legX, legY, legZ);
     vertex(targetX, targetY, targetZ);
     endShape();*/
     
     pushMatrix();
     rotateX(atan((targetZ-legZ)/targetY));
     translate(0, (legZ*sin(atan((targetZ-legZ)/targetY))), 0);
     beginShape();
     vertex(lowArmPos.x, lowArmPos.y, lowArmPos.z);
     vertex(midArmPos.x, midArmPos.y, midArmPos.z);
     vertex(upArmPos.x, upArmPos.y, upArmPos.z);
     endShape();
     popMatrix();
     
     //stroke(0);
     //line(lowArmPos.x, lowArmPos.y, midArmPos.x, midArmPos.y);
     //line(midArmPos.x, midArmPos.y, upArmPos.x, upArmPos.y);
     
     textSize(18);
     a1 = degrees(atan2(lowArmPos.y - midArmPos.y, lowArmPos.x - midArmPos.x));
     a1 = map(a1, 0, -180, 0, 180);
     text(a1, legX, legY+15, legZ);
 
     a2 = degrees(atan2(midArmPos.y - upArmPos.y, midArmPos.x - upArmPos.x));
     if(a2 > 0){
       a2 = map(a2, 0, 180, 180, 0);
     }
     else{
       a2 = map(a2, 0, -180, -180, 0); 
     }
     a2 =  a1 - a2;
     text(a2, legX, legY+30, legZ); 
     
     a3 = degrees(atan((targetZ-legZ)/targetY));
     text(a3, legX, legY+45, legZ);
     
         
     a1 = constrain(a1, 0, 120);
     servo1 = int(map(a1,0,120,0,254));
     myPort.write(0xFF);
     if(legNo == 0){  
       myPort.write(0x00); 
     }
     else if(legNo == 1){
       myPort.write(0x03);
     }
     else if(legNo == 2){
       myPort.write(0x06);
     }
     else if(legNo == 3){
       myPort.write(0x09);
     }
     servo_bytes1 = new byte[2];
     servo_bytes1[0] = (byte(servo1));
     servo_bytes1[1] = (byte(servo1>>7));
     myPort.write(servo_bytes1);
     myPort.write(0x7F);
     
     a2 = a2-30;                       // -30
     a2 = constrain(a2, 0, 120);
     servo2 = int(map(a2,0,120,0,254));
     myPort.write(0xFF);
     if(legNo == 0){  
       myPort.write(0x01); 
     }
     else if(legNo == 1){
       myPort.write(0x04);
     }
     else if(legNo == 2){
       myPort.write(0x07);
     }
     else if(legNo == 3){
       myPort.write(0x10);
     } 
     servo_bytes2 = new byte[2];
     servo_bytes2[0] = (byte(servo2));
     servo_bytes2[1] = (byte(servo2>>7));
     myPort.write(servo_bytes2);
     myPort.write(0x7F);
     
     a3 = a3 + 30;
     servo3 = int(map(a3,0,120,0,254));
     myPort.write(0xFF);
     if(legNo == 0){  
       myPort.write(0x02); 
     }
     else if(legNo == 1){
       myPort.write(0x05);
     }
     else if(legNo == 2){
       myPort.write(0x08);
     }
     else if(legNo == 3){
       myPort.write(0x11);
     }  
     servo_bytes3 = new byte[2];
     servo_bytes3[0] = (byte(servo3));
     servo_bytes3[1] = (byte(servo3>>7));
     myPort.write(servo_bytes3);
     myPort.write(0x7F);
  }
  
}