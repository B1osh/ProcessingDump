

void mines(){
  
  for(int i = 0; i < tiles.length; i ++){
   tiletype[i] = 0;
  }
  
  for(int i = 0; i < 99; i += 0){
    int c = 0;
    c = int(random(tiletype.length));
    if(tiletype[c] != -1){
      tiletype[c] = -1;
    }
    i++;
  }
}
