import java.util.List;
import java.util.LinkedList;
import java.util.Collections;

void setup() {
  size(850, 900);
  background(255);

  List<Case> cases = new LinkedList<Case>();
  /*
  Case(
   Wahrscheinlichkeit: float 0-4, 0-1 unwahrscheinlich ... 3-4 sehr wahrscheinlich
   Impact: float 0-4, 0-1 gering ... 3-4 katastrophal
   Text: String "Anzeige in Matrix",
   Description: String "Lange Bezeichnung")
   */
  
  cases.add(new Case(1.3, 2.1, "Transporteur nicht verfügbar für kritischen Transport"));
  cases.add(new Case(0.5, 2, "Tracking eines Transporteus fällt aus"));
  cases.add(new Case(2.8, 1.5, "Tracking aller Transporteure fällt aus"));
  

  Collections.sort(cases);

  Matrix m = new Matrix(100);
  m.show(cases);
  save("../RiskMatrix.png");
  noLoop();
}
