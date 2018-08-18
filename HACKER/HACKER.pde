float angulo = -PI/2;
PVector hacker = new PVector(350, 700);
boolean ataque = false;

PImage hackerman, background, virus;
PImage [] rack = new PImage[6];
int vivos[];

//CannonBall ball;
AtaqueHacker exploit;

void setup() {
  vivos = new int[6];
  size(700, 700);
  background = loadImage("CODE1.jpg");
  hackerman = loadImage("HACKER.png");
 for (int i=0;i<6;i++){
  rack[i] = loadImage("RACK.png");
  vivos[i] = 1;
 }
  exploit = new AtaqueHacker(hacker.x, hacker.y);
}

void draw() {
  println("X: "+mouseX, "Y: "+mouseY);
  image(background,0,0);
  pushMatrix();
  translate(hacker.x, hacker.y);
  rotate(angulo);
  rect(0, -5, 50, 10);
  image(hackerman,5, -20);
  //hackerman.resize(0,300);
  popMatrix();
  if (vivos[0]==1){
    image(rack[0],60,60);
  }
  if (vivos[1]==1){
    image(rack[1],240,60);
  }
  if (vivos[2]==1){
    image(rack[2],420,60);
  }
  if (vivos[3]==1){
    image(rack[3],150,160);
  }
  if (vivos[4]==1){
    image(rack[4],330,160);
  }
   if (vivos[5]==1){
    image(rack[5],240,260);
  }



  if (ataque == true) {
    PVector gravedad = new PVector(0, 0.2);
    exploit.aplicarFuerza(gravedad);
    exploit.update();
  }
  exploit.display();

  if (exploit.posicion.y > height) {
    exploit = new AtaqueHacker(hacker.x, hacker.y);  
    ataque = false;
  }
}

void keyPressed() {
  if (key == CODED && keyCode == RIGHT) {
    angulo += 0.1;
  } 
  else if (key == CODED && keyCode == LEFT) {
    angulo -= 0.1;
  } 
  else if (key == 'f') {
    ataque = true;
    PVector fuerza = PVector.fromAngle(angulo);
    fuerza.mult(10);
    exploit.aplicarFuerza(fuerza);
 
  }
}

class AtaqueHacker { 
  PVector posicion;
  PVector velocidad;
  PVector aceleracion;
 

  // Size
  float formaExploit = 8;
  
  float topspeed = 10;

  AtaqueHacker(float x, float y) {
    posicion = new PVector(x,y);
    velocidad = new PVector();
    aceleracion = new PVector();

   
  } 

  void update() { 
    velocidad.add(aceleracion);
    velocidad.limit(topspeed);
    posicion.add(velocidad);
    aceleracion.mult(0);
  }
  
  void aplicarFuerza(PVector fuerza) {
    aceleracion.add(fuerza);
  }
  void display() { 
    stroke(1);
    strokeWeight(1);
    pushMatrix();
    translate(posicion.x,posicion.y);
    ellipse(0,0,formaExploit*2,formaExploit*2);
    popMatrix();
    if(posicion.x>= 67 && posicion.x<= 235 && posicion.y>= 70 && posicion.y<= 160){
      vivos[0]=0;
    }
     if(posicion.x>= 248 && posicion.x<= 415 && posicion.y>= 70 && posicion.y<= 160){
      vivos[1]=0;
    }
    if(posicion.x>= 428 && posicion.x<= 595 && posicion.y>= 70 && posicion.y<= 160){
      vivos[2]=0;
    }
    if(posicion.x>= 160 && posicion.x<= 326 && posicion.y>= 170 && posicion.y<= 260){
      vivos[3]=0;
    }
    if(posicion.x>= 335 && posicion.x<= 505 && posicion.y>= 170 && posicion.y<= 260){
      vivos[4]=0;
    }
    if(posicion.x>= 250 && posicion.x<= 415 && posicion.y>= 270 && posicion.y<= 360){
      vivos[5]=0;
    }
  }
}

void destruirRack(){
  
}
