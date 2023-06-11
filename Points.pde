ArrayList<Point> points;
import ketai.sensors.*;
KetaiSensor sensor;
float accelerometerX, accelerometerY, accelerometerZ, rotation;
float barrier=0;
color setting=color(random(150, 255), random(150, 255), random(150, 255));
Point SettingsPoint;
boolean inSettings;
int SelectedMode=1;
int plength=2;
void setup() {
  size(displayWidth, displayHeight);
  frameRate(60);
  stroke(0);
  background (0);
  barrier=min(width, height)*0.13;

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
    if (in.length!=3) {
      print("FILE CORRUPTED");//добавить максимальное извлечение данных
      SettingsPoint=new Point(x, y, color(random(50, 255), random(50, 255), random(50, 255)), 50);
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
    }
  }


  SettingsPoint=new Point(x, y, color(random(50, 255), random(50, 255), random(50, 255)), 50);

  sensor = new KetaiSensor(this);
  sensor.start();

  points=new ArrayList<Point>();
  //points.add(new Point(width/2, height/2, #2A9627, 20));
  for (int i=20; i>0; i--) {
    for (int j=20; j>0; j--) {
      points.add(new Point(width/2+(10-j)*25, height/2+(10-i)*50, color(random(255), random(255), random(255)), 20));
    }
  }
}

void draw() {
  background (0);
  if(inSettings){
  filter(INVERT);}
  for (int i=points.size()-1; i>=0; i--) {
    Point point = points.get(i);
    // collusion (i);
    point.update();
    fasing(i);
    //print("["+str(point.get_move_x())+","+str(point.get_move_y())+"],");
    point.draw();
    if (touches.length!=0) {
      slick(point);
    }
  }
  if(inSettings){
  filter(INVERT);}

  if (touches.length==5) {//5
    Settings();
  } else if (plength==5) {//5
    inSettings=false;
    SettingsPoint.col=color(random(100, 255), random(100, 255), random(100, 255));
    setting=color(random(150, 255), random(150, 255), random(150, 255));
    saving();
  }
  plength=touches.length;
  //print(frameRate);
}