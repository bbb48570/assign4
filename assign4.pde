final int Game_Start=0;
final int Game_Play=1;
final int Game_GG=2;

int mode,s,ego=0,enemylose,shoothave=0,shootnum=0,f=5,bownX,bownY;
int [] enemyX=new int[8];
int [] enemyY=new int[8];
int [] shootX=new int[5];
int [] shootY=new int[5];
boolean[] enemyhave=new boolean[8];
boolean[] shootleave=new boolean[5];
PImage shoot;



final int EA=3,EB=4,EC=5,ED=6;

int flame=5;
int flameX;


PImage [] flam = new PImage [flame];

PImage background1Img;
PImage background2Img;
PImage background3Img;

PImage start1;
PImage start2;

PImage end1;
PImage end2;

PImage ship;
PImage hp;
PImage enemy;
PImage treasure;
float treasureX,treasureY,backgroundX,backgroundY,backgroundZ,hpX,hpY,hpp,fighterX,fighterY;

int Game_State;
boolean op=false;
boolean Up=false;
boolean Down=false;
boolean Left=false;
boolean Right=false;
int[] X=new int [5]; //X[0]~X[4] X[i]
int[] Y=new int [5];
int[] Z=new int [5];


void setup(){
  fighterX=width-50;
  fighterY=height/2;
  size(640,480);
  background1Img=loadImage("img/bg1.png");
  background2Img=loadImage("img/bg2.png");
  background3Img=loadImage("img/bg1.png");
  end1=loadImage("img/end2.png");
  end2=loadImage("img/end1.png");
  start1=loadImage("img/start2.png");
  start2=loadImage("img/start1.png");
  hp=loadImage("img/hp.png");
  enemy=loadImage("img/enemy.png");
  treasure=loadImage("img/treasure.png");
  ship=loadImage("img/fighter.png");
  treasureX=floor(random(20,620));
  treasureY=floor(random(20,200));
  backgroundX=0;
  fighterX=610;
  fighterY=220;
  hpX=20;
  hpY=20;
  hpp=59;
  X[0]=0;
  Y[0]=floor(random(100,200));
  
  for(int c=0;c<5;c++)
  {
  flam[c]= loadImage("img/flame"+(c+1)+".png");
  }
  
  Game_State=Game_Start;
  }

void draw(){
  
  
  
  switch(Game_State){
    case Game_Start:
    image(start1,0,0);  
     if(mouseX>200&&mouseX<460&&mouseY>375&&mouseY<420){
      
     if (mousePressed){
     Game_State=EA;
     }else{  
     noStroke();
     image(start2,0,0);}      
     }
     break;
   case EA:
  image(background1Img,backgroundX,0);
  image(background2Img,backgroundY,0);
  image(background3Img,backgroundZ,0);
  fill(220,0,0);
  rectMode(CORNERS);
  rect(30,20,hpp,40);
  image(hp,hpX,hpY);
  image(treasure,treasureX,treasureY);
  image(ship,fighterX-20,fighterY-20);
  if(treasureX+40>=fighterX&&fighterX+40>=treasureX){
    if(treasureY+40>=fighterY&&fighterY+40>=treasureY){
    treasureX=floor(random(20,620));
    treasureY=floor(random(20,200));
    hpp+=19.5;
    if(hpp>=230){hpp=230;}
    }
  }

     
   for(int i=0;i<5;i++){
 image(enemy,X[i],Y[i]);
   X[0]++;
   X[i]=X[0]-80*i;
   Y[i]=Y[0];   
   if(((X[i]+enemy.width>=fighterX) && (X[i]+enemy.width<=(fighterX+ship.width))) || ((X[i]>=fighterX) && (X[i]<=(fighterX+ship.width))))
    if (((Y[i]+enemy.height>=fighterY) && (Y[0]+enemy.height<=(fighterY+ship.height))) || ((Y[0]>=fighterY) && (Y[0]<=(fighterY+ship.height))
    ||((Y[i]+10>=fighterY)&&(Y[i]+enemy.height-10<=fighterY+ship.height))))
    {
    int c = (flameX++)%flame;
    image(flam[c],X[i],Y[i]);
    hpp-=39;
    X[i]=1000;
    Y[i]=1000;
    }
   }
     if(X[4]>=640){
       X[0]=0;
       Y[0]=floor(random(0,40));
   Game_State=EB;
 }
  break;
     case EB:
     image(background1Img,backgroundX,0);
  image(background2Img,backgroundY,0);
  image(background3Img,backgroundZ,0);
  fill(220,0,0);
  rectMode(CORNERS);
  rect(30,20,hpp,40);
  image(hp,hpX,hpY);
  image(treasure,treasureX,treasureY);
  image(ship,fighterX-20,fighterY-20);
  if(treasureX+40>=fighterX&&fighterX+40>=treasureX){
    if(treasureY+40>=fighterY&&fighterY+40>=treasureY){
    treasureX=floor(random(20,620));
    treasureY=floor(random(20,200));
    hpp+=19.5;
    if(hpp>=230){hpp=230;}
    }
  }
     for(int i=0;i<5;i++){
       image(enemy,X[i],Y[i]);
  X[0]++;
  X[i]=X[0]-60*i;
  Y[i]=Y[0]+60*i;
  if(((X[i]+enemy.width>=fighterX) && (X[i]+enemy.width<=(fighterX+ship.width))) || ((X[i]>=fighterX) && (X[i]<=(fighterX+ship.width))))
    if (((Y[i]+enemy.height>=fighterY) && (Y[0]+enemy.height<=(fighterY+ship.height))) || ((Y[0]>=fighterY) && (Y[0]<=(fighterY+ship.height))
    ||((Y[i]+10>=fighterY)&&(Y[i]+enemy.height-10<=fighterY+ship.height))))
    {
    int c = (flameX++)%flame;
    image(flam[c],X[i],Y[i]);
    hpp-=39;
    }
     }
     
    if(X[4]>=640){
      X[0]=-80;
      Y[0]=floor(random(150,330));
     Game_State=EC;}
    break;
    
    case EC:
  image(background1Img,backgroundX,0);
  image(background2Img,backgroundY,0);
  image(background3Img,backgroundZ,0);
  fill(220,0,0);
  rectMode(CORNERS);
  rect(30,20,hpp,40);
  image(hp,hpX,hpY);
  image(treasure,treasureX,treasureY);
  image(ship,fighterX-20,fighterY-20);
  if(treasureX+40>=fighterX&&fighterX+40>=treasureX){
    if(treasureY+40>=fighterY&&fighterY+40>=treasureY){
    treasureX=floor(random(20,620));
    treasureY=floor(random(20,200));
    hpp+=19.5;
    if(hpp>=230){hpp=230;}
    }
  }
  

for (int i = 0; i < 5; i++) {
      image(enemy,X[i],Y[i]);
      X[0]++;
      X[i]=X[0]-40*i;
      Y[4]=Y[0];
      Y[1]=Y[0]+40;
      Y[2]=Y[0]+80;
      Y[3]=Y[0]+40;
      
    if(((X[i]+enemy.width>=fighterX) && (X[i]+enemy.width<=(fighterX+ship.width))) || ((X[i]>=fighterX) && (X[i]<=(fighterX+ship.width))))
    if (((Y[i]+enemy.height>=fighterY) && (Y[0]+enemy.height<=(fighterY+ship.height))) || ((Y[0]>=fighterY) && (Y[0]<=(fighterY+ship.height))
    ||((Y[i]+10>=fighterY)&&(Y[i]+enemy.height-10<=fighterY+ship.height))))
    {
    int c = (flameX++)%flame;
    image(flam[c],X[i],Y[i]);
    hpp-=39;
    }
      
}
      for (int i = 0; i < 5; i++) {
      image(enemy,X[i],Z[i]);
      Z[0]=Y[0];
      Z[4]=Z[0];
      Z[1]=Z[0]-40;
      Z[2]=Z[0]-80;
      Z[3]=Z[0]-40;
      
      
      if(((X[i]+enemy.width>=fighterX) && (X[i]+enemy.width<=(fighterX+ship.width))) || ((X[i]>=fighterX) && (X[i]<=(fighterX+ship.width))))
    if (((Z[i]+enemy.height>=fighterY) && (Z[0]+enemy.height<=(fighterY+ship.height))) || ((Z[0]>=fighterY) && (Z[0]<=(fighterY+ship.height))
    ||((Z[i]+10>=fighterY)&&(Z[i]+enemy.height-10<=fighterY+ship.height))))
    {
    int c = (flameX++)%flame;
    image(flam[c],X[i],Y[i]);
    }

    }
    
      if(X[4]>=640){
      X[0]=0;
      Y[0]=floor(random(0,400));
      Game_State=EA;
           }
   
   
  break;
  
  case Game_GG:
    
    image(end1,0,0);  
    
     if(mouseX>200&&mouseX<445&&mouseY>310&&mouseY<345){
          
     if (mousePressed){
     Game_State=EA;   
     
     hpp=97;
     
     fighterX=550;
     fighterY=240;
     
     }else{  
     noStroke();
     image(end2,0,0);}      
     }
      break; 
  
  }
   if(hpp<=57){
    Game_State=Game_GG;
    }
 
  backgroundX++;
  backgroundY=backgroundX-640;
  backgroundZ=backgroundY-640;
  backgroundX=backgroundX%1280;
  
 if(Up){
   fighterY-=5;
   if (fighterY<=0)
   {
    fighterY=0;
  }
 }
 
 if(Down){
   fighterY+=5;

      if (fighterY>=430){
      fighterY=430;}
    }
 if(Right){
   fighterX+=5;
   if (fighterX>=590){
      fighterX=590;}
 }
 if(Left){
   fighterX-=5;
   if (fighterX<=0){
      fighterX=0;}
 }
   for(int e=0;e<5;e++){ 
    if(shootleave[e]){
    image(shoot,shootX[e],shootY[e]);
    if(shootX[e]>=-31)
    shootX[e]-=3;
    else{
    shootleave[e]=false;
    shoothave--;
    }
     }
     }
     for(int p=0;p<5;p++){
       for(int r=0;r<8;r++){
       if(shootleave[p]==true){
       if(enemyhave[r]==true){
       if(enemyX[r]+61>=shootX[p])
       if(enemyX[r]+61>=shootX[p]&&(((shootY[p]>enemyY[r])&&(shootY[p]<enemyY[r]+61))||((shootY[p]+27>enemyY[r]) && (shootY[p]+27<enemyY[r]+61)))){
     enemyhave[r]=false;
     f=0;
     bownX=enemyX[r];
     bownY=enemyY[r];
      shootleave[p]=false;
    shoothave--;
     }
   }
 }
     
     }
     }
     
      for(int open=0;open<5;open++){
    shootleave[open]=false;
     enemyhave[open]=true;
   }
     
     
}
 

 void keyPressed(){

   switch (keyCode){
   case UP:
       Up=true;
       break;
   case DOWN:
       Down=true;
       break;
   case RIGHT:
       Right=true;
       break;
   case LEFT:
       Left=true;
       break;
       
   }
  }


void keyReleased(){
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
      case ' ':
      op=false;
      break;
   
   }
  }
