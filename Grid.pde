public class Grid {
  int xinterval;
  int yinterval;
  int xlines;
  int ylines;
  Grid() {
    xinterval = 20;
    yinterval = 20;
    xlines = width/xinterval;
    ylines = height/yinterval;
  }

  void display() {
    stroke(100, 100, 100);
    strokeWeight(0.5);
    for (int i=0; i<xlines-1; i++) {
      line((i+1)*xinterval, 0, (i+1)*xinterval, height);
    }
  }
}