
class Matrix {
  private final String[] POSSIBILITES = new String[]{"unwahr-\nscheinlich", "möglich", "wahr-\nscheinlich", "sehr wahr-\nscheinlich"};
  private final String[] IMPACTS = new String[]{"Klein", "Mittel", "Gross", "Katastrophal"};
  private final String POSSIBILITIES_NAME = "Eintretens-\nwahrscheinlichkeit";
  private final String IMPACTS_NAME = "Schadensausmass";
  private final color[] COLORS = new color[]{color(0, 255, 0), color(255, 165, 0), color(255, 0, 0)};
  private final color TEXT_COLOR = color(0, 102, 153);
  private final int gs;


  public Matrix(int gridSize) {
    this.gs = gridSize;
  }

  public void show(List<Case> cases) {
    this.drawMatrix();
    PVector zeroPoint = new PVector(2*gs, 5*gs);
    PVector maxPoint = new PVector(6*gs, 1*gs);
    int increment = 20;
    int x = gs;
    int y = 6*gs + increment;
    for (int i = 1; i <= cases.size(); i++) {
      Case c = cases.get(i-1);
      c.show(zeroPoint, maxPoint, i+"");
      c.showDescription(x, y, i+"");
      y += increment;
    }
    this.showCopyright();
  }

  private void drawMatrix() {
    //big rect
    rect(2*gs, gs, 4*gs, 4*gs);


    //color rects
    //Green
    fill(COLORS[0]);
    rect(2*gs, 4*gs, gs, gs);
    rect(2*gs, 3*gs, gs, gs);
    rect(3*gs, 4*gs, gs, gs);
    //orange
    fill(COLORS[1]);
    rect(2*gs, 1*gs, gs, gs);
    rect(2*gs, 2*gs, gs, gs);
    rect(3*gs, 2*gs, gs, gs);
    rect(3*gs, 3*gs, gs, gs);
    rect(4*gs, 3*gs, gs, gs);
    rect(4*gs, 4*gs, gs, gs);
    rect(5*gs, 4*gs, gs, gs);
    //red
    fill(COLORS[2]);
    rect(3*gs, 1*gs, gs, gs);
    rect(4*gs, 1*gs, gs, gs);
    rect(5*gs, 1*gs, gs, gs);
    rect(4*gs, 2*gs, gs, gs);
    rect(5*gs, 2*gs, gs, gs);
    rect(5*gs, 3*gs, gs, gs);


    stroke(0);
    fill(0);
    //draw left arrow
    strokeWeight(2);
    line(2*gs, 6*gs, 2*gs, 0);
    //arrow tip
    beginShape();
    vertex(2*gs, 0);
    vertex(2*gs+gs/20.0, gs/10.0);
    vertex(2*gs-gs/20.0, gs/10.0);
    endShape(CLOSE);


    //draw bottom arrow
    line(gs, 5*gs, 7*gs, 5*gs);

    //arrow tip
    beginShape();
    vertex(7*gs, 5*gs);
    vertex(7*gs-gs/10.0, 5*gs+gs/20.0);
    vertex(7*gs-gs/10.0, 5*gs-gs/20.0);
    endShape(CLOSE);

    //text
    fill(TEXT_COLOR);
    textSize(gs/6);
    textAlign(RIGHT, TOP);
    text(IMPACTS_NAME, 1.9*gs, .5*gs);
    text(IMPACTS[3], 1.9*gs, 1.5 * gs);
    text(IMPACTS[2], 1.9*gs, 2.5 * gs);
    text(IMPACTS[1], 1.9*gs, 3.5 * gs);
    text(IMPACTS[0], 1.9*gs, 4.5 * gs);

    textAlign(LEFT, TOP);
    text(POSSIBILITIES_NAME, 6.1*gs, 5*gs);
    text(POSSIBILITES[0], 2.1*gs, 5*gs);
    text(POSSIBILITES[1], 3.1*gs, 5*gs);
    text(POSSIBILITES[2], 4.1*gs, 5*gs);
    text(POSSIBILITES[3], 5.1*gs, 5*gs);
  }

  private void showCopyright() {
    textAlign(LEFT, CENTER);
    fill(127);
    textSize(gs/10);
    text("© Matrix nach Form 06.100d (Umgang mit Risiken) Schweizer Armee", 3*gs, 0.5*gs);
  }
}