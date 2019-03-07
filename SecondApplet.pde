class SecondApplet extends PApplet {
  PApplet parent;
  PSurface surface;
  PImage img;

  @Override
    void exitActual() {
  }

  SecondApplet(PApplet _parent, PImage _img) {
    super();
    img=_img;

    // set parent
    this.parent = _parent;
    //// init window
    try {
      java.lang.reflect.Method handleSettingsMethod =
        this.getClass().getSuperclass().getDeclaredMethod("handleSettings", null);
      handleSettingsMethod.setAccessible(true);
      handleSettingsMethod.invoke(this, null);
    } 
    catch (Exception ex) {
      ex.printStackTrace();
    }

    surface = super.initSurface();
    surface.placeWindow(new int[]{(int)random(900), (int)random(200)}, new int[]{0, 0});

    this.showSurface();
    this.startSurface();
  }

  //---------------------------------------------
  float deg;

  void settings() {
    size(img.width, img.height);
  }

  void setup() {
  }

  void draw() {
    deg=random(360);
    imageMode(CENTER);
    translate(width/2.0, height/2.0);
    rotate(radians(deg));
    image(img, 0, 0);
  }
}