int state = 0;

float l0 = 0.5;
float l1 = 0.75;
float l2 = 0.25;
float l3 = 0;

float speed = 0.001;

class Gait{
  int testInt;
  float legNo, posX, posY, posZ, oriX, oriY;
    Gait(float lN, float lX, float lY){
     legNo = lN;
     posX = lX;
     oriX = lX;
     posY = lY;
     oriY = lY;
     posZ = 150;
     testInt = 1;
    }
  
  void update(){
    
    l0 = l0-forwardsSpeed;
    l1 = l1-forwardsSpeed;
    l2 = l2-forwardsSpeed;
    l3 = l3-forwardsSpeed;
    if(l0 > 1){
    l0 = 0;
    } else if(l0 < 0){
      l0 = 1;
      }
    if(l1 > 1){
    l1 = 0; 
    } else if(l1 < 0){
      l1 = 1;
      }
    if(l2 > 1){
    l2 = 0; 
    } else if(l2 < 0){
      l2 = 1;
      }
    if(l3 > 1){
    l3 = 0; 
    } else if(l3 < 0){
      l3 = 1;
      }
    
    if(legNo == 0){
    posY = oriY - map(l0, 0, 1, -115, 115);
    }
    else if(legNo == 1){
    posY = oriY - map(l1, 0, 1, -115, 115);
    }
    else if(legNo == 2){
    posY = oriY - map(l2, 0, 1, -115, 115);
    }
    else if(legNo == 3){
    posY = oriY - map(l3, 0, 1, -115, 115);
    }
    
   float a;
   a = oriY - posY;
   a = map(a, -115, 115, -turnSpeed, turnSpeed);
   if(legNo == 0 || legNo == 3){
   posX = oriX-a;
   }
   else{
   posX = oriX+a; 
   }
   
   if(legNo == 0){
    leg0TargetX = posY;
    leg0TargetY = posZ;
    leg0TargetZ = posX;
    
   }
   else if(legNo == 1){
    leg1TargetX = posY;
    leg1TargetY = posZ;
    leg1TargetZ = posX;
   }
   else if(legNo == 2){
    leg2TargetX = posY;
    leg2TargetY = posZ;
    leg2TargetZ = posX;
    
   }
   else if(legNo == 3){
    leg3TargetX = posY;
    leg3TargetY = posZ;
    leg3TargetZ = posX;
   }
  }
  
}