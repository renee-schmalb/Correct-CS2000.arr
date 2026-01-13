use context dcic2024
# Day 4 - Function #

fun three-stripe-flag(TOP, MIDDLE, BOTTOM): above(rectangle(120, 30, "solid", TOP), above(rectangle(120, 30, "solid", MIDDLE), rectangle(120, 30, "solid", BOTTOM)))
end

three-stripe-flag("red", "blue", "orange")
armenia = three-stripe-flag("red", "blue", "orange")

three-stripe-flag("red", "white", "red")
austria = three-stripe-flag("red", "white", "red")