//Now with 100% more GIT!!

PVector upArmPos, midArmPos, lowArmPos;
PVector halfPos, halfVec;
float targetX, targetY;
float leg0TargetX, leg0TargetY, leg1TargetX, leg1TargetY;

IK leg0 = new IK(0, width*0.25, 0);
IK leg1 = new IK(1, width*0.75, 0);

void setup(){
  size(500, 300);
  frameRate(60);
  smooth();
  
  lowArmPos = new PVector(0, 0);
  midArmPos = new PVector(0, 0);
  upArmPos = new PVector(0, 0);
  halfPos = new PVector(0, 0);
  halfVec = new PVector(150, 0);
}

void draw(){
 move();
 background(200);
 leg0.update();
// leg1.update();



 /*textSize(18);
 float a = degrees(atan2(lowArmPos.y - midArmPos.y, lowArmPos.x - midArmPos.x));
 a = map(a, 0, -180, 0, 180);
 text(a, 5, 15);
 
 float a2 = degrees(atan2(midArmPos.y - upArmPos.y, midArmPos.x - upArmPos.x));
 if(a2 > 0){
 a2 = map(a2, 0, 180, 180, 0);
 }
 else{
  a2 = map(a2, 0, -180, -180, 0); 
 }
 a2 =  a - a2;
 text(a2, 5, 30);*/

 
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
  
  IK (int legNo, float legX, float legY){
    if(legNo == 0){
      leg0TargetX = targetX;
      leg0TargetY = targetY;
    }
    else if(legNo == 1){
      leg1TargetX = targetX;
      leg1TargetY = targetY;
    }
    else if(legNo == 2){
      
    }
    else if(legNo == 3){
      
    } 
    println(targetX);
   // upArmPos.set(targetX, targetY);
  //  lowArmPos.set(legX, legY);
  }

  void update(){
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
  }
}