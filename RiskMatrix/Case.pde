class Case implements Comparable<Case> {

  private final float possibility;
  private final float impact;
  private final String description;

  public Case(float possibility, float impact, String description) {
    this.possibility = possibility;
    this.impact = impact;
    this.description = description;
  }

  public void show(PVector zero, PVector max, String name) {
    ellipseMode(CENTER);
    PVector pos = getCoordinates(zero, max);
    ellipse(pos.x, pos.y, 3, 3);
    textAlign(LEFT, BOTTOM);
    textSize(22);
    text(name, pos.x*1.005, pos.y*1.005);
  }

  public void showDescription(float posX, float posY, String name) {
    textAlign(RIGHT, CENTER);
    text(name + ":", posX - 10, posY);
    textAlign(LEFT, CENTER);
    text(this.description, posX, posY);
  }
  private PVector getCoordinates(PVector zero, PVector max) {
    float x =  map(this.possibility, 0, 4, zero.x, max.x);
    float y = map(this.impact, 0, 4, zero.y, max.y);
    return new PVector(x, y);
  }

  @Override
    public int compareTo(Case o) {
    return int(this.possibility*1000 - o.possibility*1000);
  }
}
