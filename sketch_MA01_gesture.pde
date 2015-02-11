import processing.serial.*;

import ddf.minim.*;

Minim minim;
AudioSnippet song;


Serial myPort;

int test = 100100;
int imgNum = 0;
int imgNumD = 0;

PImage bg;
PImage[] wind;
PImage[] direc;



void setup(){

  size(1280, 480);


  println(Serial.list());
  int serialPortIndex = 5;
  myPort = new Serial(this, Serial.list()[serialPortIndex], 9600);
  background(0);
  println("initialized serial port on " + serialPortIndex);
    
  colorMode(RGB,255);
  smooth();
  frameRate(30);
  
  

  
  bg = loadImage("climate00.png");
  
  
  
  
  
  


wind = new PImage[7];
for (int i = 0; i <= 6; i++) {  
    wind[i] = loadImage("blor0" + i + ".png");   
}

direc = new PImage[3];
for (int i = 0; i <= 2; i++) {  
    direc[i] = loadImage("direc0" + i + ".png");   
}



    background(bg);

/////////sound

  minim = new Minim(this);
  song = minim.loadSnippet("pi.mp3");
  

    
}

void draw(){

}

void serialEvent (Serial myPort) {
  
  String inString = myPort.readStringUntil('\n');
  
  if (inString != null) {
    // trim off any whitespace:
    inString = trim(inString);




int inStringTest = int(inString);




if (inStringTest == 101000){//gesture UP
  imgNum++;
  if(imgNum >= 6){
  imgNum = 6;
  }

  image(wind[imgNum], 590, 85);
    song.rewind();
    song.play();
} else if(inStringTest == 110000){//gesture Down

  imgNum--;
  if(imgNum <= 0){
  imgNum = 0;
  }
  image(wind[imgNum], 590, 85);
      song.rewind();
    song.play();
} else if(inStringTest == 100010){//guresture right

  imgNumD++;
  if(imgNumD > 2){
  imgNumD = 0;
  }

  image(direc[imgNumD], 250, 100);
      song.rewind();
    song.play();
} else if(inStringTest == 100100){//gesture left

  imgNumD--;
  if(imgNumD < 0){
  imgNumD = 2;
  }

   image(direc[imgNumD], 250, 100);
    song.rewind();
    song.play();
} else if(inStringTest == 1000100){//tap north
  imgNum++;
  if(imgNum >= 6){
  imgNum = 6;
  }

  image(wind[imgNum], 590, 85);
  song.rewind();
  song.play();
} else if(inStringTest == 1000001){//tap south
  imgNum--;
  if(imgNum <= 0){
  imgNum = 0;
  }

  image(wind[imgNum], 590, 85);
  song.rewind();
  song.play();
} else if(inStringTest == 1001000){//tap east

  imgNumD++;
  if(imgNumD > 2){
  imgNumD = 0;
  }

  image(direc[imgNumD], 250, 100);
      song.rewind();
    song.play();
} else if(inStringTest == 1000010){//tap west

  imgNumD--;
  if(imgNumD < 0){
  imgNumD = 2;
  }

   image(direc[imgNumD], 250, 100);
    song.rewind();
    song.play();
} 



  }
  
}

void stop()
{
  song.close();
  minim.stop();
  super.stop();
}
