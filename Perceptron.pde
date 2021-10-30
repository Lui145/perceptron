Punto[] puntos = new Punto[1000];
Neurona perceptron;

float m = 0.5, b = 0, tam;
int puntosErroneos, margenError = 5, it = 0;

void setup(){
  size(800,800);
  
  for(int i = 0; i<puntos.length; i++){
    puntos[i] = new Punto(random(0,width)-width/2, random(0, height)-height/2);
  }
  
  tam = width/2;
  perceptron = new Neurona(2, 0.05);
  
}

void draw(){
  it++;
  background(200);
  ejes();
  strokeWeight(1);
  puntosErroneos = 0;
  
  line(0,height/2-(height*m)/2, width, height/2+(height*m)/2);

  
  for(int i = 0; i<puntos.length; i++){
    Punto p = puntos[i];
    p.x = random(0,width)-width/2;
    p.y = random(0,height)-height/2;
    p.tipo = int(perceptron.clasificar(p.x/tam, p.y/tam));
    if(puntoErroneo(p))
      puntosErroneos++;
      
    p.pintar();
  }
  
  if(puntosErroneos<margenError){
    println("iteraciones: " + it + "\n" + 
            "puntos erroneos: " + puntosErroneos + "\n" +
            "tiempo: " + millis()/1000 + " segundos");
    noLoop();
  }
  
  float x = random(0,width)-width/2;
  float y = random(0,height)-height/2;
  perceptron.entrenamiento(x, y, y<m*x+b? 1 : -1);  
}

void ejes(){
  strokeWeight(2);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
}

boolean puntoErroneo(Punto p){
  if(p.tipo != 1 &&(p.x*0.5) - p.y >= 0)
    return true;
  
  return false;
}
