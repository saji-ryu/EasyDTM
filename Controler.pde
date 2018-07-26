public class Controler {
  color ncol;
  color[] tcolorset  = {color(255, 81, 185), color(255, 89, 89), color(255, 124, 53), 
                        color(255, 235, 84), color(151, 255, 48), color(17, 255, 120), 
                        color(53, 211, 255), color(89, 144, 255), color(169, 89, 255)};
  color[] rcolorset  = {color(255, 94, 94), color(255, 255, 68), color(68, 255, 180), 
                        color(106, 123, 252), color(255, 94, 94), color(255, 255, 68), 
                        color(68, 255, 180), color(106, 123, 252), color(255, 94, 94), 
                        color(255, 255, 68), color(68, 255, 180), color(106, 123, 252)};
  String[] toneset = {"piano", "dsaw", "fm", "growl", "mod_fm", "pretty_bell", "saw", "square", "tb303"};
  String[] rhythmset = {"bd_haus", "bd_tek", "drum_heavy_kick", "drum_bass_hard", "drum_tom_mid_hard", "drum_tom_lo_hard", "drum_tom_hi_hard", "drum_snare_soft", "drum_splash_hard", "drum_cymbal_open", "drum_cymbal_closed", "drum_cowbell"};
  String ntone ="piano";
  String nrhythm ="bd_haus";
  boolean isRhythm = false;
  int rnum;


  Controler() {
    ncol = tcolorset[0];
  }


  void update() {
    tonebar.onClick(new CallbackListener() {
      public void controlEvent(CallbackEvent ev) {
        isRhythm = false;
        ButtonBar t = (ButtonBar)ev.getController();
        ntone = toneset[t.hover()];
        ncol = tcolorset[t.hover()];
      }
    }
    );

    rhythmbar.onClick(new CallbackListener() {
      public void controlEvent(CallbackEvent ev) {
        isRhythm = true;
        ButtonBar r = (ButtonBar)ev.getController();
        nrhythm = rhythmset[r.hover()];
        ncol = rcolorset[r.hover()];
        rnum = r.hover();
      }
    }
    );
  }
}