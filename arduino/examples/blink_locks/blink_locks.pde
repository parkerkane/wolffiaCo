/*
  Blink
  Turns on an LED on for one second, then off for one second, repeatedly.
 
  This example code is in the public domain.
 */
 
#include <coroutine.h>
 
// Pin 13 has an LED connected on most Arduino boards.
// give it a name:
int led = 13;

#define onLock  LOCK_1
#define offLock LOCK_2

void blink() {
  CORO_Simple();

  static long time = 0;

  while(true) {
    time=millis();
    
    lockRelease(onLock);
    yieldUntil(millis() > time+1000);
    
    lockRelease(offLock);
    yieldUntil(millis() > time+2000);
  }
}

void blinkOn() {
  CORO_Simple();
  
  while(true) {
    lockWaitAndAcquire(onLock);

    digitalWrite(led, HIGH);
  }
}

void blinkOff() {
  CORO_Simple();
  
  while(true) {
    lockWaitAndAcquire(offLock);
    
    digitalWrite(led, LOW);
  }
}

// the setup routine runs once when you press reset:
void setup() {                
  // initialize the digital pin as an output.
  pinMode(led, OUTPUT);    
 
 lockAcquire(onLock); 
 lockAcquire(offLock); 
}

// the loop routine runs over and over again forever:
void loop() {  
  blink();
  blinkOn();
  blinkOff();
}
