void checkwin(){
  stillcovered = 0;
  flagged = 0;
  for(int i = 0; i < tiles.length; i ++){
    if(iscovered[i]){
      stillcovered ++;
    }
    if(isflagged[i]){
      flagged++;
  }
  }
  if(stillcovered == 99 && !isdead){
    fill(255);
    textSize(128);
    textAlign(CENTER, CENTER);
    text("YOU WIN!", width/2, height/2);
  }
}
