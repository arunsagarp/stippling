class Particle {
  PVector origin;
  PVector forces;
  PVector velocity;
  float mass;
  color neonColor;

  Particle(float x, float y) {
    this.origin = new PVector(x, y);
    this.mass = 1.0;
    this.velocity = new PVector(0, 0);
     int neon = int(random(5));
     
  if (neon == 0) { neonColor = color (0,250,0); //green
  } else if (neon == 1) { neonColor = color (32,178,170); //purple
  } else if (neon == 2) { neonColor = color (139,0,139); //yellow
  } else if (neon == 3) { neonColor = color (250,0,0); //red
  } else if (neon == 4) { neonColor = color (0,0,0); //blue
  }
    //r = int(random(256));
    //g = int(random(256));
    //b = int(random(256));
    //b = 10;
  }

  void plan(PVector force) {
    this.velocity.mult(0.9);
    force.div(this.mass);
    this.velocity.add(force);
  }

  void move() {
    this.origin.add(this.velocity);
    if (this.outOfBounds()) {
      return;
    }
    int x = floor(map(this.origin.x, 0, width, 0, img.width));
    int y = floor(map(this.origin.y, 0, height, 0, img.height));
    color c = img.pixels[y * img.width + x];
    float targetMass = CELL_SIZE * norm(red(c), 0, 255);
    if (targetMass > this.mass) {
      this.mass = min(this.mass * 1.1, targetMass);
    } 
    else {
      this.mass = max(this.mass * 0.9, targetMass);
    }
  }

  boolean outOfBounds() {
    if (this.origin.x < 0 || this.origin.x >= width) {
      return true;
    }
    if (this.origin.y < 0 || this.origin.y >= height) {
      return true;
    }
    
    return false;
  }

  void draw() {
    //noStroke();
    //fill(255);
    stroke(200);
    fill(255);
    float n = norm(this.mass, 0, CELL_SIZE);
    float r = CELL_SIZE * n * n ;
    ellipse(this.origin.x, this.origin.y, r, r);
   
    //triangle(this.origin.x+ r *-0.866 ,this.origin.y+ r*0.5,
    //          this.origin.x+ r *0.866 ,this.origin.y+ r*-0.5,
    //          this.origin.x+ r *0 ,this.origin.y+ r*1);
    
    //line(this.origin.x,this.origin.y-r/2,this.origin.x,this.origin.y+r);
    //line(this.origin.x-r/2,this.origin.y,this.origin.x+r,this.origin.y);
    }
}
