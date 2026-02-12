use context dcic2024
import lists as L

discount-codes = [list: "NEWYEAR", "student", "NONE", "student", "VIP", "none"]

unique-codes = L.distinct(discount-codes)

upper-codes = L.map(string-to-upper, unique-codes)

num-unique-codes = L.length(upper-codes)

fun is-real-code(code :: String) -> Boolean:
  not(string-to-lower(code) == "none")
end

real-codes = L.filter(is-real-code, unique-codes)

lower-codes = L.map(string-to-lower, real-codes)


fun product(num-list :: List<Number>) -> Number:
  doc: "Multiplies all numbers in a list together"
  block:
  var result = 1
  for each(n from num-list):
    result := result * n
  end
  result
  end
where:
  product([list: 5, 2]) is 10
  product([list: 2, 1]) is 2
  product([list: 3, 3]) is 9
end

