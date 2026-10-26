// One Drink = one observation (one row of the CSV)
class Drink {
  String date, time, type, temp, size, location;
  float x, y;

  Drink(String date, String time, String type, String temp, String size, String location, int index) {
    this.date = date;
    this.time = time;
    this.type = type;
    this.temp = temp;
    this.size = size;
    this.location = location;

    // lay drinks out in a 10 x 10 grid (100 drinks = full grid)
    int col = index % 10;
    int row = index / 10;
    x = 80 + col * 70;
    y = 100 + row * 70;
  }

  void display() {
    fill(colourFor(type));
    noStroke();
    float d = diameterFor(size);
    ellipse(x, y, d, d);

    // hot drinks get a ring around them
    if (temp.equals("hot")) {
      noFill();
      stroke(200, 50, 50);
      strokeWeight(2);
      ellipse(x, y, d + 8, d + 8);
    }
  }
}
