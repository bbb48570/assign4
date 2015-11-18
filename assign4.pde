//You should implement your assign2 here.
final int Game_Start=0;
final int Game_Play=1;
final int Game_GG=2;

final int EA=3,EB=4,EC=5,ED=6;

int flame=5;
int flameX;

int[] X=new int [5];
int[] Y=new int [5];
int[] Z=new int [5];


int shipX=610;
int shipY=220;
int treasureX;
int treasureY;

int Game_State;

boolean Up=false;
boolean Down=false;
boolean Left=false;
boolean Right=false;

PImage [] flam = new PImage [flame];
PImage fighter;
PImage backgroungImg;
PImage backgroungImg1;
PImage enemy;
PImage hp;
PImage treasure;
PImage shoot;
PImage start1;
PImage start2;
PImage end1;
PImage end2;
int shootX;
int x;
int y;
int hpp;
int z; //treasure x
int x1;
int x2;

int fighterX;
int fighterY;
float fighterwidth;

float speed=5;
// new.


void setup () {
  for(int c=0;c<5;c++)
  {
  flam[c]= loadImage("img/flame"+(c+1)+".png");
  }
  
  Game_State=Game_Start;
  hpp=97;
  x=1;
  y=floor(random(20,430));
  z=floor(random(20,400));
  size(640,480) ;  // must use this size.
  
  x1=1;
  x2=-639;
  
    
  X[0]=0;
  Y[0]=floor(random(100,200));
  
  treasureY=floor(random(20,450));
  treasureX=floor(random(20,400));  

  
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");
  
  backgroungImg=loadImage("img/bg1.png");
  backgroungImg1=loadImage("img/bg2.png");
  fighter=loadImage("img/fighter.png");
  enemy=loadImage("img/enemy.png");
  hp=loadImage("img/hp.png");
  treasure=loadImage("img/treasure.png");
  // your code
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");
  
  fighterX=550;
  fighterY=240;
  fighterwidth=61;
  
  shoot=loadImage("img/shoot.png");
  
  frameRate(24);
}

void draw() { 
  shootX=fighterX;
   switch(Game_State){
    
    case Game_Start:
    image(start2,0,0);  
     if(mouseX>200&&mouseX<460&&mouseY>375&&mouseY<420){
      
     if (mousePressed){
     Game_State=EA;
     }else{  
     noStroke();
     image(start1,0,0);}      
     }
     break;
  
  
    case EA:
    
        
        
    if(treasureX+40>=fighterX&&fighterX+40>=treasureX){
    if(treasureY+40>=fighterY&&fighterY+40>=treasureY){
    treasureX=floor(random(20,620));
    treasureY=floor(random(20,200));
    {
    if(hpp>=255){hpp=255;}else{
    hpp=hpp+20;}
    treasureY=floor(random(20,450));
    treasureX=floor(random(20,400));  
    image(treasure,treasureX,treasureY);
    }
    }
  }
    image(backgroungImg,x2=x2+1,0);    
    image(backgroungImg1,x1=x1+1,0);        
    image(treasure,treasureX,treasureY);    
    rectMode(CORNERS);    
    fill(255,0,0);
    rect(57,20,hpp,50);    
    image(hp,50,20);    
    image(fighter,fighterX,fighterY);   
    for(int i=0;i<5;i++){
    image(enemy,X[i],Y[i]);
    X[0]++;
    X[i]=X[0]-80*i;
    Y[i]=Y[0];
          
    if(X[4]>=640){
       X[0]=0;
       Y[0]=floor(random(0,60));
     if (((X[i]+enemy.width>=fighterX) && (X[i]+enemy.width<=(fighterX+fighter.width))) || ((X[i]>=fighterX) && (X[i]<=(fighterX+fighter.width))))
    if (((Y[i]+enemy.height>=fighterY) && (Y[0]+enemy.height<=(fighterY+fighter.height))) || ((Y[0]>=fighterY) && (Y[0]<=(fighterY+fighter.height))
    ||((Y[i]+10>=fighterY)&&(Y[i]+enemy.height-10<=fighterY+fighter.height))
    ))
    {
    int c = (flameX++)%flame;
    image(flam[c],X[i],Y[i]);
    }
    Game_State=EB;
     }
    }
 

 
 
 
 
 
    break;
    
    case EB:
    image(backgroungImg,x2=x2+1,0);    
    image(backgroungImg1,x1=x1+1,0);         
    image(treasure,treasureX,treasureY);    
    rectMode(CORNERS);    
    fill(255,0,0);
    rect(57,20,hpp,50);    
    image(hp,50,20);    
    image(fighter,fighterX,fighterY);
    if(treasureX+40>=fighterX&&fighterX+40>=treasureX){
    if(treasureY+40>=fighterY&&fighterY+40>=treasureY){
    treasureX=floor(random(20,620));
    treasureY=floor(random(20,200));
    {
    if(hpp>=255){hpp=255;}else{
    hpp=hpp+20;}
    treasureY=floor(random(20,450));
    treasureX=floor(random(20,400));  
    image(treasure,treasureX,treasureY);
    }
    }
  }

    for(int i=0;i<5;i++){
    image(enemy,X[i],Y[i]);
    X[0]++;
    X[i]=X[0]-50*i;
    Y[i]=Y[0]+50*i;
     }
     
    if(X[4]>=640){
      X[0]=-120;
      Y[0]=floor(random(150,320));
     Game_State=EC;
   }
     
    break;
    
    case EC:
    image(backgroungImg,x2=x2+1,0);    
    image(backgroungImg1,x1=x1+1,0);         
    image(treasure,treasureX,treasureY);    
    rectMode(CORNERS);    
    fill(255,0,0);
    rect(57,20,hpp,50);    
    image(hp,50,20);    
    image(fighter,fighterX,fighterY);
    if(treasureX+40>=fighterX&&fighterX+40>=treasureX){
    if(treasureY+40>=fighterY&&fighterY+40>=treasureY){
    treasureX=floor(random(20,620));
    treasureY=floor(random(20,200));
    {
    if(hpp>=255){hpp=255;}else{
    hpp=hpp+20;}
    treasureY=floor(random(20,450));
    treasureX=floor(random(20,400));  
    image(treasure,treasureX,treasureY);
    }
    }
  }
  
for (int i = 0; i < 5; i++) {
      image(enemy,X[i],Y[i]);
      X[0]++;
      X[i]=X[0]-50*i;
      Y[4]=Y[0];
      Y[1]=Y[0]+50;
      Y[2]=Y[0]+100;
      Y[3]=Y[0]+50;
  }
      for (int i = 0; i < 5; i++) {
      image(enemy,X[i],Z[i]);
      Z[0]=Y[0];
      Z[4]=Z[0];
      Z[1]=Z[0]-50;
      Z[2]=Z[0]-100;
      Z[3]=Z[0]-50;

      }
    
      if(X[4]>=640){
        X[0]=0;
        Y[0]=floor(random(100,400));
        Game_State=EA;
      }
    break;
    case Game_GG:
    
    image(end2,0,0);  
    
     if(mouseX>200&&mouseX<445&&mouseY>310&&mouseY<345){
          
     if (mousePressed){
     Game_State=EA;   
     
     hpp=97;
     
     fighterX=550;
     fighterY=240;
     
     }else{  
     noStroke();
     image(end1,0,0);}      
     }
      break; 
     }
      if(hpp<=57){
    Game_State=Game_GG;
    }
    
  if (Up){
      fighterY-=speed;
      if (fighterY<=0){
      fighterY=0;}
    }
    if (Down){
      fighterY+=speed;
      if (fighterY>=430){
      fighterY=430;}
    }
    if (Left){
      fighterX-=speed;
      if (fighterX<=0){
      fighterX=0;}
    }
    if (Right){
      fighterX+=speed;
      if (fighterX>=590){
      fighterX=590;}
    }
    x%=1280;    
    if(x2==639){
       x2=-639;
    }
    
    if(x1==639){
    x1=-639;
    }
      
    }
      

  
  // your code

   void keyPressed(){
     
     
  if(key== CODED){
    switch (keyCode){
    case UP:
      Up=true;
      break;
    case DOWN:
      Down=true;
      break;
    case LEFT:
      Left=true;
      break;
    case RIGHT:
      Right=true;
      break;
    case ' ':
    break;
    
    }
  }
}

void keyReleased(){
  
  if(key==CODED){
    switch (keyCode){
    case UP:
      Up=false;
      break;
    case DOWN:
      Down=false;
      break;
    case LEFT:
      Left=false;
      break;
    case RIGHT:
      Right=false;
      break;
      
    
    }
  }
}
