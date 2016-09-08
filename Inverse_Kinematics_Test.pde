//Now with 100% more GIT!!

PVector upArmPos, midArmPos, lowArmPos, upArmPos1, midArmPos1, lowArmPos1;
PVector upArmVec, midArmVec, lowArmVec, upArmVec1, midArmVec1, lowArmVec1;

float legX = 150;
float legY = 100;
boolean legDir = false;
float millisOld, gTime, gSpeed = 4;

PVector halfPos, halfVec;
void setup(){
  size(500, 300, OPENGL);
  
  lowArmPos = new PVector(width*0.25, 0);
  midArmPos = new PVector(0, 0);
  upArmPos = new PVector(0, 0);
  halfPos = new PVector(0, 0);
  halfVec = new PVector(150, 0);
  
  lowArmPos1 = new PVector(width*0.75, 0);
  midArmPos1 = new PVector(0, 0);
  upArmPos1 = new PVector(0, 0);


}

void draw(){
 //move();
 legX = mouseX;
 legY = mouseY;
 IK();
 
 background(200);
 stroke(0);
 line(lowArmPos.x, lowArmPos.y, midArmPos.x, midArmPos.y);
 line(midArmPos.x, midArmPos.y, upArmPos.x, upArmPos.y);
 stroke(255, 0, 0);
 line(lowArmPos.x, lowArmPos.y, upArmPos.x, upArmPos.y);
 line(midArmPos.x, midArmPos.y, halfPos.x, halfPos.y);
 
 stroke(0);
 line(lowArmPos1.x, lowArmPos1.y, midArmPos1.x, midArmPos1.y);
 line(midArmPos1.x, midArmPos1.y, upArmPos1.x, upArmPos1.y);

 
 
 textSize(18);
 line(200, 150, 200-(lowArmPos.x - midArmPos.x), 150-(lowArmPos.y - midArmPos.y));
 float a = degrees(atan2(lowArmPos.y - midArmPos.y, lowArmPos.x - midArmPos.x));
 text(a, 5, 15);
 
 line(300, 150, 300-(midArmPos.x - upArmPos.x), 150-(midArmPos.y - upArmPos.y));
 float a2 = degrees(atan2(midArmPos.y - upArmPos.y, midArmPos.x - upArmPos.x));
 //a2 = (180 - a) + a2;
 text(a2, 5, 30);

 
}

void move(){
 if(legX < (width*0.25)-50){
   legDir = true;
 }
 if(legX > (width*0.25)+50){
   legDir = false;
 }
 
 if(legDir == true){
  legX++ ;
 }
 if(legDir == false){
  legX--;
 }
 //println(legX);
 //println(legY);
  
}

void IK(){
 upArmPos.set(legX, legY);
 
 halfPos = PVector.add(lowArmPos, upArmPos);
 halfPos.div(2);
 
 float d = halfPos.dist(upArmPos);
 float Length = sqrt(100*100 - d*d);
 
 float a = atan2(lowArmPos.y - upArmPos.y, lowArmPos.x - upArmPos.x);
 a = a+(PI/2);
  
 float offsetX =  Length*(cos(a));
 float offsetY =  Length*(sin(a));
 
 midArmPos.set(halfPos.x-offsetX, halfPos.y-offsetY);
 
 
 upArmPos1.set(width-legX, legY);
 
 halfPos = PVector.add(lowArmPos1, upArmPos1);
 halfPos.div(2);
 
 d = halfPos.dist(upArmPos1);
 Length = sqrt(100*100 - d*d);
 
 a = atan2(lowArmPos1.y - upArmPos1.y, lowArmPos1.x - upArmPos1.x);
 a = a+(PI/2);
  
 offsetX =  Length*(cos(a));
 offsetY =  Length*(sin(a));
 
 midArmPos1.set(halfPos.x-offsetX, halfPos.y-offsetY);
 
 
 //test hahahahaah
}