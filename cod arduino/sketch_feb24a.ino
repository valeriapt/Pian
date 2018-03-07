int doPin = 2;
int rePin = A5;
int miPin = A4;
int faPin = A3;
int solPin = A2;
int laPin = 9;
int siPin = A0;
int doSusPin = 7;
int reSusPin = 6;
int faSusPin = 5;
int solSusPin = 4;
int laSusPin = 3;
int siFirstRead;
int dor, re, mi, fa, sol, la, si, doSus, reSus, faSus, laSus, solSus;
int speaker = 8;
int typeOfNotes = A1;

// pentru difuzor
#define NOTE_DO 262
#define NOTE_RE 294
#define NOTE_MI 330
#define NOTE_FA 349
#define NOTE_SOL 392
#define NOTE_LA 440
#define NOTE_SI 493


void setup() {
  pinMode(speaker, OUTPUT);
  Serial.begin(9600);
  siFirstRead= analogRead(siPin); // senzorul pentru nota si nu are mereu valori exacte. ma folosesc de aceasta variabila pentru a imi putea da seama cand e apasat sau nu
  //Serial.println(siFirstRead);  
}

void loop() {
  int val = analogRead(typeOfNotes);
  dor = digitalRead(doPin);
  re = analogRead(rePin);
  mi = analogRead(miPin);
  fa = analogRead(faPin);
  sol = analogRead(solPin);
  la = digitalRead(laPin);
  si = analogRead(siPin);
  doSus = digitalRead(doSusPin);
  reSus = digitalRead(reSusPin);
  faSus = digitalRead(faSusPin);
  solSus = digitalRead(solSusPin);
  laSus= digitalRead(laSusPin);
 // Serial.println(re);  
  //   Serial.println(val);  
  if( val > 500) { // ma conectez la processing
    if(dor == 1) {
    Serial.println("do");   
    }
  if(re > 400) {
    Serial.println("re"); 
    }
  if(mi > 400) {
    Serial.println("mi");    
  }
  if(fa > 400) {
    Serial.println("fa");  
  }
  if(sol > 400) {
    Serial.println("sol");     
  }
  if(la == 1) {
    Serial.println("la");      
  }
  if(si > siFirstRead+100 ) {
    Serial.println("si");   
  }
  // senzorii nu functioneaza
  if(doSus ==1) {
    Serial.println("doSus");   
  }
  /*
  if(reSus ==1) {
    Serial.println("reSus");   
  }*/
  
  if(faSus == 1) {
    Serial.println("faSus"); 
  }
  if(solSus == 1) {
    Serial.println("solSus"); 
  }
  if(laSus == 1) {
    Serial.println("laSus");     
  }
  delay(200); 
  }
  else { // folosesc difuzoarele
    if(dor == 1) {    
      tone(speaker, NOTE_DO);
    }
    if(re > 400) { 
      tone(speaker, NOTE_RE);  
    }
    if(mi > 400) {   
      tone(speaker, NOTE_MI);  
    }
    if(fa > 400) {   
      tone(speaker, NOTE_FA); 
    }
    if(sol > 400) {      
      tone(speaker, NOTE_SOL);
    }
    if(la == 1) {   
      tone(speaker, NOTE_LA);
    }
    if(si > siFirstRead + 100 ) {      
      tone(speaker, NOTE_SI);
    }
     if(doSus == 1) {
    tone(speaker, NOTE_DO, 300);    
  }
  /*
  if(reSus == 1) {
    Serial.println("reSus");   
 }
  */
    if(faSus == 1) {
      tone(speaker, NOTE_FA, 300);  
    }
    if(solSus == 1) {   
      tone(speaker, NOTE_SOL, 300);  
    }
    if(laSus == 1) {
      tone(speaker, NOTE_LA, 300);  
    } 
    delay(200);   
    noTone(speaker); 
  }
}
