/* https://en.wikipedia.org/wiki/Barnsley_fern 

Credit: Coding Challenge #108: Barnsley Fern by Daniel Shiffman 
https://www.youtube.com/watch?v=JFugGF1URNo
*/ 


void setup(){
size(500,500); 
}
var x = 0; 
var  y = 0; 

background(51);

var nextPoint = function(){
    var nextX; 
  var nextY; 
  
  var r = random(1); 
  
  if (r < 0.01) {
      // 1 
  nextX =0; 
  nextY = 0.16 * y;
  } else if (r < 0.86) {  //2 
   nextX = 0.85 * x +0.04 * y; 
   nextY = -0.04 * x +0.85 * y +1.6;}
   else if (r<0.93) {   //3 
  nextX = 0.2 * x +-0.26 * y; 
   nextY = 0.23 * x +0.22 * y +1.6;  }
   else {
  //4 
   nextX = -0.15 * x +0.28 * y; 
   nextY = 0.26 * x +0.24 * y +0.44; } 
  



  
  x = nextX; 
  y = nextY;
}; 

var drawPoint = function(){
colorMode(HSB, 255, 255, 255); 
  stroke(map(y, 0, 9.9983, 0, 255), 255, 255, 200); 
  strokeWeight(1); 
  var  px = map(x, -2.1820, 2.6558, 0 , width); 
  var py = map(y, 0, 9.9983, height, 0); 
  point(px, py); 
};  

 draw = function (){
 
for (var i = 0; i < 500; i ++) { 
 drawPoint(); 
 nextPoint(); 
  
}
}; 