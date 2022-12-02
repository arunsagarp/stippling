float CELL_SIZE = 5;
float radius =1;
boolean DEBUG = false;
PImage img;
ParticleSystem particles;
boolean RECORD = false;
int counter=0;
float  x_point;
float y_point; 
final int SECONDS_TO_CAPTURE = 30;
final int VIDEO_FRAME_RATE = 60;
boolean recordVideo = false;
int videoFramesCaptured = 0;
float total;
void setup() {
  size(644,928);
  img = loadImage("data/bhadri.jpeg");
  println(img.width, img.height);
  particles = new ParticleSystem(this, img);
  x_point = this.width * 0.5 ;
  radius = this.height * 0.5;
  y_point = this.height * 0.5;
  //for(int i=0;i<4000;i++){
  //for(int j=0;j<3;j++){
  //  particles.add(x_point + random(-2.0, 2.0), y_point + random(-2.0, 2.0));
  //  particles.add(x_point + random(-2.0, 2.0), y_point + random(-2.0, 2.0));
  //  particles.add(x_point + random(-2.0, 2.0), y_point + random(-2.0, 2.0));
  //  particles.add(x_point + random(-2.0, 2.0), y_point + random(-2.0, 2.0));
  //  particles.add(x_point + random(-2.0, 2.0), y_point + random(-2.0, 2.0));
  //  particles.add(x_point + random(-2.0, 2.0), y_point + random(-2.0, 2.0));
  //  particles.add(x_point + random(-2.0, 2.0), y_point + random(-2.0, 2.0));
  //  if(i%1000==0)
  //  print(i);
  //  particles.plan();  
  //  particles.move();
  
  //}
    int tmtotal = int(((22/7)*radius)/(2*CELL_SIZE));
    total = map(tmtotal,0,tmtotal,0,50);
}

void draw() {
  if (counter <2500){
    
    
    
    
    if( total!=0)
    {
    float angle = radians((360/total));
    
    for(int i=1;i<=total;i+=2){
      particles.add(x_point + radius * cos(angle*i), y_point + radius * sin(angle*i));
    }

    if (radius <= 0)
      radius =0;
     else
     radius -=0.5;
     total -= 0.035;
     //print(total, "total");
    
    //particles.add(x_point + random(-2.0, 2.0), y_point + random(-2.0, 2.0));
    //particles.add(x_point + random(-2.0, 2.0), y_point + random(-2.0, 2.0));
    //particles.add(x_point + random(-2.0, 2.0), y_point + random(-2.0, 2.0));
    //particles.add(x_point + random(-2.0, 2.0), y_point + random(-2.0, 2.0));
    //particles.add(x_point + random(-2.0, 2.0), y_point + random(-2.0, 2.0));
    //particles.add(x_point + random(-2.0, 2.0), y_point + random(-2.0, 2.0));

  if(counter%1000==0)
    print(counter);
    }
  } 
  //x_point = float(mouseX);
  //y_point = float(mouseY);
  background(0,0,0,0); 
  particles.plan();  
  particles.move();
  particles.draw();
  
   if (recordVideo){
        saveFrame("output/export-####.png");
        if (videoFramesCaptured > VIDEO_FRAME_RATE * SECONDS_TO_CAPTURE){
            recordVideo = false;
            videoFramesCaptured = 0;
        }else{
            videoFramesCaptured++;
        }

        pushStyle();
        noFill();
        strokeWeight(2);
        stroke(255,0,0);
        rect(0, 0, width, height);
        popStyle();
    }

  
  
  
  if(RECORD){
  if (frameCount % 8 == 0) {
      int n_frames = frameCount / 8;
      if (n_frames > 10000) {
        return;
      }
      String fname = "output/"+counter + ".png";
      save(fname);
    }
  }
    counter++;
}
void mouseClicked() {
  for(int i=0;i<10;i++){
  particles.add(x_point + random(-2.0, 2.0), y_point + random(-2.0, 2.0));
  particles.add(x_point + random(-2.0, 2.0), y_point + random(-2.0, 2.0));
  particles.plan();  
  particles.move();
  particles.draw();
  }
  
 }
 void keyPressed(){
 if(key=='s')
 {
   String fname = "output/"+nf((frameCount), 3) + ".png";
   save(fname);
 }
 }
 //ffmpeg -r 60 -i "export-%04d.png" -c:v libx264 -r 30  -pix_fmt yuv420p test.mp4
