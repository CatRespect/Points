ArrayList<Point> points;
import ketai.sensors.*;
import processing.sound.*;
KetaiSensor sensor;
float accelerometerX, accelerometerY, accelerometerZ, rotation;
float barrier=0;
color setting=color(random(150, 255), random(150, 255), random(150, 255));
Point SettingsPoint;
boolean inSettings;
boolean debugMode=false;
int SelectedMode=1;
int plength=2;
int debugmax=5;
int debug=debugmax;

SoundFile file, filex;
boolean sound=true;
boolean invertedMode=false;
boolean invertedModeCutScene=false;
int CutSceneFase=1;
int CutSceneFrames=0;

PFont font, font1, font2, pres, pfont, pfont1, pfont2, ppres, pdefault;
String disclaimer="";
String disclaimer_rus="";
String press="";
String press_rus="";
String language="";
int language_fon=0;
float language_time;
boolean language_pressed=false;
boolean disc=true;

void setup() {
  size(displayWidth, displayHeight);
  frameRate(60);
  stroke(0);
  background (0);
  barrier=min(width, height)*0.13;

  orientation(PORTRAIT);
  //Добавить пасхалку для квадратных дисплеев

  loading();

  textAlign(CENTER, CENTER);
  rectMode(CORNERS);

  sensor = new KetaiSensor(this);
  sensor.start();

  points=new ArrayList<Point>();
  //points.add(new Point(width/2, height/2, #2A9627, 20));
  for (int i=20; i>0; i--) {
    for (int j=20; j>0; j--) {
      color clr=color(random(255), random(255), random(255));
      while (red(clr)+green(clr)+blue(clr)<=60) {
        clr=color(random(255), random(255), random(255));
      }
      points.add(new Point(width/2+(10-j)*25, height/2+(10-i)*50, clr, 20));
    }
  }
}








void draw() {
  if (disc) {
    Disclaimer();
  } else {
    background (0);
    if (invertedModeCutScene) {
      //debugMode=true;//metka
      CutSceneFrames+=1;
      if (CutSceneFrames>=8000 && CutSceneFase==1) {
        CutSceneFase=2;
      }
      if (CutSceneFrames>=8300 && CutSceneFase==2) {
        CutSceneFase=3;
      }
      if (CutSceneFrames>=9000 && CutSceneFase==3) {
        background(255);
        delay(100);
        exit();
      }
    }
    for (int i=points.size()-1; i>=0; i--) {
      Point point = points.get(i);
      // collusion (i);
      if (CutSceneFase!=2 ) {
        point.update();
      } else {
        point.move_x=0;
        point.move_y=0;
      }
      fasing(i);

      if (!invertedModeCutScene && inSettings) {
        point.inverted_draw();
      } else {
        point.draw();
      }

      //point.print();
      if (invertedModeCutScene) {
        if (CutSceneFase!=2) {
          pslick(point);
        }
      } else if (touches.length!=0 && millis()-language_time>=5000) {
        slick(point);
      }
    }



    if (debugMode) {
      textSize(20);
      if (frameRate>=57) {
        fill(#1AEA18);
      } else if (frameRate>=30) {
        fill(#FAC70D);
      } else if (frameRate>=10) {
        fill(#FF771C);
      } else {
        fill(#FF0900);
      }
      text(int(frameRate), width-60, height-40);
      text(CutSceneFrames, 60, height-40);
      text(touches.length, width-60, 40);
    }



    if (!invertedModeCutScene) {
      if (touches.length==5) {//5
        Settings();
      } else if (plength==5) {//5
        inSettings=false;
        SettingsPoint.col=color(random(100, 255), random(100, 255), random(100, 255));
        setting=color(random(150, 255), random(150, 255), random(150, 255));
        while (abs(red(setting)-red(SettingsPoint.col))+abs(green(setting)-green(SettingsPoint.col))+abs(blue(setting)-blue(SettingsPoint.col))<=30) {
          SettingsPoint.col=color(random(100, 255), random(100, 255), random(100, 255));
        }
        saving();
      }
      if (touches.length==debug && plength==debug+1) {
        debug-=1;
      } else if(touches.length!=debug+1){
        debug=debugmax;
      }
      if (debug==-1) {//debugMode
        if (debugMode==false) {
          frameRate(400);
          debugMode=true;
        } else {
          frameRate(60);
          debugMode=false;
        }
        saving();
        debug=debugmax;
      }
      if (touches.length==10) {//10
        if (sound) {
          if (random(10)>=9) {
            filex.play(1, 1);
            println("SOUND1");
          } else {
            file.play(1, 1);
            println("SOUND");
          }
          sound=false;
        }
      } else if (plength==10) {
        sound=true;
      }
      plength=touches.length;
    }
  }
}
