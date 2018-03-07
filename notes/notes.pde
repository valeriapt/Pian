import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import processing.serial.*;
import ddf.minim.*;

Minim minim;
AudioPlayer dor;
AudioPlayer re;
AudioPlayer[] player=new AudioPlayer[13];
AudioInput input;

int lf = 10;    // numarul de caractere maxim de citit de pe o linie
String myString = null;
Serial myPort;  // portul
int sensorValue = 0;

void setup() {
  /*
  // afisez toate porturile valabile

  printArray(Serial.list());
  */
  // ma conectez la portul de pe arduino ( COM/5)
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.clear();
 
  // citesc o linie din portul de la arduino (serial 9600)
  myString = myPort.readStringUntil(lf);
  myString = null;
  
  // cu minim preiau notele ( sunete mp3) 
  minim = new Minim(this);
  
 // dor = minim.loadFile("do.wav");
 // re = minim.loadFile("re.wav");
  player[1] = minim.loadFile("do.wav");
  player[2] = minim.loadFile("re.wav");
  player[3] = minim.loadFile("mi.wav");
  player[4] = minim.loadFile("fa.wav");
  player[5] = minim.loadFile("sol.wav");
  player[6] = minim.loadFile("la.wav");
  player[7] = minim.loadFile("si.wav");
  
  player[8] = minim.loadFile("doSus.wav");
  player[9] = minim.loadFile("reSus.wav");
  player[10] = minim.loadFile("faSus.wav");
  player[11] = minim.loadFile("solSus.wav");
  player[12] = minim.loadFile("laSus.wav");

  
}

void draw() {
  // cat timp am portul la care m-am conectat
  while (myPort.available() > 0) {
    // citesc o linie din portul de la arduino (serial 9600)
    myString = myPort.readStringUntil(lf);
    // verific daca e scris ceva
    if (myString != null) {
      myString = myString.trim(); // sterg spatiile 
      // verific daca am caractere
      if(myString.length() > 0) {
        println(myString); // afisez nota
        
        // dau play la nota corespunzatoare din myString
        if(myString.equals("do")){
          if(player[1].isPlaying() == false){
            player[1].play();
          }       
        }
         if(myString.equals("re")){
          if(player[2].isPlaying() == false){
            player[2].play();
          }  
        }       
        if(myString.equals("mi")){
          if(player[3].isPlaying() == false){
            player[3].play();
          }  
        }      
        if(myString.equals("fa")){
          if(player[4].isPlaying() == false){
            player[4].play();
          }  
        }       
        if(myString.equals("sol")){
          if(player[5].isPlaying() == false){
            player[5].play();
          }  
        }
        if(myString.equals("la")){
          if(player[6].isPlaying() == false){
            player[6].play();
          }  
        }
        if(myString.equals("si")){
          if(player[7].isPlaying() == false){
            player[7].play();
          }  
        }
        if(myString.equals("doSus")){
          if(player[8].isPlaying() == false){
            player[8].play();
          }  
        }
        if(myString.equals("reSus")){
          if(player[9].isPlaying() == false){
            player[9].play();
          }  
        }
        if(myString.equals("faSus")){
          if(player[10].isPlaying() == false){
            player[10].play();
          }  
        }
        if(myString.equals("solSus")){
          if(player[11].isPlaying() == false){
            player[11].play();
          }  
        }
        if(myString.equals("laSus")){
          if(player[12].isPlaying() == false){
            player[12].play();
          }  
        }         
      }
    }
    // pentru a se repeta o nota ( fara ar fi functionat numai la prima apasare pe clapa respectiva la pian)
    for(int i = 1 ; i <= 12; i++ )
       player[i].rewind();  
  }
}