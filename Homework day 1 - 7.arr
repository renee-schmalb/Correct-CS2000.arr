use context dcic2024
# Day 4 - Function # --------------------------------------

fun three-stripe-flag(TOP, MIDDLE, BOTTOM): above(rectangle(120, 30, "solid", TOP), above(rectangle(120, 30, "solid", MIDDLE), rectangle(120, 30, "solid", BOTTOM)))
end

three-stripe-flag("red", "blue", "orange")
armenia = three-stripe-flag("red", "blue", "orange")

three-stripe-flag("red", "white", "red")
austria = three-stripe-flag("red", "white", "red")

### use doc to explain what a function does ##
fun three-stripe-flag2(TOP, MIDDLE, BOTTOM): 
  doc: "produce image of a flag with three horizontal stripes"
  frame(above(rectangle(120, 30, "solid", TOP), 
    above(rectangle(120, 30, "solid", MIDDLE), 
        rectangle(120, 30, "solid", BOTTOM))))
end

fun moon-weight(WEIGHT) :
  doc: "calculates the astronaut's weight on the moon"
  WEIGHT * 1/6
end


# use where to set examples for the fuction #####
fun moon-weight2(WEIGHT) :
  doc: "calculates the astronaut's weight on the moon"
  WEIGHT * 1/6
where: 
  moon-weight2(100) is 100 * 1/6
  moon-weight2(200) is 200 * 1/6
end 


# pratice examples - pen's with brand's name
fun cost-pen-order(AMOUNT, NAME):
  doc: "calculates the cost of ordering X pens by adding the fixed cost (0.25) and 0.02 * amount of letters in the name"
  AMOUNT * (0.25 + (string-length(NAME) * 0.02))
where:
  cost-pen-order(3, "Starbucks") is 3 * (0.25 + (string-length("Starbucks") * 0.02))
  cost-pen-order(5, "Nike") is 5 * (0.25 + (string-length("Nike") * 0.02))
end


# Day 5 - Conditionals, Tests, and spy --------------------

fun shipping-cost(COST-PEN-ORDER :: Number) -> Number :
  doc: "calculates the shipping cost by adding $4 to the total if the pen order is ≤ $10, or by adding $8 to the total if the pen order is ≥ $10"
  if COST-PEN-ORDER <= 10 : 
    COST-PEN-ORDER + 4
  else:
    COST-PEN-ORDER + 8
  end
  where:
shipping-cost(10) is 10 + 4
shipping-cost(3.9) is 3.9 + 4
shipping-cost(10.1) is 10.1 + 8
shipping-cost(20) is 20 + 8
end

  
num-equal(1, 2)
string-equal("cat", "dog")
string-equal("water", "water")
wm = "will.i.am"
string-contains(wm, "will")
string-contains(wm, "Will")
(1 < 2) and (10 < 20)
(1 < 2) and (10 < 0)


fun shipping-cost2(COST-PEN-ORDER :: Number) -> Number :
  doc: "calculates the shipping cost by adding $4 to the total if the pen order is ≤ $10, or by adding $8 to the total if the pen order is ≥ $10, or by adding $14 to the total if the pen order is ≥ $30"
  if COST-PEN-ORDER <= 10 : 
    COST-PEN-ORDER + 4
  else if COST-PEN-ORDER <= 30 :
    COST-PEN-ORDER + 8
  else:
    COST-PEN-ORDER + 12
  end
  where:
  shipping-cost2(10) is 10 + 4
  shipping-cost2(3.9) is 3.9 + 4
  shipping-cost2(10.1) is 10.1 + 8
  shipping-cost2(20) is 20 + 8
  shipping-cost2(30.1) is 30.1 + 12
end


fun shipping-cost3(COST-PEN-ORDER :: Number) -> Number :
  doc: "calculates the shipping cost by adding $4 to the total if the pen order is ≤ $10, or by adding $8 to the total if the pen order is ≥ $10, or by adding $14 to the total if the pen order is ≥ $30"
  if COST-PEN-ORDER <= 10 : 
    COST-PEN-ORDER + 4
  else if (COST-PEN-ORDER >= 10) and (COST-PEN-ORDER <= 30) :
    COST-PEN-ORDER + 8
  else:
    COST-PEN-ORDER + 12
  end
  where:
  shipping-cost3(10) is 10 + 4
  shipping-cost3(3.9) is 3.9 + 4
  shipping-cost3(10.1) is 10.1 + 8
  shipping-cost3(20) is 20 + 8
  shipping-cost3(30.1) is 30.1 + 12
end


#An online-advertising firm needs to determine whether to show an ad for a skateboarding park to website users. Write a function show-ad that takes the age and haircolor of an individual user and returns true if the user is between the ages of 9 and 18 and has either pink or purple hair.

#Try writing this two ways: once with if expressions and once using just boolean operations.


fun show-ad(AGE :: Number, HAIRCOLOR :: String) -> Boolean : 
doc: "confirms if the conditions, age between 9 and 18, and hair color pink or purple, are true to show up an ad to a user"
  if (AGE >= 9) and (AGE <= 18) and ((HAIRCOLOR ==  "purple") or (HAIRCOLOR == "pink")) :
    true
  else:
    false
  end
  where:
  show-ad(9, "purple") is true
  show-ad(20, "pink") is false
  show-ad(16, "brown") is false
  show-ad(30, "yellow") is false
end

# Suppose we want to compute the wages of a worker. The worker is paid $10 for every hour up to the first 40 hours, and is paid $15 for every extra hour. Let's say hours contains the number of hours they work, and suppose it's

fun total-wage(HOURS :: Number) -> Number :
  doc: "calculates the total wage of a worker"
  if (HOURS <= 40) :
    HOURS * 10
  else:
    (10 * 40) + (15 * (HOURS - 40))
  end
where:
  total-wage(40) is 40 * 10
  total-wage(0) is 0 * 10
  total-wage(60) is (10 * 40) + (15 * (60 - 40))
end


shipping-cost3(cost-pen-order(10, "Adidas"))

fun cost-pen-order2(AMOUNT :: Number, MESSAGE :: String) -> Number :
  doc: "calculates the total cost of pen order, where each pen costs $0.25 plus $0.02 per each characther in the engraved message"
  (AMOUNT * 0.25) + (string-length(MESSAGE) * 0.02)
where:
cost-pen-order2(10, "Go Titans!") is (10 * 0.25) + (string-length("Go Titans!") * 0.02)
end


fun ticket-purchase(AMOUNT :: Number, IS-SENIOR :: Boolean) -> Number :
  doc: "calculates the total price of a ticket purchase, where each ticket costs $10, but there is a 15% discount if the buyer is a senior or if they buy more than 5 tickets"
  if IS-SENIOR == true :
  (AMOUNT * 10) * 0.85
  else if (AMOUNT > 5) :
    (AMOUNT * 10) * 0.85
  else:
    (AMOUNT * 10) 
  end
where:
  ticket-purchase(1, true) is (1 * 10) * 0.85
  ticket-purchase(6, false) is  (6 * 10) * 0.85
  ticket-purchase(2, false) is  (2 * 10)
end
  

fun ticket-purchase2(AMOUNT :: Number, IS-SENIOR :: Boolean) -> Number :
  doc: "calculates the total price of a ticket purchase, where each ticket costs $10, but there is a 15% discount if the buyer is a senior or if they buy more than 5 tickets"
  if (IS-SENIOR == true) or (AMOUNT > 5):
  (AMOUNT * 10) * 0.85
  else:
    (AMOUNT * 10) 
  end
where:
  ticket-purchase2(1, true) is (1 * 10) * 0.85
  ticket-purchase2(6, false) is  (6 * 10) * 0.85
  ticket-purchase2(2, false) is  (2 * 10)
end

# Day 6 --------------------------------------------------

table: name, age
  row: "Owen", 17
  row: "Jule", 12
  row: "Renee", 19
end

check: 
  table: name, age
    row: "Owen", 17
    row: "Jule", 12
    row: "Renee", 19
end
  is-not
  table: age, name
    row: 17, "Owen"
    row: 12, "Jules"
    row: "Renee", 19
  end
end

people = table: age, name
  row: "Owen", 17
    row: "Jule", 12
    row: "Renee", 19
end
  
Shuttle = table: month, driver-id
  row: "April", 6767
  row: "October", 6969
  row: "January", 9111
end