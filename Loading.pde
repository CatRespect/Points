boolean doesFileExist(String filePath) {
  return new File(dataPath(filePath)).exists();
}

void loading() {
  file = new SoundFile(this, "sample1.mp3");
  filex = new SoundFile(this, "sample.mp3");


  String[] pdisclaimer = loadStrings("disclaimer.txt");
  String[] pdisclaimer_rus = loadStrings("disclaimer_rus.txt");
  String[] ppress = loadStrings("press.txt");
  String[] ppress_rus = loadStrings("press_rus.txt");
  for (String line : pdisclaimer) {
    disclaimer+=line+"\n";
  }
  for (String line : pdisclaimer_rus) {
    disclaimer_rus+=line+"\n";
  }
  for (String line : ppress) {
    press+=line+"\n";
  }
  for (String line : ppress_rus) {
    press_rus+=line+"\n";
  }
  font=createFont("font.ttf", 100);
  font1=createFont("font1.ttf", 50);
  font2=createFont("font2.ttf", 46);
  pres=createFont("press.ttf", 35);
  pfont=createFont("font.ttf", 102);
  pdefault=createFont("default.ttf",20);


  if (!doesFileExist("spoiler.txt")) {
    invertedMode=false;
    println("NOT INVERTED MODE");
  } else {
    invertedMode=true;
    println("INVERTED MODE");
  }

  boolean fileExists = doesFileExist("settings.ini");
  float x, y;
  x=(barrier*1.5+width/2)/2;
  y=barrier*4.5;
  print(fileExists);
  if (!fileExists) {
    println("NO FILE");
    SettingsPoint=new Point(x, y, color(random(100, 255), random(100, 255), random(100, 255)), 50);
    saving();
  } else {
    String[] in = loadStrings("settings.ini");
    if (in.length!=4) {
      print("FILE CORRUPTED");//добавить максимальное извлечение данных
      SettingsPoint=new Point(x, y, color(random(100, 255), random(100, 255), random(100, 255)), 50);
      saving();
    } else {
      if (in[0].split("=")[0].equals("SelectedMode") && (int(in[0].split("=")[1])==1 || int(in[0].split("=")[1])==2)) {
        SelectedMode=int(in[0].split("=")[1]);
        println("ON START SELECTED MODE: "+str(SelectedMode));
      } else {
        println(in[0]);
      }
      print("STEP 1");

      if (in[1].split("=")[0].equals("SettingsPointX")) {
        x=float(in[1].split("=")[1]);
        println("ON START SETTINGSPOINT X: "+str(x));
      } else {
        println(in[1]);
      }
      print("STEP 2");

      if (in[2].split("=")[0].equals("SettingsPointY")) {
        y=float(in[2].split("=")[1]);
        println("ON START SETTINGSPOINT Y: "+str(y));
      } else {
        println(in[2]);
      }
      print("STEP 3");

      if (in[3].split("=")[0].equals("DebugMode")) {
        debugMode=boolean(in[3].split("=")[1]);
        println("DEBUGMODE: "+str(debugMode));
      } else {
        println(in[3]);
      }
      print("STEP 4");
    }
  }

  SettingsPoint=new Point(x, y, color(random(100, 255), random(100, 255), random(100, 255)), 50);
  while (abs(red(setting)-red(SettingsPoint.col))+abs(green(setting)-green(SettingsPoint.col))+abs(blue(setting)-blue(SettingsPoint.col))<=30) {
    SettingsPoint.col=color(random(100, 255), random(100, 255), random(100, 255));
  }
  saving();
}
