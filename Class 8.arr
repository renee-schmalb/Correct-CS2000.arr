use context dcic2024
include csv
include data-source

orders = table: TIME :: String, AMOUNT :: Number
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end

# Let's say we want to find orders that are "high-value" (e.g., amount >= 8).

high-value = table: TIME :: String, AMOUNT :: Number
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "16:45", 7.95 
end

# Better is to design a function that checks if an order is high-value, and then use a table operation, filter-with, to create a new table that contains only rows that satisfy the function.

fun check-high-values(r :: Row) -> Boolean:
  doc: "Verifies if the amount is high, meaning at least 5"
  if r["AMOUNT"] >= 5:
    true
  else:
    false
  end
where:
  check-high-values(orders.row-n(0)) is true
  check-high-values(orders.row-n(1)) is true
  check-high-values(orders.row-n(4)) is false
end

filter-with(orders, check-high-values)

table-high-values = filter-with(orders, check-high-values)

check: 
  table-high-values is high-value
end

order-by(orders, "AMOUNT", false)

  
# Design a function is-morning that checks if the "time" column in a row represents a morning. Note that < works for strings, using "lexicographic" (i.e., character by character) ordering. Now produce a new table that is only morning orders.

Clock = table:
  TIME :: Number
  row: 1
  row: 2
  row: 3
  row: 4
  row: 5
  row: 6
  row: 7
  row: 8
  row: 9
  row: 10
  row: 11
  row: 12
  row: 13
  row: 14
  row: 15
  row: 16
  row: 17
  row: 18
  row: 19
  row: 20
  row: 21
  row: 22
  row: 23
  row: 24
end
    
fun is-morning(r :: Row) -> Boolean:
  doc: "Tells the user which times in the clock table are in the morning"
  if (r["TIME"] >= 5) and (r["TIME"] <= 11):
    true
  else:
    false
  end
where:
  is-morning(Clock.row-n(4)) is true
  is-morning(Clock.row-n(5)) is true
  is-morning(Clock.row-n(12)) is false
end

Morning-time = filter-with(Clock, is-morning)


# Create a table where the orders are sorted by time from latest to earliest, rather than how the original table is sorted. Use order-by, rather than constructing it by hand.
order-by(Morning-time, "TIME", false)

# Write code to extract the amount of the latest morning order.
order-by(Morning-time, "TIME", false).row-n(0)




# Load the data from the following url (see notes from yesterday for review): https://pdi.run/f25-2000-photos.csv

Trip = table:
  Location :: String, 
  Subject :: String,
  Date :: String
  row: "Cairo, Egypt", "Portrait", "2023-08-15"
  row: "London, UK", "Mountain", "2024-09-14"
  row: "Rome, Italy", "Food", "2021-10-14"
  row: "Yellowstone National Park, WY", "Concert", "2024-05-31"
  row: "Tokyo, Japan"," Food", "2024-01-16"
  row: "Machu Picchu, Peru", "Festival", "2022-08-03"
  row: "London, UK", "City-Skyline", "2021-11-01"
  row: "Rome, Italy", "Forest", "2024-12-06"
  row: "Cape Town, South Africa", "Festival", "2021-07-25"
  row: "Tokyo, Japan", "Street-Art", "2024-06-18"
  row: "Rome, Italy", "Food", "2021-09-17"
  row: "Paris, France", "Wedding", "2022-03-06"
  row: "San Francisco, CA", "Forest", "2021-09-19"
  row: "San Francisco, CA", "Festival", "2023-12-28"
  row: "New York, NY", "Portrait", "2023-05-23"
  row: "Los Angeles, CA", "Mountain", "2022-09-06"
  row: "Tokyo, Japan", "Sunset", "2022-11-18"
  row: "Machu Picchu, Peru", "Wedding", "2023-03-22"
  row: "Paris, France", "Festival", "2022-02-12"
  row: "Sydney, Australia", "Mountain", "2022-01-04"
  row: "Los Angeles, CA", "Forest", "2023-02-27"
  row: "Paris, France", "Portrait", "2022-10-13"
  row: "Cape Town, South Africa", "Birthday-Party", "2025-04-20"
  row: "Machu Picchu, Peru", "Architecture", "2022-03-02"
  row: "Los Angeles, CA", "Wildlife", "2023-04-09"
  row: "New York, NY", "Forest", "2022-06-30"
  row: "Berlin, Germany", "Architecture", "2024-12-17"
  row: "New York, NY", "Sunset", "2024-08-20"
  row: "Berlin, Germany", "Festival", "2021-04-30"
  row: "Tokyo, Japan", "Forest", "2022-03-22"
end

# Now filter rows that have the subject "Forest" to create a new table.
fun is-forest(r :: Row) -> Boolean:
  if r["Subject"] == "Forest":
    true
  else:
    false
  end
end

# Order the resulting new table by date, and extract the location from the most recent row.
Trip-forest = filter-with(Trip, is-forest)

order-by(Trip-forest, "Date", false)

order-by(Trip-forest, "Date", false).row-n(0)

