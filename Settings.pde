void Settings() {
  inSettings=true;
  rotation=PI-atan2(accelerometerY, accelerometerX);

  strokeWeight(25);
  if(millis()/1000%2==0){
  stroke(setting, (millis()%1000+1)*0.255);
  }else{
  stroke(setting, (1000-millis()%1000-1)*0.255);
  }
  for(int i=0;i<10;++i){
  line(barrier*1.5, barrier, barrier*1.5, barrier*5);
  line(width-barrier*1.5, barrier, width-barrier*1.5, barrier*5);
  line(barrier*1.5, barrier, width-barrier*1.5, barrier);
  line(barrier*1.5, barrier*5, width-barrier*1.5, barrier*5);
  line(width/2, barrier*3.5, width/2, barrier*5);
  }
  strokeWeight(4);

  SettingsPoint.pupdate();
  SettingsPoint.pdraw();
  //SettingsPoint.move(cos(rotation)*5, sin(rotation)*5);
  SettingsPoint.move(-accelerometerX,accelerometerY);
  //SettingsPoint.print();
}
