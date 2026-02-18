use context dcic2024
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


students-table = table: 
  NAME :: String,
  CAMPUS :: String
  row: "Renee", "Boston"
  row: "Gemma", "New York"
  row: "Rachel", "Miami"
end

fun find-scholars(r :: Row) -> Boolean:
  doc: "selects only the students who are NOT in the Boston Campus"
  r["CAMPUS"] <> "Boston"
where:
  find-scholars(students-table.row-n(0)) is false
  find-scholars(students-table.row-n(1)) is true
  find-scholars(students-table.row-n(2)) is true
end

filter-with(students-table, find-scholars)
result = table:
  NAME :: String,
  CAMPUS :: String
  row: "Gemma", "New York"
  row: "Rachel", "Miami"
end

check: result is filter-with(students-table, find-scholars) end

# OR

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
  better-performance-than-past-year :: Boolean
  row: "Gyro Scope", 200, 250, 225, true
  row: "El Jefes", 500, 430, 475, false
  row: "Popeyes", 300, 325, 350, true
end

fun updated-table(t :: Table) -> Table: 
  doc: "updates the perfomance column to consider 2024 vs 2025"
  
  fun new-comparison(r :: Row) -> Boolean:
  r["dishes-sold-2024"] < r["dishes-sold-2025"] end
  transform-column(t, "better-performance-than-past-year", new-comparison)
  
where:
  block: outcome4 = table:
      name :: String,
      dishes-sold-2023 :: Number,
      dishes-sold-2024 :: Number,
      dishes-sold-2025 :: Number,
      better-performance-than-past-year :: Boolean
    row: "Gyro Scope", 200, 250, 225, false
    row: "El Jefes", 500, 430, 475, true
    row: "Popeyes", 300, 325, 350, true  end
    updated-table(restaurants) is outcome4
  end
end