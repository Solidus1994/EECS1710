class myCharacter {
  ArrayList<BezierCurve> strokes;// = new ArrayList<BezierCurve>();
  
  myCharacter (char c) {
    strokes = new ArrayList<BezierCurve>();
    switch (c) {
      case 'a':
        strokes.add(new BezierCurve(new PVector(200, 100), 
          new PVector(400, 1000),
          new PVector(300, 400)));
        strokes.add(new BezierCurve(new PVector(420, 180), 
          new PVector(100, 150),
          new PVector(200, 430),
          new PVector(700, 350)));
        break;
      case 'b':
        strokes.add(new BezierCurve(new PVector(100, 100), 
          new PVector(100, 200),
          new PVector(200, 500)));
        strokes.add(new BezierCurve(new PVector(100, 350), 
          new PVector(300, 350),
          new PVector(400, 500),
          new PVector(100, 500)));
        break;
    }

  }
  
  void draw() {
    for (int i =0; i<strokes.size(); i++) {
      strokes.get(i).draw();
    }
  }
}
