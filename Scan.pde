public class Scan {
  float x;
  int speed;
  color[] getr;
  int delay;


  Scan() {
    x = 100;
    speed = 4;
    delay =45;
  }

  void update() {
    if (x >= width) {
      x=0;
      for (int i=0; i<shapes.size(); i++) {
        Shape s = shapes.get(i);
        s.isPlayed = false;
      }
    }

    for (int i=0; i<shapes.size(); i++) {
      Shape s = shapes.get(i);
      float dis = abs(x - s.x);
      int scale = round(map(height-s.y, 0, height, 36, 95));
      if (dis<3 && !s.isPlayed) {
        s.isPlayed =true;
        OscMessage msg = new OscMessage("/run-code");
        msg.add("fromP5");
        if (s.isRhythm == false) {
          msg.add("use_synth :"+s.tone+"; play "+scale+";");
        } else {
          msg.add("sample :"+s.rhythm+";");
        }

        oscP5.send(msg, location);
      }
    }
  }

  void display() {
    background(0);
    stroke(200, 200, 200);
    if (x>delay) {
      line(x-delay, 0, x-delay, height);
    } else {
      line(width+x-delay, 0, width+x-delay, height);
    }
    x+=speed;
  }
}