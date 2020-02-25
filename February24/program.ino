const int firstKeyPin = 10;
const int secondKeyPin = 11;
const int thirdKeyPin = 12;
const int fourthKeyPin = 13;

const int buzzerPin = 9;
#include <Servo.h>

Servo myservo;  // create servo object to control a servo


const int potpin = A5;  // analog pin used to connect the potentiometer
int val;    // variable to read the value from the analog pin
int pos = 0;    // variable to store the servo position


void setup() {
  //set the button pins as inputs
  pinMode(firstKeyPin, INPUT_PULLUP);
  pinMode(secondKeyPin, INPUT_PULLUP);
  pinMode(thirdKeyPin, INPUT_PULLUP);
  pinMode(fourthKeyPin, INPUT_PULLUP);

  //set the buzzer pin as an output
  pinMode(buzzerPin, OUTPUT);
  myservo.attach(7);  // attaches the servo on pin 9 to the servo object
}

void loop() {
  val = analogRead(potpin);            // reads the value of the potentiometer (value between 0 and 1023)
  val = map(val, 0, 1023, 0, 180);     // scale it to use it with the servo (value between 0 and 180)

  // Scene 1:
  for (int i = 0; i < 45; i += 1) {
    pos = 90 - i;              // servo from 90 to 45 degrees

    myservo.write(pos);
    delay(val / 30);                         // waits for the servo to get there
  }

  // Scene 2
  for (int i = 0; i < 60; i += 1) {
    pos = 45;                   // servo from 90 to 150 degrees
    myservo.write(pos);
    delay(val / 30);            // waits for the servo to get there
  }


  if (digitalRead(firstKeyPin) == LOW) {      //if the first key is pressed
    tone(buzzerPin, 262);                     //play the frequency for c
  }
  else if (digitalRead(secondKeyPin) == LOW) { //if the second key is pressed
    tone(buzzerPin, 330);                     //play the frequency for e
  }
  else if (digitalRead(thirdKeyPin) == LOW) { //if the third key is pressed
    tone(buzzerPin, 392);                     //play the frequency for g
  }
  else if (digitalRead(fourthKeyPin) == LOW) { //if the fourth key is pressed
    tone(buzzerPin, 494);                      //play the frequency for b
  }
  else {
    noTone(buzzerPin);                        //if no key is pressed turn the buzzer off
  }


}
