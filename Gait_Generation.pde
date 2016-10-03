float vel = 0.005;
float a, d;

PVector v0 = new PVector(0, 1, 0);
PVector v1 = new PVector(0, 1, 0);
PVector v2 = new PVector(0, 1, 0);
PVector v3 = new PVector(0, 1, 0);
PVector turnRadius = new PVector(1000, 500, 0);

PVector leg0 = new PVector(125, 250, 0);
PVector leg1 = new PVector(250, 750, 0);
PVector leg2 = new PVector(750, 250, 0);
PVector leg3 = new PVector(750, 750, 0);

PVector legOffset0 = new PVector(112.5, 112.5, 0);
PVector legOffset1 = new PVector(112.5, 450, 0);
PVector legOffset2 = new PVector(337.5, 112.5, 0);
PVector legOffset3 = new PVector(337.5, 450, 0);

void Gait(){
  leg0.sub(turnRadius);
  leg0.rotate(vel);
  leg0.add(turnRadius);
  
  if(leg0.x > width/2 || leg1.x < 0 ){
   leg0.set(legOffset0); 
   background(100);
  }
  else if(leg0.y < 0){
   leg0.set(legOffset0);
   background(100);  
  }
  ellipse(leg0.x, leg0.y, 10, 10);
  

  //a = atan2(turnRadius.y - leg1.y, turnRadius.x - leg1.x);
  leg1.sub(turnRadius);
  leg1.rotate(vel);
  leg1.add(turnRadius);
  
  if(leg1.x > width/2 || leg1.x < 0 ){
   leg1.set(legOffset1); 
   background(100);
  }
  else if(leg1.y < height/2){
   leg1.set(legOffset1);
   background(100);  
  }
  ellipse(leg1.x, leg1.y, 10, 10);
  
  //a = atan2(turnRadius.y - leg0.y, turnRadius.x - leg0.x);
  leg2.sub(turnRadius);
  leg2.rotate(vel);
  leg2.add(turnRadius);
  
  if(leg2.x < width/2 || leg2.x > width ){
   leg2.set(legOffset2); 
   background(100);
  }
  else if(leg2.y < 0){
   leg2.set(legOffset2);
   background(100);  
  }
  ellipse(leg2.x, leg2.y, 10, 10);
  

  //a = atan2(turnRadius.y - leg1.y, turnRadius.x - leg1.x);
  leg3.sub(turnRadius);
  leg3.rotate(vel);
  leg3.add(turnRadius);
  
  if(leg3.x < width/2 || leg3.x > width ){
   leg3.set(legOffset3); 
   background(100);
  }
  else if(leg3.y < height/2){
   leg3.set(legOffset3);
   background(100);  
  }
  ellipse(leg3.x, leg3.y, 10, 10);


  leg0TargetX = leg0.y;
  leg0TargetY = 100;
  leg0TargetZ = leg0.x;
 
  leg1TargetX = leg1.y;
  leg1TargetY = 100;
  leg1TargetZ = leg1.x;
}


void keyPressed(){
    if (key == CODED) {
    if (keyCode == UP) {
       turnRadius.add(10, 0, 0);
    } else if (keyCode == DOWN) {
       turnRadius.sub(10, 0, 0);
    } 
  }
}




/*
void Gait(){
leg0TargetX = mouseX;
leg0TargetY = mouseY;
 
leg1TargetX = mouseX;
leg1TargetY = mouseY;
 //println(legX);
 //println(legY);
}
*/