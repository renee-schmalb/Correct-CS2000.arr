use context dcic2024
data NumList:
  | nl-empty
  | nl-link(first :: Number, rest :: NumList)
end

nl-0 = nl-empty
nl-1 = nl-link(3, nl-empty)
nl-2 = nl-link(7, nl-link(3, nl-empty))
nl-3 = nl-link(2, nl-link(7, nl-link(3, nl-empty))) 
# Or, alternatively:
nl-2b = nl-link(7, nl-1)
nl-3b = nl-link(2, nl-2b)
check:
  nl-2b is nl-2
  nl-3b is nl-3
end

# when defining functions over NumLists, writing a series of examples leads us to a general pattern (or template) of a solution

# fun num-list-fun(nl :: NumList) -> ???:
#   cases (NumList) nl:
#      | nl-empty => ...
#      | nl-link(first, rest) => 
#         ... first ...
#         ... numlist-fun(rest) ...
#      end
# end

fun count-all-sevens(nl :: NumList) -> Number:
  doc: "tell us how many 7s are in a list"
  cases (NumList) nl:
    | nl-empty => 0
    | nl-link(first, rest) => 
      if first == 7:
        1 + count-all-sevens(rest)
      else:
        count-all-sevens(rest)
      end
  end
where: 
  count-all-sevens(nl-3) is 1
  count-all-sevens(nl-2b) is 1
end


# Use the design recipe to write a function total-sum that takes a NumList, and returns the sum of all the numbers in it. The sum of the empty list is 0. Use the template to start when you get to the code step.

fun total-sum(nl :: NumList) -> Number:
  doc: "Sums all numbers in a given list"
  cases (NumList) nl:
    | nl-empty => 0
    | nl-link(first, rest) => first + total-sum(rest)
  end
where:
  total-sum(nl-3) is 12
  total-sum(nl-2) is 10
  total-sum(nl-1) is 3
end

# Use the design recipe to write a function contains-n that takes a NumList and a Number, and returns whether that number is in the NumList. Use the template to start when you get to the code step.

fun contains-n(nl :: NumList, n :: Number) -> Boolean:
  doc: "verifies if a given list contains a given number"
  cases (NumList) nl:
    | nl-empty => false
    | nl-link(first, rest) => 
      if (first == n) or (rest == n):
        true
      else:
        false
      end
  end
where: 
  contains-n(nl-0, 2) is false
  contains-n(nl-1, 3) is true
  contains-n(nl-2, 7) is true
end

  