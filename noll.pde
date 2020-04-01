//Variable declaration
float x1, x2, y1, y2;
int count, dir;

void setup(){
  //Window size and color initialization  
  size(1000,900);
  background(255);
  
  //Variable initialization
  dir = 1;
  count = 0;  
  x1 = width/2 + randomGaussian()*width/7;
  y1 = height;

}

void draw(){

  count++;
  
  if (count < 100){
    
    // x2 from a Gaussian distribution sampling
    x2 = width/2 + randomGaussian()*width/7;
    
    // Check if painting continious ascending or descending
    if(y2 < height/6) dir = 0;     
    if(y2 > 5*height/6) dir = 1;
    
    // y2 from quadratic function random sampling
    if (dir == 0){
        y2 = y1 + pow(random(0.7*height/sqrt(height)),2);
        if (y2 > height) y2 = height;
    } else{
        y2 = y1 - pow(random(0.7*height/sqrt(height)),2);
        if (y2 < 0) y2 = 0;
    }
    
    // Draw line
    line(x1, y1, x2, y2);
    strokeWeight(2);
    
    x1 = x2;
    y1 = y2;
    
  }else{
     print("Painting finished");
  }
  
  delay(10);
}
