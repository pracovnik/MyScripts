#include<ESP8266WiFi.h>
#include <Servo.h>
#include <ESP8266WebServer.h>


const char* ssid = "wifi";
const char* password = "password";


// Create an instance of the server
// specify the port to listen on as an argument
IPAddress local_IP(1, 1, 1, 1);
IPAddress gateway(1, 1, 1, 1);
IPAddress subnet(1, 1,1, 1);

ESP8266WebServer server(80);
Servo myservo;
int speedx = 30; //zero good
int duration = 5; //sec 
int servopin=2; //D4

void setup() {
  // initialize the serial port
  //Serial.begin(115200);
  // Connect to WiFi network
  WiFi.config(local_IP,gateway,subnet);
  WiFi.begin(ssid, password);
  
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
  }

  server.on("/", handle_OnConnect);
  server.on("/half", handle_half);
  server.on("/normal", handle_normal);
  server.on("/double", handle_double);

  // Start the server
  server.begin();
  //Serial.println("HTTP server started");
}

void loop() {
  server.handleClient();
}

void handle_OnConnect() {
  server.send(200, "text/html", SendHTML()); 
}

void handle_half() {
 //Serial.println("move");
 myservo.attach(servopin);
 myservo.write(speedx);
 delay(duration*500);
 myservo.detach();
 //Serial.println("notmove");
 server.send(200, "text/html", SendHTML()); 
}

void handle_normal() {
 //Serial.println("move");
 myservo.attach(servopin);
 myservo.write(speedx);
 delay(duration*1000);
 myservo.detach();
 //Serial.println("notmove");
 server.send(200, "text/html", SendHTML()); 
}

void handle_double() {
 //Serial.println("move");
 myservo.attach(servopin);
 myservo.write(speedx);
 delay(duration*1000*2);
 myservo.detach();
 //Serial.println("notmove");
 server.send(200, "text/html", SendHTML()); 
}

void handle_NotFound(){
  server.send(404, "text/plain", "Not found");
  //Serial.println("404 bad");
}

String SendHTML(){
  String ptr = "<!DOCTYPE html> <html>\n";
  ptr +="<head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=no\">\n";
  ptr +="<title>Portion for kitty</title>\n";
  ptr +="<style>html { font-family: Helvetica; display: inline-block; margin: 0px auto; text-align: center;}\n";
  ptr +="body{margin-top: 50px;} h1 {color: #444444;margin: 50px auto 30px;} h3 {color: #444444;margin-bottom: 50px;}\n";
  ptr +=".button {display: block;width: 80px;background-color: #1abc9c;border: none;color: white;padding: 13px 30px;text-decoration: none;font-size: 25px;margin: 0px auto 35px;cursor: pointer;border-radius: 4px;}\n";
  ptr +=".button-on {background-color: #1abc9c;}\n";
  ptr +=".button-on:active {background-color: #16a085;}\n";
  ptr +=".button-off {background-color: #34495e;}\n";
  ptr +=".button-off:active {background-color: #2c3e50;}\n";
  ptr +="p {font-size: 14px;color: #888;margin-bottom: 10px;}\n";
  ptr +="</style>\n";
  ptr +="</head>\n";
  ptr +="<body>\n";
  ptr +="<a class=\"button button-off\" href=\"/half\">&frac12; Portion</a>\n";
  ptr +="<a class=\"button button-off\" href=\"/normal\">1x Portion</a>\n";
  ptr +="<a class=\"button button-off\" href=\"/double\">2x Portion</a>\n";
  ptr +="</body>\n";
  ptr +="</html>\n";
  return ptr;
}
