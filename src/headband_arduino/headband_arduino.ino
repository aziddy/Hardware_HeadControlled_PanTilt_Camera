#include <Servo.h>

Servo topServo;  // create servo object to control a servo
Servo botServo;
// twelve servo objects can be created on most boards

int pos = 0;    // variable to store the servo position

void setup() {
  Serial.begin(9600);
  topServo.attach(11);  // attaches the servo on pin 9 to the servo object
  botServo.attach(6);
   topServo.write(125);
   botServo.write(90);
}

char incoming = "";


// 100 is angle down
// 147 is angle up


void loop() {

  if (Serial.available() > 0) {
          // read the incoming byte:
          incoming = Serial.read();

            Serial.println(incoming);

            // Down    
            if(incoming == 'D'){
              topServo.write(100);
              delay(50);
            }

            // Up
            if(incoming == 'U'){
              topServo.write(147);
              delay(50);
            }

             // Right
            if(incoming == 'R'){
              botServo.write(115);
              delay(50);
            }

             // Left
            if(incoming == 'L'){
              botServo.write(75);
              delay(50);
            }
            


  }

}
