float bezier(float x0, float x1, float x2, float t) {
  return (1.0 - t) * ((1.0-t) * x0 + t * x1) 
        + t * ((1.0-t) * x1 + t * x2);
}

class BezierCurve {
  float steps = 1000;
  ArrayList<PVector> control_points;
  String mode;
  
  BezierCurve (PVector p0, PVector p1, PVector p2) {
    control_points = new ArrayList<PVector>() {
      {add(p0);
      add(p1);
      add(p2);}
    };
    mode = "Quadratic";
  }
  
  BezierCurve (PVector p0, PVector p1, PVector p2, PVector p3) {
    control_points = new ArrayList<PVector>() {
      {add(p0);
      add(p1);
      add(p2);
      add(p3);}
    };
    mode = "Cubic";
  }
  
  float bezier(float x0, float x1, float x2, float t) {
  return (1.0 - t) * ((1.0-t) * x0 + t * x1) 
        + t * ((1.0-t) * x1 + t * x2);
  }
  
  void draw() {
    for (int i=0; i<control_points.size(); i++) {
      text("p"+String.valueOf(i)+"("+String.valueOf(control_points.get(i).x)+", "+String.valueOf(control_points.get(i).y)+")", 
      control_points.get(i).x, control_points.get(i).y);
    }
    
    if (mode=="Quadratic") {
      for (int i=0; i<steps; i++) {
        float t = i / steps;
        float x = (1.0 - t) * ((1.0-t) * control_points.get(0).x + t * control_points.get(1).x) 
        + t * ((1.0-t) * control_points.get(1).x + t * control_points.get(2).x);
        float y = (1.0 - t) * ((1.0-t) * control_points.get(0).y + t * control_points.get(1).y) 
        + t * ((1.0-t) * control_points.get(1).y + t * control_points.get(2).y);
        point(x, y);
      }
    }
    if (mode=="Cubic") {
      for (int i=0; i<steps; i++) {
        float t = i / steps;
        float x = (1.0 - t) * bezier(control_points.get(0).x, control_points.get(1).x, control_points.get(2).x, t) 
        + t * bezier(control_points.get(1).x, control_points.get(2).x, control_points.get(3).x, t);
        float y = (1.0 - t) * bezier(control_points.get(0).y, control_points.get(1).y, control_points.get(2).y, t) 
        + t * bezier(control_points.get(1).y, control_points.get(2).y, control_points.get(3).y, t);
        point(x, y);
      }
    }
  }
}
