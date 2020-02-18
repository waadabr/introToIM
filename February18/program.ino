
#include <LiquidCrystal.h> //the liquid crystal library contains commands for printing to the display
LiquidCrystal lcd(13, 12, 11, 10, 9, 8); // tell the RedBoard what pins are connected to the display
int pushButton = 6;
int sensor = A3;

void setup() {
  // put your se6tup code here, to run once:
  pinMode(7, OUTPUT);
  pinMode(pushButton, INPUT);
  pinMode(sensor, INPUT);

  lcd.begin(16, 2);                 //tell the lcd library that we are using a display that is 16 characters wide and 2 characters high
  lcd.clear();                     //clear the display
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  int buttonState = digitalRead(pushButton);
  int sensorValue = analogRead(sensor);

  int mappedValue = map(sensorValue, 140, 585, 0, 255); //map the values recieved from the sensor to the values that can be read on the LED
  mappedValue = constrain(mappedValue, 0, 255); //constrain the values so the LED can function

  // print out the value you read:
  Serial.println("raw value= ");
  Serial.println(sensorValue);
  Serial.println("mapped value = ");
  Serial.println(mappedValue);

  analogWrite(A4, mappedValue);
  if (mappedValue != 0){ 
    lcd.print("OUCH!"); //if pressure is sensed on the sensor that display OUCH on the LCD display
  }
  else{
    lcd.clear(); //otherwise clear the screen
  }
  
  if (buttonState == 1) {
    lcd.setCursor(0, 0); //set the cursor to the 0,0 position (top left corner)
    digitalWrite(7, HIGH); //this is the morse code for 'H'
    delay(500);
    digitalWrite(7, LOW);
    delay(500);
    digitalWrite(7, HIGH);
    delay(500);
    digitalWrite(7, LOW);
    delay(500);
    digitalWrite(7, HIGH);
    delay(500);
    digitalWrite(7, LOW);
    delay(500);
    digitalWrite(7, HIGH);
    delay(500);
    digitalWrite(7, LOW);
    lcd.print("H"); //print corresponding letter after LED morse code on the LCD display
    delay(1500); //transition pause to next letter
    digitalWrite(7, HIGH); //this is the morse code for 'E'
    delay(500);
    digitalWrite(7, LOW);
    lcd.print("E"); //print corresponding letter after LED morse code on the LCD display
    delay(1500); //transition pause to next letter
    digitalWrite(7, HIGH); //this is the morse code for 'L'
    delay(500);
    digitalWrite(7, LOW);
    delay(500);
    digitalWrite(7, HIGH);
    delay(1000);
    digitalWrite(7, LOW);
    delay(500);
    digitalWrite(7, HIGH);
    delay(500);
    digitalWrite(7, LOW);
    delay(500);
    digitalWrite(7, HIGH);
    delay(500);
    digitalWrite(7, LOW);
    lcd.print("L"); //print corresponding letter after LED morse code on the LCD display
    delay(1500); //transition pause to next letter
    digitalWrite(7, HIGH); //this is the morse code for 'L'
    delay(500);
    digitalWrite(7, LOW);
    delay(500);
    digitalWrite(7, HIGH);
    delay(1000);
    digitalWrite(7, LOW);
    delay(500);
    digitalWrite(7, HIGH);
    delay(500);
    digitalWrite(7, LOW);
    delay(500);
    digitalWrite(7, HIGH);
    delay(500);
    digitalWrite(7, LOW);
    lcd.print("L"); //print corresponding letter after LED morse code on the LCD display
    delay(1500); //transition pause to next letter
    digitalWrite(7, HIGH); //this is the morse code for 'O'
    delay(1000);
    digitalWrite(7, LOW);
    delay(500);
    digitalWrite(7, HIGH);
    delay(1000);
    digitalWrite(7, LOW);
    delay(500);
    digitalWrite(7, HIGH);
    delay(1000);
    digitalWrite(7, LOW);
    lcd.print("O"); //print corresponding letter after LED morse code on the LCD display
    delay(1500); //transition pause to next letter
    digitalWrite(7, HIGH); //this is the morse code for 'W'
    delay(500);
    digitalWrite(7, LOW);
    delay(500);
    digitalWrite(7, HIGH);
    delay(1000);
    digitalWrite(7, LOW);
    delay(500);
    digitalWrite(7, HIGH);
    delay(1000);
    digitalWrite(7, LOW);
    lcd.print(" ");
    lcd.print("W"); //print corresponding letter after LED morse code on the LCD display
    delay(1500); //transition pause to next letter
    digitalWrite(7, HIGH); //this is the morse code for 'O'
    delay(1000);
    digitalWrite(7, LOW);
    delay(500);
    digitalWrite(7, HIGH);
    delay(1000);
    digitalWrite(7, LOW);
    delay(500);
    digitalWrite(7, HIGH);
    delay(1000);
    digitalWrite(7, LOW);
    lcd.print("O"); //print corresponding letter after LED morse code on the LCD display
    delay(1500); //transition pause to next letter
    digitalWrite(7, HIGH); //this is the morse code for 'R'
    delay(500);
    digitalWrite(7, LOW);
    delay(500);
    digitalWrite(7, HIGH);
    delay(1000);
    digitalWrite(7, LOW);
    delay(500);
    digitalWrite(7, HIGH);
    delay(500);
    digitalWrite(7, LOW);
    lcd.print("R"); //print corresponding letter after LED morse code on the LCD display
    digitalWrite(7, HIGH); //this is the morse code for 'L'
    delay(500);
    digitalWrite(7, LOW);
    delay(500);
    digitalWrite(7, HIGH);
    delay(1000);
    digitalWrite(7, LOW);
    delay(500);
    digitalWrite(7, HIGH);
    delay(500);
    digitalWrite(7, LOW);
    delay(500);
    digitalWrite(7, HIGH);
    delay(500);
    digitalWrite(7, LOW);
    lcd.print("L"); //print corresponding letter after LED morse code on the LCD display
    delay(1500); //transition pause to next letter
    digitalWrite(7, HIGH); //this is the morse code for 'D'
    delay(1000);
    digitalWrite(7, LOW);
    delay(500);
    digitalWrite(7, HIGH);
    delay(500);
    digitalWrite(7, LOW);
    delay(500);
    digitalWrite(7, HIGH);
    delay(500);
    digitalWrite(7, LOW);
    lcd.print("D"); //print corresponding letter after LED morse code on the LCD display
    lcd.print("!"); //print ! on the LCD display 
    delay(2000);
    lcd.clear(); //clear screen so it can restart 
  }
}
