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

# 4 #
# Convert from degrees to radiants
POINT-A-LAT = 42.3505 = ~0.7391556648658585 radius
POINT-A-LON = -71.1054 = ~-1.2410233459475761 radius

POINT-B-LAT = 42.3430 = ~0.739024765171959 radius
POINT-B-LON = -71.1020 = ~-1.2409640047530082 radius

fun point-degree(COORDINATE :: Number) -> Number :
(COORDINATE * PI) / 180
end