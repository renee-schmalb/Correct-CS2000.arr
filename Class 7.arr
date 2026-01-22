use context dcic2024
include csv
include data-source


Workout = table: DATE :: String, ACTIVITY :: String, DURATION :: Number
  row: "Jan 4, 2026", "Running", 40
  row: "Jan 5, 2026", "Yoga", 60
  row: "Jan 6, 2026", "Cycling", 30
end

# -------------------------------------------------------

check: 
  table: DATE :: String, ACTIVITY :: String, DURATION :: Number
  row: "Jan 4, 2026", "Running", 40
  row: "Jan 5, 2026", "Yoga", 60
  row: "Jan 6, 2026", "Cycling", 30
end
  is-not
   table: DATE :: String, ACTIVITY :: String, DURATION :: Number
  row: "Jan 4, 2026", "Running", 40
  row: "Jan 5, 2026", "Yoga", 60
    row: "Jan 10, 2026", "Swimming", 70
end
end

Workout.row-n(2)

#--------------------------------------------------------

recipes = load-table:
  title :: String,
  servings :: Number,
  prep-time :: Number
  source: csv-table-url("https://pdi.run/f25-2000-recipes.csv", default-options)
  sanitize servings using num-sanitizer
  sanitize prep-time using num-sanitizer
end

#use "sanitize" to change a string to a number
# inlcude csv so it works with the CSV document --> always on the top
# include data-source so it modifies the CSV document --> always on the top


recipes.row-n(1)
recipes-row-1 = recipes.row-n(1)


gas-consumption = load-table:
  code :: String,
  area :: String,
  year :: String, 
  domestic_consumers_sales_GWh :: String, 
  domestic_consumers_number_of_consumers :: String, 
  commercial_and_industrial_consumers_sales_GWh :: String,	
  commercial_and_industrial_consumers_number_of_consumers :: String, 
  all_consumers_sales_GWh	:: String, 
  all_consumers_number_of_consumers :: String, 
  sales_per_consumer_domestic_kWh :: String, 
  sales_per_consumer_commercial_and_industrial_kWh :: String,
  empty :: String
  source: csv-table-url("https://data.london.gov.uk/download/29jo0/2c12ee88-7405-4444-a4cb-c20eade33326/gas-consumption.csv", default-options)
end

