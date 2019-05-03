

import oscP5.*;
import netP5.*;
import processing.serial.*;

OscP5 oscP5;

Serial myPort;

//DISPLAY PARAMETERS
int WIDTH = 100;
int HEIGHT = 100;

void setup() {
  size(100, 100);
  frameRate(60);

  /* start oscP5, listening for incoming messages at 8000 */
  oscP5 = new OscP5(this, 7000);

  NetInfo.print();
  String portName = Serial.list()[1];
  printArray(Serial.list());
  myPort = new Serial(this, portName, 9600);
  thread("sendDATA");
  background(0);
}

void draw() {
  background(0);
}

double deadzoneCenterTiltLower = 0.00;
double deadzoneCenterTiltUpper = 0.30;


double deadzoneCenterRollLeft = -0.10;
double deadzoneCenterRollRight = 0.40;

char dataChar = '0';

void oscEvent(OscMessage msg) {
 
  if (msg.checkAddrPattern("Person0/acc")==true) { 
    println("ACC: ");
    print("1: ");
    println(msg.get(0).doubleValue());
    print("2: ");
    println(msg.get(1).doubleValue());
    print("3: ");
    println(msg.get(2).doubleValue());
    
    double tiltValue = msg.get(0).doubleValue();
    double rollValue = msg.get(1).doubleValue();    
    
    if(tiltValue < deadzoneCenterTiltLower){
        dataChar = 'U';
    }else if(deadzoneCenterTiltUpper < tiltValue){
        dataChar = 'D';
    }
   
   // Left Rigth
    if(rollValue < deadzoneCenterRollLeft){
        dataChar = 'L';
    }else if(deadzoneCenterRollRight < rollValue){
        dataChar = 'R';
    }
   
  }

}

void sendDATA() {
  while(true){
  //  if(dataChar.length() > 1)
        myPort.write(dataChar); 
        delay(50);
   // }
  }
}
