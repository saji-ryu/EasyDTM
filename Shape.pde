public class Shape {

  float dir = 20;
  float qscale;
  float rscale;
  float tscale;
  color col;
  int x;
  int y;
  boolean isPlayed;
  String tone;
  String rhythm;
  boolean isRhythm;
  int num;

  Shape(int _x, int _y, color _col, String _tone, String _rhythm, boolean _isRhythm, int _rnum) {
    col = _col;
    x = _x;
    y = _y;
    isPlayed = false;
    tone = _tone;
    rhythm = _rhythm;
    isRhythm = _isRhythm;
    num = _rnum;
    qscale = 10;
    rscale = 8;
    tscale = 3;
  }


  void display() {
    if (!isRhythm) {
      fill(col);
      ellipse(x, y, dir, dir);
    } else if (num<4) {
      fill(col);
      quad(x, y-qscale, x-qscale, y, x, y+qscale, x+qscale, y);
    } else if (num<8) {
      fill(col);
      rect(x-rscale, y-rscale, rscale*2, rscale*2);
    } else {
      fill(col);
      triangle(x, y-tscale*4, x-tscale*3, y+tscale*2, x+tscale*3, y+tscale*2);
    }

    this.effect();
  }

  void effect() {
    if (scan.x-scan.delay-x > -3 && scan.x-scan.delay-x<10) {
      dir = dir+(scan.x-scan.delay-x+3)*1.5;
      qscale = qscale +(scan.x-scan.delay-x+3);
      rscale = rscale +(scan.x-scan.delay-x+3)/1.8;
      tscale = tscale +(scan.x-scan.delay-x+3)/4;
    } else {
      this.init();
    }
  }

  void scaleback() {
    scale(1.0);
  }

  void init() {
    dir = 20;
    qscale = 10;
    rscale = 8;
    tscale = 3;
  }
}