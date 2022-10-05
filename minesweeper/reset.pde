void reset(){
  
  for(int i = 0; i < iscovered.length; i++){
    iscovered[i] = true;
    isflagged[i] = false;
  }
  mines();
  tiles();
  isdead = false;
    
}
