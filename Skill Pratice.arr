use context dcic2024
import lists as L

# --------------------- SKILL 1 ------------------------ #
fun nm-square(NUMBER :: Number) -> Number :
  doc: "calculates the squared value of input"
  NUMBER * NUMBER
where:
  nm-square(-1) is 1
  nm-square(2) is 4
end

# Problem 1 - Design a function check-age that, given a number that is someone's age, returns true when the age is above or equal to 21.

fun check-age(AGE :: Number) -> Boolean :
  doc: "verifies as true when age is above or equal to 21"
  if (AGE >= 21) :
    true
  else:
    false
  end
      where:
  check-age(18) is false
  check-age(30) is true
end

# Problem 2 - Design a function check-year, that takes a year as input, and returns "Past", "Current", or "Future" depending on the year.

fun check-year(YEAR :: Number) -> String :
  doc: "Considers if year inputted is in the past, future, or is the current year, 2026"
  if (YEAR < 2026) :
    "Past"
  else if (YEAR > 2026) :
      "Future"
  else: "Current"
end
where:
  check-year(2019) is "Past"
  check-year(2026) is "Current"
  check-year(3000) is "Future"
end

# Extra Practice ------------------------------------------

# 1 #
# You sell custom T-shirt designs for $12 each. However, every design requires a $3 setup fee. Write an expression to calculate the total cost for 5 identical T-shirts for a custom design. Then, write a second expression for 7 identical T-shirts for a design.

fun cost-custom-Tshirt(AMOUNT :: Number) -> Number :
  doc: "Calculates the cost for a custom Tshirt order, where each shirt cost $12 and there is a fixed fee of $3"
  (12 * AMOUNT) + 3
where:
  cost-custom-Tshirt(1) is (12 * 1) + 3
  cost-custom-Tshirt(50) is (12 * 50) + 3
end

# 2 #
# You also print posters. A client wants a 24" by 36" poster. The price is based on the perimeter of the poster times $0.10

fun poster-price(LENGTH :: Number, WIDTH :: Number) -> Number :
  doc: "Calculates the price of a poster order by multiplying the perimeter by $0.10"
  perimeter = (2 * LENGTH) + (2 * WIDTH)
  perimeter * 0.10
where:
  poster-price(10, 30) is ((2 * 10) + (2 * 30)) * 0.10
  poster-price(50, 2) is ((2 * 50) + (2 * 2)) * 0.10
end

# 3 #
# Make a traffic light
overlay-xy(circle(10, "solid", "red"),-10, -10, overlay-xy(circle(10, "solid", "green"),-10, -65, overlay-xy(circle(10, "solid", "yellow"),-10, -37, above(rectangle(40, 100, "solid", "dim-gray"), rectangle(10, 100, "solid", "beige")))))


# --------------------- SKILL 2 ------------------------ #

students = table: 
  name :: String,
  campus :: String
  row: "Renee", "Boston"
  row: "Gemma", "New York"
  row: "Rachel", "Miami"
end


fun scholars(t :: Table) -> Table:
  doc: "generates a table with students who are NOT in the Boston Campus"
  fun location-scholars(r :: Row) -> Boolean:
  r["campus"] <> "Boston" end
  filter-with(t, location-scholars)
where:
  block:
    outcome = table:
    name :: String,
    campus :: String
  row: "Gemma", "New York"
  row: "Rachel", "Miami" end
    scholars(students) is outcome
end
end


# Design a function add-bad-year-column that, given a table with columns for year, costs, and revenues, adds a new column called "bad-year" that contains true if the costs exceed revenues for that year, and false otherwise.

info = table:
  Years :: Number,
  Costs :: Number,
  Revenue :: Number
  row: 2001, 500, 800
  row: 2003, 400, 300 
  row: 2005, 450, 500
end


fun updated-info(t :: Table) -> Table:
  doc: "informs the performance of a year as bad if cost was greater than revenue"
  
  fun add-bad-year-column(r :: Row) -> Boolean: 
  r["Costs"] > r["Revenue"] end
  build-column(t, "Performance", add-bad-year-column)
  
    where:
    block: 
    outcome2 = table:
      Years :: Number,
      Costs :: Number,
      Revenue :: Number,
      Performance :: Boolean
      row: 2001, 500, 800, false
      row: 2003, 400, 300, true 
      row: 2005, 450, 500, false end
      updated-info(info) is outcome2
    end
 
end


# Design a function find-drought-risks that takes a table with "region", "rainfall-2023" and "rainfall-2024" columns and returns a new table containing only those regions where rainfall amounts decreased from 2023 to 2024.

weather = table:
  region :: String,
  rainfall-2023 :: Number,
  rainfall-2024 :: Number
  row: "Maine", 110, 85
  row: "Boston", 140, 120
  row: "New York", 100, 107
end

fun risk-table(t :: Table) -> Table:
    doc: "informs which regions present drought risks"
    
    fun find-drought-risks(r :: Row) -> Boolean:
    r["rainfall-2023"] > r["rainfall-2024"] end
  build-column(t, "drought-risk", find-drought-risks)
    
where:
  block:
    outcome3 = table:
      region :: String,
      rainfall-2023 :: Number,
      rainfall-2024 :: Number,
      drought-risk :: Boolean
      row: "Maine", 110, 85, true
      row: "Boston", 140, 120, true
      row: "New York", 100, 107, false
end
    outcome3 is risk-table(weather)
  end
end


restaurants = table:
  name :: String,
  dishes-sold-2023 :: Number,
  dishes-sold-2024 :: Number,
  dishes-sold-2025 :: Number,
  improvement-23-24 :: Boolean
  row: "Gyro Scope", 200, 250, 225, true
  row: "El Jefes", 500, 430, 475, false
  row: "Popeyes", 300, 325, 350, true
end

fun updated-table(t :: Table) -> Table: 
  doc: "updates the perfomance column to consider 2024 vs 2025"
  
  fun new-comparison(r :: Row) -> Boolean:
  r["dishes-sold-2024"] < r["dishes-sold-2025"] end
  build-column(t, "improvement-24-25", new-comparison)
  
where:
  block: outcome4 = table:
      name :: String,
      dishes-sold-2023 :: Number,
      dishes-sold-2024 :: Number,
      dishes-sold-2025 :: Number,
      improvement-23-24 :: Boolean,
      improvement-24-25 :: Boolean
      row: "Gyro Scope", 200, 250, 225, true, false
      row: "El Jefes", 500, 430, 475, false, true
    row: "Popeyes", 300, 325, 350, true, true  end
    updated-table(restaurants) is outcome4
  end
end


PARKS = table: 
  name :: String, 
  state :: String, 
  established :: Number, 
  area-sq-miles :: Number, 
  visitors-2024 :: Number
  row: "Yellowstone", "Wyoming", 1872, 3472, 4500000
  row: "Yosemite", "California", 1890, 1168, 3900000  
  row: "Grand Canyon", "Arizona", 1919, 1904, 6400000
  row: "Zion", "Utah", 1919, 229, 4700000
  row: "Rocky Mountain", "Colorado", 1915, 415, 4300000
  row: "Acadia", "Maine", 1916, 198, 2500000
  row: "Great Smoky Mountains", "Tennessee", 1934, 816, 12100000
  row: "Bryce Canyon", "Utah", 1928, 56, 2900000
end

PARKS.row-n(0)
PARKS.row-n(0)["name"] 

oldests-to-newest = order-by(PARKS, "established", true)


fun Utah-identifiation(r :: Row) -> Boolean:
r["state"] == "Utah" end


Utah-only = filter-with(PARKS, Utah-identifiation)
Utah-only.get-column("area-sq-miles")

Popular-only = filter-with(PARKS, lam(r): r["visitors-2024"] > 4000000 end)

Old-only = filter-with(PARKS, lam(r): r["established"] < 1920 end)


classroom = table:
  name :: String,
  grade-A :: Number,
  grade-B :: Number
  row: "Emily", 90, 80
  row: "John", 50, 30
  row: "Pedro", 20, 20
end

# Claude exercises -------------------------------------------------

fun pass-table(t :: Table) -> Table:
  doc: "adds a column indicating if student passed"
  
  fun pass-column(r :: Row) -> Boolean:
  ((r["grade-A"] + r["grade-B"]) / 2) > 70 end
  build-column(t, "passed", pass-column)
  
  
where:block:
    outcome5 = table: 
      name :: String,
      grade-A :: Number, 
      grade-B :: Number,
      passed :: Boolean
      row: "Emily", 90, 80, true
      row: "John", 50, 30, false
      row: "Pedro", 20, 20, false
end
    pass-table(classroom) is outcome5
  end
end

# ----------------------------------------

products = table: 
  product :: String,
  category :: String,
  price :: Number
  row: "coditioner", "self-care", 20
  row: "tissue", "cleaning products", 4
  row: "water bottle", "beverages", 2
end


fun discount-table(t :: Table) -> Table:
  doc: "takes the price of products and add a 10% discount"
  
  fun discount-applied(PRICE :: Number) -> Number:
  PRICE * 0.9 end
  transform-column(t, "price", discount-applied)
  
where: block:
    outcome6 = table: 
  product :: String,
  category :: String,
  price :: Number
      row: "coditioner", "self-care", 18
      row: "tissue", "cleaning products", 3.6
      row: "water bottle", "beverages", 1.8
end
    discount-table(products) is outcome6
  end
end

# ----------------------------------------

houses = table:
  location :: String,
  value :: Number
  row: "6769 Newbury ST", 500000
  row: "711 Mass Ave", 350000
  row: "789 State ST", 470000
end

fun informed-table(t :: Table) -> Table:
  doc: "only gives the houses above $400,000"
  
  fun comparision-value(r :: Row) -> Boolean:
    r["value"] > 400000 end
  filter-with(t, comparision-value)
  
where: block:
    outcome7 = table:
      location :: String, 
      value :: Number 
  row: "6769 Newbury ST", 500000
  row: "789 State ST", 470000
end
    outcome7 is informed-table(houses)
  end
end

informed-table(houses).get-column("location")

# ----------------------------------------

undergrads = table:
  name :: String,
  final-grade :: Number
  row: "Svaroskwy Highlander", 99
  row: "Jonhansa Cabaret", 67
  row: "Maxinne Portdancer", 88
end

fun ranked-table(t :: Table) -> Table:
  doc: "ranks the undergrads by grade performance"
  order-by(t, "final-grade", false)
  
where: block:
    outcome7 = table:
      name :: String,
      final-grade :: Number 
      row: "Svaroskwy Highlander", 99 
      row: "Maxinne Portdancer", 88 
      row: "Jonhansa Cabaret", 67 
end
    outcome7 is ranked-table(undergrads)
  end
end

# ----------------------------------------


employees = table:
  name :: String,
  department :: String,
  n-sales :: Number
  row: "Sarah", "tech", 300
  row: "Rob", "bed", 400
  row: "Michelle", "sports", 250
  row: "Lady Gaga", "music", 100
end

fun sales-performance(t :: Table) -> Table:
  doc: "tells if the sales person had a good performance"
  
  fun evaluation(r :: Row) -> Boolean:
  r["n-sales"] >= 300 end
  filter-with(employees, evaluation) 
  
where: block:
    outcome8 = table: 
      name :: String,
      department :: String,
      n-sales :: Number
      row: "Sarah", "tech", 300
      row: "Rob", "bed", 400
    end
    outcome8 is sales-performance(employees) 
  end
end
 
# Design a function list-of-squares that takes a list of numbers, and returns a list where each element is the square of N where N is the element from the list. You must use for each, rather than a built in list function or recursion.

fun list-of-squares(l :: List<Number>) -> List<Number> block:
  doc: "squares each element of a given list"
  
  var result = [list: ]
  for each(num from l):
    result := result + [list: num * num]
  end
result
where:
  list-of-squares([list: 0, 1, 2, 3]) is [list: 0, 1, 4, 9]
  list-of-squares([list: 5, 5]) is [list: 25, 25]
  list-of-squares([list: ]) is [list: ]
end

# Design a function has-positive that takes a list of numbers, and returns true if at least one number in the list is positive, false if none are. You must use for each, rather than a built in list function or recursion.

fun has-positive(l :: List<Number>) -> Boolean block:
  doc: "verifies if a list has at least one positive number"
  
  var result2 = false
  for each(num from l):
    if num > 0: 
      result2 := true
    else: 
      result2 := false
    end
  end
  result2
where:
  has-positive([list: -15, -10, 0, 1]) is true
  has-positive([list: 5, 5, 5]) is true
  has-positive([list: -1, -2, -3]) is false
  has-positive([list: ]) is false
end

# Sample question: Design a data definition for Beverage that can be either coffee with number of shots of espresso, or tea with name and brew-time in minutes. Then, write a function is-strong that returns true if the beverage is a coffee with more than 2 shots, or a tea brewed for more than 5 minutes.

data Beverage:
  | coffee(espresso :: Number)
  | tea(name :: String, brew-time :: Number)
end

fun is-strong(b :: Beverage) -> Boolean:
  doc: "verifies if a given beverage is strong"
  cases (Beverage) b:
    | coffee(shots) => shots > 2
    | tea(name, brew-time) => brew-time > 5
  end
where: 
  coffee1 = coffee(4)
  coffee2 = coffee(1)
  tea1 = tea("Black Tea", 6)
  tea2 = tea("Green Tea", 5) 
  
  is-strong(coffee1) is true
  is-strong(coffee2) is false
  is-strong(tea1) is true
  is-strong(tea2) is false
end

# Design a data definition for Restaurant that can be either yahoo with name and stars, or health-score with name and score. Then, write a function is-reputable that returns true if the resturant is a yahoo with at least 4 stars, or a health-score with score at least 85.

data Restaurant:
  | yahoo(name :: String, stars :: Number)
  | health-score(name :: String, score :: Number)
end

fun is-reputable(r :: Restaurant) -> Boolean:
  doc: "verifies if a restaurant is reputable (yahoo > 4 stars, health-score > 85"
  cases (Restaurant) r:
    | yahoo(name, stars) => stars > 4
    | health-score(name, score) => score > 85
  end
where:
  yahoo1 = yahoo("Dunkin", 5) 
  yahoo2 = yahoo("Popeyes", 2)
  health1 = health-score("Panera", 70)
  health2 = health-score("Gyroscope", 90)
  
  is-reputable(yahoo1) is true
  is-reputable(yahoo2) is false
  is-reputable(health1) is false
  is-reputable(health2) is true
end

# Design a data definition for Book that can be either rating with title, stars, and num-reviews, or sales-ranking with title and position. Then, write a function is-popular that returns true if the book is a rating with num-reviews of at least 500, or a sales-ranking with position less than 500.


data Book:
  | rating(title :: String, stars :: Number, num-reviews :: Number)
  | sales-ranking(title :: String, position :: Number)
end

fun is-popular(b :: Book) -> Boolean:
  doc: "verifies if a book is popular (rating with > 500 num-reviews or sales ranking < 500)"
  cases (Book) b:
    | rating(title, stars, num-reviews) => num-reviews > 500
    | sales-ranking(title, position) => position < 500
  end
where:
  book1 = rating("1984", 5.0, 10000)
  book2 = rating("Secret Garden", 3.5, 500)
  book3 = sales-ranking("Flowers to Algernon", 501)
  book4 = sales-ranking("The Earth of Mankind", 499)

  is-popular(book1) is true
  is-popular(book2) is false
  is-popular(book3) is false
  is-popular(book4) is true
end