use context dcic2024
race = table: month, riders
  row: "January", 1770
  row: "March", 961
  row: "May", 1230
  row: "July", 843
  row: "September", 1000
end

fun thousands-race(r :: Row) -> Boolean :
  doc: "verifies if a row has a a thousand riders or more"
  r["riders"] >= 1000
where:
  thousands-race(race.row-n(0)) is true
  thousands-race(race.row-n(1)) is false
  thousands-race(race.row-n(4)) is true
end

# Practice ---------------------------------------------

# Verifies if the month is Jan, March, or July
fun month-check-race(m :: Row) -> Boolean :
  doc: "verifies if the month of a row is Jan, March, or July"
  if m["month"] == "January" :
    true
  else if m["month"] == "March" :
    true
  else if m["month"] == "July" :
    true
  else: false
  end
where: 
  month-check-race(race.row-n(0)) is true
  month-check-race(race.row-n(2)) is false
  month-check-race(race.row-n(3)) is true
end

#Verifies if the month was in the winter season and if there was less than 1000 riders"
race2 = table: month, riders
    row: "January", 956
    row: "Febuary", 931
    row: "March", 867
    row: "April", 980
    row: "May", 1160
    row: "June", 1245
    row: "July", 1379
    row: "August", 1395
    row: "September", 1221
    row: "October", 1170
    row: "November", 1053
    row: "December", 1023
end

fun season-thousands-race(m :: Row, r :: Row) -> Boolean :
  doc: "verifies if the race was in the winter and if there was at least 1000 riders"
  if ((m["month"] == ("January")) or (m["month"] == ("Febuary")) or (m["month"] == ("November")) or (m["month"] == ("December"))) and (r["riders"] >= 1000) :
    true
  else:
    false
  end
where:
  season-thousands-race(race2.row-n(0), race2.row-n(0)) is false
  season-thousands-race(race2.row-n(4), race2.row-n(4)) is false
  season-thousands-race(race2.row-n(10), race2.row-n(10)) is true
end


fun below-1k(r:: Row) -> Boolean:
  doc: "Determines whether a row has less than 1000 riders"
  r["riders"] < 1000
where:
  below-1k(race2.row-n(0)) is true
  below-1k(race2.row-n(1)) is true
  below-1k(race2.row-n(5)) is false
end



filter-with(race2, below-1k)

order-by(race2, "riders", true)
order-by(race2, "riders", false)
# true = increasing order
# false = decreasing order

order-by(race2, "riders", true).row-n(0)["month"]
# Tells you what is the very first row given the order estabilished

# ------------------------------------------------------------------------
fun total-wage-multiplication(r :: Row) -> Number: 
  r["hourly-wage"] * r["hours-worked"]
end


Employees = table: name, hourly-wage, hours-worked
  row: "Harley", 15, 40
  row: "Obi", 20, 45
  row: "Anjali", 18, 39
  row: "Miyako", 18, 42
end

build-column(Employees, "total-wage", total-wage-multiplication)

fun new-hourly-wage(WAGE :: Number) -> Number:
doc: "raises the wage of those making under $20/hr by 10%"
  if WAGE < 20: 
  WAGE * 1.1
else:
  WAGE
end
where:
new-hourly-wage(19) is 19 * 1.1 
new-hourly-wage(20) is 20
new-hourly-wage(30) is 30
end


fun New-employees-table(t :: Table) -> Table:
  doc: "gives the new hourly wages, where the wages that previously were $20/hr, now have been raised by 10%"
  transform-column(t, "hourly-wage", new-hourly-wage)
end

New-employees-table(Employees)



# Day 10 -------------------------------------------------
wages-test =
  table: hourly-wage
    row: 16
    row: 17
    row: 20
    row: 23
    row: 30
  end

Employees-working-40hr = add-row(add-row(Employees.empty(), Employees.row-n(0)), Employees.row-n(3))


class-trip = table: 
  GRADE :: String,
  NUMBER-OF-STUDENTS :: Number
  row: "FRESHMEN", 40
  row: "SOPHOMORE", 27
  row: "JUNIORS", 36
  row: "SENIORS", 45
  row: "PG", 15
end

fun classfication-class-trip(r :: Row) -> String:
  doc: "classifies how large is the grade groups going to the trip"
  if r["NUMBER-OF-STUDENTS"] <= 25:
    "small"
  else if r["NUMBER-OF-STUDENTS"] >= 40:
    "large"
  else:
    "medium"
  end
where:
  classfication-class-trip(class-trip.row-n(0)) is "large"
  classfication-class-trip(class-trip.row-n(1)) is "medium"
  classfication-class-trip(class-trip.row-n(4)) is "small"
end

classified-trip = build-column(class-trip, "group size", classfication-class-trip)

classified-trip


# Day 11 -------------------------------------------------

names = table:
  NAME :: String
  row: "Renee Schmalb"
  row: "Ximena Perez"
  row: "Rachel Schmalb"
  row: "Gemma Lasko"
  row: "Beatriz Sanchez"
end


fun separation(r :: Row) -> List: 
  doc: "separates the first and the last names"
  string-split(r["NAME"], " ")
where:
  separation(names.row-n(0)) is [list: "Renee", "Schmalb"]
  separation(names.row-n(1)) is [list: "Ximena", "Perez"] 
end


fun first-name(r :: Row) -> String:
  name-list = string-split(r["NAME"], " ")
  name-list.get(0)
end

fun last-name(r :: Row) -> String:
  name-list = string-split(r["NAME"], " ")
  name-list.get(1)
end

updated1 = build-column(names, "FIRST NAME", first-name)
updated2 = build-column(updated1, "LAST NAME", last-name)

updated2
 
# Day 12 -------------------------------------------------