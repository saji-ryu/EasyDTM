import oscP5.*;
import netP5.*;
import controlP5.*;

OscP5 oscP5;
NetAddress location;

ControlP5 cp5;
ButtonBar tonebar;
ButtonBar rhythmbar;

Grid grid;
ArrayList<Shape> shapes;
Controler s_controler;
Scan scan;


void setup() {
  frameRate(60);
  size(1200, 800, P3D);
  colorMode(RGB, 256);
  background(0);

  oscP5 = new OscP5(this, 12000);
  location = new NetAddress("127.0.0.1", 4557);

  grid = new Grid();
  shapes = new ArrayList<Shape>();
  s_controler = new Controler();
  scan = new Scan();

  cp5 = new ControlP5(this);

  tonebar = cp5.addButtonBar("TONE")
    .setPosition(0, 0)
    .setItems(s_controler.toneset)
    .setSize(1200, 20);

  rhythmbar = cp5.addButtonBar("RHYTHM")
    .setPosition(0, 20)
    .setItems(s_controler.rhythmset)
    .setSize(1200, 20);
}

void draw() {
  scan.update();
  s_controler.update();
  scan.display();
  grid.display();
  for (int i=0; i<shapes.size(); i++) {
    Shape s = shapes.get(i);
    s.display();
  }
}

void mousePressed() {
}

void mouseClicked() {
  if (mouseY>50) {
    shapes.add(new Shape(mouseX, mouseY, s_controler.ncol, s_controler.ntone, s_controler.nrhythm, s_controler.isRhythm, s_controler.rnum));
  }
}