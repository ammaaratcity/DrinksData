// Dear Data 100 - Drinks
// Each row in data/drinks.csv is one drink I had.

Table table;
ArrayList<Drink> drinks = new ArrayList<Drink>();

void setup() {
  size(800, 800);
  table = loadTable("drinks.csv", "header");

  int i = 0;
  for (TableRow row : table.rows()) {
    Drink d = new Drink(
      row.getString("date"),
      row.getString("time"),
      row.getString("drink"),
      row.getString("temp"),
      row.getString("size"),
      row.getString("location"),
      i
    );
    drinks.add(d);
    i++;
  }
}

void draw() {
  background(245);

  if (drinks.size() == 0) {
    fill(80);
    textAlign(CENTER, CENTER);
    text("No drinks logged yet - add rows to data/drinks.csv", width/2, height/2);
    return;
  }

  for (Drink d : drinks) {
    d.display();
  }

  fill(40);
  textAlign(LEFT, TOP);
  text("Drinks logged: " + drinks.size(), 20, 20);
}

// A method that RETURNS a value: turns a drink type into a colour
color colourFor(String drink) {
  drink = drink.toLowerCase();
  if (drink.equals("water"))   return color(80, 160, 230);   // blue
  if (drink.equals("chai"))    return color(200, 140, 80);   // light brown
  if (drink.equals("mocha"))   return color(110, 60, 35);    // dark brown
  if (drink.equals("redbull")) return color(230, 50, 60);    // red
  if (drink.equals("coke"))    return color(40, 20, 20);     // near black
  return color(150);                                         // anything else = grey
}

// Another method that returns a value: turns size into a circle diameter
float diameterFor(String size) {
  if (size.equals("S")) return 25;
  if (size.equals("M")) return 40;
  if (size.equals("L")) return 60;
  return 30;
}
