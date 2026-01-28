use context dcic2024
  items = table: item :: String, x-coordinate :: Number, y-coordinate :: Number
    row: "Sword of Dawn",           23,  -87
    row: "Healing Potion",         -45,   12
    row: "Dragon Shield",           78,  -56
    row: "Magic Staff",             -9,   64
    row: "Elixir of Strength",      51,  -33
    row: "Cloak of Invisibility",  -66,    5
    row: "Ring of Fire",            38,  -92
    row: "Boots of Swiftness",     -17,   49
    row: "Amulet of Protection",    82,  -74
    row: "Orb of Wisdom",          -29,  -21
  end


fun calculate-distance(r :: Row) -> Number:
  doc: "calculates the distance from the user's position (0,0) to the item's x- and y-coordinates"
  num-sqrt(num-sqr(r["x-coordinate"]) + num-sqr(r["y-coordinate"]))
where: 
  calculate-distance(items.row-n(0)) is-roughly  num-sqrt(num-sqr(23) + num-sqr(-87))
end

# caculate a new column by having:
# 1º, the name of the table it should be looking
# 2º, the name the user wants to give to the column
# 3º, the fuction the user wants to use for the calculations
##### IT OPERATES WITH THE ENTIRE ROW ####
items-with-distance = build-column(items, "distance", calculate-distance)


fun subtract-1(n :: Number) -> Number:
  doc: "subtracts 1 from input"
  n - 1
where:
  subtract-1(10) is 9
end

# B
items-with-new-distance = transform-column(items, "x-coordinate", subtract-1)


# Imagine all the items were pulled closer to the player by scaling both the x and y coordinates down by 10% (this doesn't make the distance 10% less, but is simpler). Create a new table that has new x & y coordinates for all the items.

fun new-scale-x(r :: Row) -> Number:
  doc: "calculates the new x-coordinate for all items after they were scaled up by 10%"
  r["x-coordinate"] * 0.9
where:
  new-scale-x(items.row-n(0)) is 23 * 0.9
  new-scale-x(items.row-n(1)) is -45 * 0.9
  new-scale-x(items.row-n(2)) is 78 * 0.9
end

fun new-scale-y(r :: Row) -> Number:
  doc: "calculates the new y-coordinate for all items after they were scaled up by 10%"
  r["y-coordinate"] * 0.9
where:
  new-scale-y(items.row-n(0)) is -87 * 0.9
  new-scale-y(items.row-n(1)) is 12 * 0.9
  new-scale-y(items.row-n(2)) is -56 * 0.9
end
 

new-x-coordinate = build-column(items, "scaled-down-x-coordinate", new-scale-x)
new-y-coordinate = build-column(new-x-coordinate, "scaled-down-y-coordinate", new-scale-y)

  
  
# Extract the name of the item that is closest to the player. Note that if you want to order-by, you need to convert it to an ExactNum with num-to-rational.


# You want to "obfuscate" the list of items, displaying, rather than the name, a string that is a sequence of "X"s of the same length. i.e., "Sword of Dawn" becomes "XXXXXXXXXXXXX". Create a new table that is so transformed.
