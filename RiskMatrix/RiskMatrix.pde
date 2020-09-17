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


  cases.add(new Case(0.8, 3.6, "LOREM IPSUM"));


  Collections.sort(cases);

  Matrix m = new Matrix(100);
  m.show(cases);
  save("../RiskMatrix.png");
  noLoop();
}
