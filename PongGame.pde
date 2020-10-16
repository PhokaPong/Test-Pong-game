float xpos=350;
float pady;
float padh;
float padx;




GamePong Pong;
PongBall A;
 //PaddleBar B;
 PaddleBar C;
 void setup(){
  fill(255);
  size(700,700);
   padh = 150;
   pady =(height/2)-padh/2;
   padx =width-100;
   
   
  

  A = new PongBall(xpos,height/2,50);
  C = new PaddleBar(width-50,pady,50,padh,1);
  //B = new PaddleBar(0,pady,50,padh,0);
  Pong = new GamePong();
  
 
 }
 void draw(){
   Pong.draw();
   
   
 } 
class GamePong {
    int  playerS1 =0,playerS2 ; 
    GamePong(){
    }
    
   void draw(){
   background(0);
   stroke(5);
   
  rect(349,0,2,700);
  
   A.createBall();
   
   A.bounce();
   //B.createBar();
   C.createBar();
   winCheck();
   
   textSize(30);
   text(playerS1,310,30);
   text(playerS2,380,30);
   /*if (A.ballOut){
     if(A.playerside == 0){
       playerS2 ++;
     }
     if(A.playerside == 1){
       playerS1 ++;
       
     
     }
       //delay(1000);
      A = new PongBall(xpos,height/2,50);
   }*/
 }
   void winCheck(){
       if(playerS1 == 7 || playerS2 == 7 ){
           A = new PongBall(xpos,height/2,50);
        }
       if(playerS1 == 7 ){
           textSize(50);
           text("player 1 is winner",100,320);
       }
       if(playerS2 == 7 ){
           textSize(50);
           text("player 2 is winner",100,320);
       }
   
   }
 
   
   
 
 
  



}
class PongBall {
  
  float xpos, ypos, diameter,speedBx,speedBy;
  int playerside;
  //boolean ballOut = false;
  
  PongBall(float x, float y , float di){
    xpos = x;
    ypos = y;
    diameter = di;
    speedBx = random(0,6);
    speedBy = random(0,6);
    if(speedBx > 3){
      speedBx = 6;
    }
    else{
    speedBx = -6;
    }
    
    if(speedBy > 3){
      speedBy = 4;
    }
    else{
    speedBy = -4;
    }
    
    
  }
  
  void createBall(){
  ellipse(xpos,ypos,diameter,diameter);
  A.move();  
  }
  
  void move(){
    xpos += speedBx;
    ypos -= speedBy;
  }
  
  void bounce() {
    if(xpos > 0 && xpos  < width){
    /*if(xpos-(diameter/2) <= B.padx + (B.padw) 
      &&  ypos + (diameter/2) >= B.pady 
      && ypos- (diameter/2) <= B.pady + B.padh){
        speedBx = abs(speedBx);
        speedBy = abs(speedBx)*((B.pady+(B.padh/2)) - ypos)/150;
      }*/
      
    
    if(xpos+(diameter/2) >= C.padx
      &&  ypos + (diameter/2) >= C.pady 
      && ypos- (diameter/2) <= C.pady + C.padh){
        speedBx =0 - abs(speedBx);
        speedBy = abs(speedBx)*((C.pady+(C.padh/2)) - ypos)/150;
      }
      if (xpos - diameter/2 <= 0){
          speedBx = 0 -abs(speedBx);
          speedBy = 0 -abs(speedBx)*(C.pady+(C.padh/2)) - ypos/150;
      }
      
      
    
      if(ypos - diameter/2 <= 0){
          speedBy = 0 - abs(speedBy);  
        }
    
        if(ypos + diameter/2 >= height){
          speedBy = 0 + abs(speedBy);  
        }
    
  }
    else{
        if(xpos<width/2){
             playerside = 0;
             
        }
        else{
            playerside = 1;
        }
        //ballOut = true;
       
            
          
       
    }
    
  }
}
    

  
  


class PaddleBar {
  
  float playNo, padx, pady, padw, padh;
  
  PaddleBar(float X, float Y, float W, float H,float PlayNo){ 
    padx = X;
    pady = Y;
    padw = W;
    padh = H; 
    playNo = PlayNo;
  }
  
  void createBar(){
    rect(padx,pady,padw,padh) ;
    float targetY = mouseY-padh/2;
    /*if(playNo == 0){
    if(mouseX <= 200){
      float dy = targetY - pady;
      pady += dy * 0.25;}
  }*/
  if(playNo == 1){
    if(mouseX >= width - 200){
      float dy = targetY - pady;
      pady += dy * 0.25;}
  }

   }
  
   
   
}

 
 
