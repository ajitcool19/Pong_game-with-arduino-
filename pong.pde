
int score=0;
float x_ball=200;
float y_ball=100;
float vx=4;
float vy=4;
float pos=80;

import processing.serial.*;    // Importing the serial library to communicate with the Arduino 

Serial myPort;   

void setup()
{
 size(800,800);
 myPort  =  new Serial (this, "/dev/ttyACM0",  9600); // Set the com port and the baud rate according to the Arduino IDE

myPort.bufferUntil ( '\n' );   // Receiving the data from the Arduino IDE

} 
void serialEvent  (Serial myPort) {

pos  =  float (myPort.readStringUntil ( '\n' ) )*10 ;  // Changing the background color according to received data

} 


void draw()
{
 background(20,200,200);
 textSize(32);
 text(score, 10, 30); 
 stroke(0,150,200); 
 fill(255,0,200);

 ellipse(x_ball,y_ball,80,80);
 x_ball=x_ball+vx;
 y_ball=y_ball+vy;
 
 if (x_ball>=760)
 {
   vx=-vx;
 }
 if (y_ball>=760)
 {
   //vy=-vy;
   score=0;
   x_ball=200;
   y_ball=100;
   vy=-4;
 }
 if (x_ball<=40)
 {
   vx=-vx;
 }
 if (y_ball<=40)
 {
   vy=-vy;
 }
 stroke(0,150,200); 
 fill(225,130,100);
 float rx = constrain(pos,0,640);
 rect(rx,700,160,30,50);
 
 if(y_ball>=640)
  {
  if(y_ball<660)
  {
   if (rx>=x_ball-80)
   {
     if (rx<=x_ball+80)
     {
        vy=-vy*1.05;
        score=score+10;
     }
   }
   }

 }
 
 
}
