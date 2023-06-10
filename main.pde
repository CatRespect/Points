PGraphics pg, pg1, pgp;
ArrayList<Point> points;
import ketai.sensors.*;
KetaiSensor sensor;
float accelerometerX, accelerometerY, accelerometerZ, rotation;
float barrier=0;
color setting=color(random(150, 255), random(150, 255), random(150, 255));
Point SettingsPoint;
int SelectedMode=1;
void setup() {
  size(displayWidth, displayHeight);
  frameRate(60);
  stroke(0);
  background (0);
  pg = createGraphics(width, height);
  pg1 = createGraphics(width, height);
  pgp = createGraphics(width, height);
  barrier=min(width, height)*0.13;

  boolean fileExists = doesFileExist("settings.ini");
  float x, y;
  x=(barrier*1.5+width/2)/2;
  y=barrier*4.5;
  print(fileExists);
  if (!fileExists) {
    println("NO FILE");
    SettingsPoint=new Point(x, y, color(random(50, 255), random(50, 255), random(50, 255)), 50);
    saving();
  } else {
    String[] in = loadStrings("settings.ini");
    if (in[0].split("=")[0].equals("SelectedMode") && (int(in[0].split("=")[1])==1 || int(in[0].split("=")[1])==2)) {
      SelectedMode=int(in[0].split("=")[1]);
      println("ON START SELECTED MODE: "+str(SelectedMode));
    } else {
      println(in[0]);
    }

    if (in[1].split("=")[0].equals("SettingsPointX") ) {
      x=float(in[1].split("=")[1]);
      println("ON START SETTINGSPOINT X: "+str(x));
    } else {
      println(in[1]);
    }

    if (in[2].split("=")[0].equals("SettingsPointY")) {
      y=int(in[2].split("=")[1]);
      println("ON START SETTINGSPOINT Y: "+str(y));
    } else {
      println(in[2]);
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
  if (touches.length==2) {//5
    Settings();
  } else {
    pg = createGraphics(width, height);
    pg1 = createGraphics(width, height);
    SettingsPoint.col=color(random(50, 255), random(50, 255), random(50, 255));
    setting=color(random(150, 255), random(150, 255), random(150, 255));
    saving();
  }
  //print(frameRate);
}
