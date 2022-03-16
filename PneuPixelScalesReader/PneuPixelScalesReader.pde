import processing.serial.*;
import java.sql.Timestamp;
import java.util.Random;
import java.util.Scanner;

final int READING_DELAY = 100;
final int RECORDING_TIME = 15000;
final int PRESSURE_LVL = 1;
final String POINT_REF = "3c";


int counter = RECORDING_TIME;
Serial kernScalesConnection;
Session m_Session;

float inByte;
int scaleInValue;
boolean newData;

void setup(){
  size(800, 600);
  printArray(Serial.list());
  kernScalesConnection = new Serial(this, Serial.list()[2], 9600);
  kernScalesConnection.bufferUntil('\n');
  setUpSession();
}

void draw(){
  // while the end value is greater than the incrace the servo_value and save lines to the csv  
  while (counter >= 0){
    System.out.println(counter);
    m_Session.addToCSV(scaleInValue);
    m_Session.plusCurrentValue();
    counter--;
  }
  System.out.println("Done!");
  exit();
}

void serialEvent (Serial kernScalesConnection) {
  String inString = kernScalesConnection.readStringUntil('\n');
  if (inString != null) {
    inString = trim(inString);
    inString = inString.replaceAll("[^0-9]", "");
    scaleInValue = Integer.parseInt(inString);
  }
}

void setUpSession(){
  String m_pNum = getString("Trial Number?");
  m_Session = new Session(m_pNum, RECORDING_TIME, READING_DELAY, POINT_REF, PRESSURE_LVL);
  System.out.println("Go!");
}
