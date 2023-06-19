void Disclaimer() {
  if (language.equals("")) {
    background(0);
    noStroke();

    fill(255);
    rect(barrier, height/2-barrier, barrier*3, height/2+barrier);
    fill(0, 0, 255);
    triangle(barrier+barrier/5, height/2-barrier, barrier+barrier*2*2/5, height/2-barrier, barrier+barrier*2*2/5, height/2-barrier+barrier*3/5);
    triangle(barrier*3-barrier/5, height/2-barrier, barrier*3-barrier*2*2/5, height/2-barrier, barrier*3-barrier*2*2/5, height/2-barrier+barrier*3/5);
    triangle(barrier+barrier/5, height/2+barrier, barrier+barrier*2*2/5, height/2+barrier, barrier+barrier*2*2/5, height/2+barrier-barrier*3/5);
    triangle(barrier*3-barrier/5, height/2+barrier, barrier*3-barrier*2*2/5, height/2+barrier, barrier*3-barrier*2*2/5, height/2+barrier-barrier*3/5);

    triangle(barrier, height/2-barrier+barrier*2*2/5, barrier, height/2-barrier+barrier/5, barrier+barrier*3/5, height/2-barrier+barrier*2*2/5);
    triangle(barrier, height/2+barrier-barrier*2*2/5, barrier, height/2+barrier-barrier/5, barrier+barrier*3/5, height/2+barrier-barrier*2*2/5);
    triangle(barrier*3, height/2-barrier+barrier*2*2/5, barrier*3, height/2-barrier+barrier/5, barrier*3-barrier*3/5, height/2-barrier+barrier*2*2/5);
    triangle(barrier*3, height/2+barrier-barrier*2*2/5, barrier*3, height/2+barrier-barrier/5, barrier*3-barrier*3/5, height/2+barrier-barrier*2*2/5);

    fill(255, 0, 0);
    //rect(barrier,height/2-barrier+barrier*4/3,barrier*3,height/2+barrier);
    rect(barrier*2-barrier/10, height/2-barrier, barrier*2+barrier/10, height/2+barrier);
    rect(barrier, height/2-barrier/10, barrier*3, height/2+barrier/10);

    triangle(barrier, height/2-barrier, barrier+barrier/10, height/2-barrier, barrier*3, height/2+barrier);
    triangle(barrier+barrier/10, height/2-barrier, barrier*3, height/2+barrier, barrier*3, height/2+barrier-barrier/10);
    triangle(barrier, height/2-barrier, barrier, height/2-barrier+barrier/10, barrier*3, height/2+barrier);
    triangle(barrier, height/2-barrier+barrier/10, barrier*3, height/2+barrier, barrier*3-barrier/10, height/2+barrier);

    triangle(barrier, height/2+barrier, barrier+barrier/10, height/2+barrier, barrier*3, height/2-barrier);
    triangle(barrier+barrier/10, height/2+barrier, barrier*3, height/2-barrier, barrier*3, height/2-barrier+barrier/10);
    triangle(barrier, height/2+barrier, barrier, height/2+barrier-barrier/10, barrier*3, height/2-barrier);
    triangle(barrier, height/2+barrier-barrier/10, barrier*3, height/2-barrier, barrier*3-barrier/10, height/2-barrier);

    fill(255);
    rect(width-barrier*1, height/2-barrier, width-barrier*3, height/2+barrier);
    fill(0, 0, 255);
    rect(width-barrier*1, height/2-barrier+barrier*2/3, width-barrier*3, height/2+barrier);
    fill(255, 0, 0);
    rect(width-barrier*1, height/2-barrier+barrier*4/3, width-barrier*3, height/2+barrier);


    for (int i=0; i<touches.length; ++i) {
      if (touches[i].x>=barrier && touches[i].x<=barrier*3 && touches[i].y>=height/2-barrier && touches[i].y<=height/2+barrier) {
        language="english";
      } else if (touches[i].x>=width-barrier*3 && touches[i].x<=width-barrier && touches[i].y>=height/2-barrier && touches[i].y<=height/2+barrier) {
        language="russian";
      }
    }
  } else {
    background(language_fon);
    fill(language_fon*80/150);
    textFont(pfont);
    text("DISCLAIMER", width/2, barrier*0.75);
    fill(language_fon*255/150);
    textFont(font);
    text("DISCLAIMER", width/2, barrier*0.75);
    fill(language_fon*255/150);
    if (language.equals("english")) {
      textFont(font1);
      text(disclaimer, barrier/2, barrier, width-barrier/2, height-barrier);
      fill(language_fon*255/150, 255-abs(frameCount%120-60)*2);
      textFont(pres);
      text(press, barrier, height-barrier*1.75, width-barrier, height-barrier/2);
    } else if (language.equals("russian")) {
      textFont(font2);
      text(disclaimer_rus, barrier/2, barrier/1.5, width-barrier/2, height-barrier);
      fill(language_fon*255/150, 255-abs(frameCount%120-60)*2);
      textFont(pres);
      text(press_rus, barrier, height-barrier*1.75, width-barrier, height-barrier/2);
    }
    if (language_fon<150) {
      language_fon+=2;
    }

    if (touches.length==2 && language_time==0) {
      language_time=millis();
      language_pressed=true;
    } else if (touches.length!=2) {
      language_pressed=false;
      language_time=0;
    }
    if (language_pressed && millis()-language_time>=3000) {
      disc=false;
      textFont(pdefault);
    }
  }
}
