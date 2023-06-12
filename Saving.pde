void saving() {
  String[] out = new String[4];
  out[0]="SelectedMode="+str(SelectedMode);
  out[1]="SettingsPointX="+str(SettingsPoint.x);
  out[2]="SettingsPointY="+str(SettingsPoint.y);
  out[3]="DebugMode="+str(debugMode);
  saveStrings("settings.ini", out);
  println("SAVING COMPLETE:  \n"+out[0]+"\n"+out[1]+"\n"+out[2]+"\n"+out[3]);
}
