void setup(){
size(500,500); 
}

void draw(){
noFill(); 
// noStroke(); 
ellipse(200-(6*10), 200-(6*10), 200, 200); 
ellipse(200+(6*10), 200-(6*10), 200, 200); 
ellipse(200+(0*10), 200+(6*10), 200, 200);

fill(0, 0, 0);
text("Baby human", (200-(6*10))/2, (200-(-6*10))/2); 
text("Mentally disabled", (200+(31*10))/2, (200-(-6*10))/2);
text("adult human", (200+(33*10))/2, (200-(-8*10))/2);
text("IQ (not morally relevant) vs. Love (morally relevant)", (200+(16*10))/2, (200+(17*10))/2); 
text("Pig", (200+(19*10))/2, (200+(41*10))/2); 
}; 
