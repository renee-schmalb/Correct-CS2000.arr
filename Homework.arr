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

