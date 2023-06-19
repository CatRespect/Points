/*

 Логика зависит от фпс,
 Убирать или нет?
 Нет.
 
 
 
 */
void slick(Point point) {
  float res_x=0;
  float res_y=0;
  for (int i=0; i<touches.length; i++) {
    float del_x=touches[i].x-point.get_x();
    float del_y=touches[i].y-point.get_y();
    float dis=sqrt(sq(del_x)+sq(del_y));
    float t=sq(del_x/del_y);
    dis=sq(sq((dis-1300)*4/1300));
    dis=dis/(1+t);
    float move_y=dis;
    float move_x=move_y*t;
    move_x=sqrt(move_x);
    if (invertedModeCutScene) {
      move_y=sqrt(move_y);
    } else {
      if (SelectedMode==1) {
        move_y=sqrt(move_x);//y//x
      } else if (SelectedMode==2) {
        move_y=sqrt(move_y);//y//x
      }
    }
    if (del_x<0) {
      move_x=0-move_x;
    }
    if (del_y<0) {
      move_y=0-move_y;
    }
    if (Float.isNaN(move_x)) {
      move_x=0;
    }
    if (Float.isNaN(move_y)) {
      move_y=0;
    }
    res_x+=move_x;
    res_y+=move_y;
  }
  if (!invertedMode) {
    point.move(res_x, res_y);
  } else {
    point.move(point.move_x+res_x/5, point.move_y+res_y/5);
  }
}


void pslick(Point point) {
  float res_x=0;
  float res_y=0;
  float del_x=SettingsPoint.x-point.get_x();
  float del_y=SettingsPoint.y-point.get_y();
  if (CutSceneFase==3) {
    del_y=SettingsPoint.y*2-point.get_y();
  }
  float dis=sqrt(sq(del_x)+sq(del_y));
  float t=sq(del_x/del_y);
  if (CutSceneFrames<=300) {
    dis=sq(sq((dis-height)*4/height));
  } else {
    dis=sq(sq((dis-1300)*4/1300));
  }
  dis=dis/(1+t);
  float move_y=dis;
  float move_x=move_y*t;
  move_x=sqrt(move_x);
  move_y=sqrt(move_y);

  if (del_x<0) {
    move_x=0-move_x;
  }
  if (del_y<0) {
    move_y=0-move_y;
  }
  if (Float.isNaN(move_x)) {
    move_x=0;
  }
  if (Float.isNaN(move_y)) {
    move_y=0;
  }
  if (CutSceneFase<3) {
    res_x+=move_x*CutSceneFrames/60;
    res_y+=move_y*CutSceneFrames/60;
  } else {
    res_x-=move_x;
    res_y-=move_y;
  }
  if (!invertedMode) {
    point.move(res_x, res_y);
  } else {
    point.move(point.move_x+res_x, point.move_y+res_y);
  }
}


void fasing(int i) {
  for (int j=points.size()-1; j>=0; j--) {
    if (i!=j) {
      Point ii=points.get(i);
      Point jj=points.get(j);
      if (ii.get_x()==jj.get_x() && ii.get_y()==jj.get_y()) {
        ii.place(ii.get_x()+random(-3, 3), ii.get_y()+random(-2, 2));
        jj.place(jj.get_x()+random(-3, 3), jj.get_y()+random(-2, 2));
      }
    }
  }
}

void onAccelerometerEvent(float x, float y, float z)
{
  accelerometerX = x;
  accelerometerY = y;
  accelerometerZ = z;
  //println(cos(PI-atan2(accelerometerY, accelerometerX))*5,sin(PI-atan2(accelerometerY, accelerometerX))*5,-accelerometerX,accelerometerY);
}
