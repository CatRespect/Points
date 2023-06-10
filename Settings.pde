void Settings() {
  rotation=PI-atan2(accelerometerY, accelerometerX);

  pg.beginDraw();
  pg.background(0, 5);
  pg.endDraw();

  pg1.beginDraw();
  pg1.stroke(setting, 7);
  pg1.fill(setting, 7);
  pg1.rectMode(CORNERS);
  //pg1.rect(barrier,barrier,width-barrier, barrier*5);
  for (float i=barrier; i<=barrier*5; ++i) {
    pg1.ellipse(barrier*1.5, i, 25, 25);
  }
  for (float i=barrier; i<=barrier*5; ++i) {
    pg1.ellipse(width-barrier*1.5, i, 25, 25);
  }
  for (float i=barrier*1.5; i<=width-barrier*1.5; ++i) {
    pg1.ellipse(i, barrier, 25, 25);
  }
  for (float i=barrier*1.5; i<=width-barrier*1.5; ++i) {
    pg1.ellipse(i, barrier*5, 25, 25);
  }
  for (float i=barrier*3.5; i<=barrier*5; ++i) {
    pg1.ellipse(width/2, i, 25, 25);
  }
  pg1.endDraw();

  image(pg, 0, 0);
  image(pg1, 0, 0);

  pgp = createGraphics(width, height);
  SettingsPoint.pupdate();
  SettingsPoint.pdraw();
  SettingsPoint.move(cos(rotation)*4, sin(rotation)*4);
  //SettingsPoint.print();
}
