use context dcic2024
import lists as L

fun my-sum(num-list :: List<Number>) block:
  doc: "adds all values from a list"
  
  var total = 0
  for each(n from num-list): total := total + n
  end
total
where:
my-sum([list: 0, 1, 2, 3]) is 6
my-sum([list: 2, 2]) is 4
end




fun my-copy-list(num-list :: List<Number>) -> List<Number> block:
  doc: "creates a copy of a given list"
  
      var copy = [list: ]
    for each(n from num-list):
      # copy := copy + n
        copy := L.append(copy, [list: n])
    end
      
  copy  
where:
  my-copy-list([list: 0, 1, 2, 3]) is [list: 0, 1, 2, 3]
  my-copy-list([list: ]) is [list: ]
end


fun my-doubles(num-list :: List<Number>) -> List<Number> block:
  doc: "duplicates each value of a given list"
 
  var outcome = [list: ]
  for each(n from num-list): outcome := outcome + [list: (n * 2)]
  end
 
  outcome

where:
  my-doubles([list: 0, 1, 2, 3]) is [list: 0, 2, 4, 6]
end