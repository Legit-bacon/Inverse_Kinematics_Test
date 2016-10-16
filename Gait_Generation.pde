int state = 0;

float l0 = 0.5;
float l1 = 0.75;
float l2 = 0.25;
float l3 = 0;

float speed = 0.001;

class Gait{
  public boolean legRetract= false;
  int retractCount, retractAmount = 30, legZ = 150;
  float legNo, posX, posY, posZ, oriX, oriY, retractX;
    Gait(float lN, float lX, float lY){
     legNo = lN;
     posX = lX;
     oriX = lX;
     posY = lY;
     oriY = lY;
     posZ = legZ;
     retractX = 0;
    }
  
  void update(){
    
    if(legNo == 0){
      l0 = l0-forwardsSpeed;
      l1 = l1-forwardsSpeed;
      l2 = l2-forwardsSpeed;
      l3 = l3-forwardsSpeed;      
    }
    
      if(l0 > 1){
        if(legNo == 0){
        retractX = 1;
        l0 = 0;
        legRetract = true;
        }
      } else if(l0 < 0){
      if(legNo == 0){
        retractX = 0;
        l0 = 1;
        legRetract = true;
        }
      }
      if(l1 > 1){
        if(legNo == 1){
        retractX = 1;
        l1 = 0; 
        legRetract = true;
        }
      } else if(l1 < 0){
        if(legNo == 1){
        retractX = 0;
        l1 = 1;
        legRetract = true;
        }
      }
      if(l2 > 1){
        if(legNo == 2){
        retractX = 1;
        l2 = 0;
        legRetract = true;
        }
      } else if(l2 < 0){
        if(legNo == 2){
        retractX = 0;
        l2 = 1;
        legRetract = true;
        }
      }
      if(l3 > 1){
        if(legNo == 3){
        retractX = 1;
        l3 = 0; 
        legRetract = true;
        }
      } else if(l3 < 0){
        if(legNo == 3){
        retractX = 0;
        l3 = 1;
        legRetract = true;
        }
      }
    
    println(legRetract);
    
    if(legNo == 0){
      if(legRetract == true && retractCount < 25){
        posZ = legZ-retractAmount;
        retractX += (l0-retractX)/10;
        posY = oriY - map(retractX, 0, 1, -115, 115);
        retractCount ++;
      }else{
          posY = oriY - map(l0, 0, 1, -115, 115);
          legRetract = false;
          retractCount = 0;
          posZ = legZ;
        }
      }
    else if(legNo == 1){
    if(legRetract == true && retractCount < 25){
        posZ = legZ-retractAmount;
        retractX += (l1-retractX)/10;
        posY = oriY - map(retractX, 0, 1, -115, 115);
        retractCount ++;
      }else{
          posY = oriY - map(l1, 0, 1, -115, 115);
          legRetract = false;
          retractCount = 0;
          posZ = legZ;
        }
      }
    else if(legNo == 2){
    if(legRetract == true && retractCount < 25){
        posZ = legZ-retractAmount;
        retractX += (l2-retractX)/10;
        posY = oriY - map(retractX, 0, 1, -115, 115);
        retractCount ++;
      }else{
          posY = oriY - map(l2, 0, 1, -115, 115);
          legRetract = false;
          retractCount = 0;
          posZ = legZ;
        }
      }
    else if(legNo == 3){
    if(legRetract == true && retractCount < 25){
        posZ = legZ-retractAmount;
        retractX += (l3-retractX)/10;
        posY = oriY - map(retractX, 0, 1, -115, 115);
        retractCount ++;
      }else{
          posY = oriY - map(l3, 0, 1, -115, 115);
          legRetract = false;
          retractCount = 0;
          posZ = legZ;
        }
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