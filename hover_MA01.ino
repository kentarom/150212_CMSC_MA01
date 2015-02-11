#include <Wire.h>
#include <Hover.h>

// Pin declarations for Hover
int ts = 5;
int reset = 6;

Hover hover = Hover();
byte event;
String output_string = "";

void setup() {
  Serial.begin(9600);
  delay(4000);
  Serial.println("Initializing Hover...please wait.");
  hover.begin(ts, reset);        
}

void loop(void) {
  
  // Check if Hover is ready to send gesture or touch events
  if (hover.getStatus(ts) == 0) {
    
    //Get the event over i2c and print it
    event = hover.getEvent();
    
    
    //This section can be commented out if you don't want to see the event in text format
    output_string = hover.getEventString(event);
    if (output_string != ""){
      Serial.println(event,BIN);
//      Serial.println(" = " + output_string);
    }

    
    
    //Reset Hover for next event
    hover.setRelease(ts);

  }
}
