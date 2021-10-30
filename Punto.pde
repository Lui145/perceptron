class Punto {  
  float x;
  float y;
  int tipo;
  
  Punto(float x, float y){
    this.x = x;
    this.y = y;
    tipo = 1;
  }
  
  void pintar(){
    strokeWeight(0);
    if(tipo == 1)
      fill(255,0,0);
    else
      fill(0,255,0);
    ellipse(x+width/2, y+height/2,8,8);
  }
  
}
