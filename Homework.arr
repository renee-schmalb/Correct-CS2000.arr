use context dcic2024
# Day 4 - Function # -------------------------------------------

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
