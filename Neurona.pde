class Neurona {
  float[] pesos;
  float alfa;
  
  Neurona(int n, float tasa){
    pesos = new float[n+1];
    pesos[0] = 0.5;
    pesos[1] = 0.5;
    pesos[2] = 0.5;
    alfa = tasa;
  }
  
  float clasificar(float x, float y){
    float suma = 0;
    suma += x*pesos[0] + y*pesos[1] + pesos[2];
    return f(suma);
  }
  
  float f(float suma){
     return 1/(1+exp(-suma));
  }
  
  void entrenamiento(float x, float y, int correcto){
    float clasVal = clasificar(x,y);
    float error = correcto - clasVal;
    pesos[0] = pesos[0] + alfa*error*x;
    pesos[1] = pesos[1] + alfa*error*y;
    pesos[2] = pesos[2] + alfa*error;
  }
}
