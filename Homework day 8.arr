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
fun race2 = table: month, riders
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