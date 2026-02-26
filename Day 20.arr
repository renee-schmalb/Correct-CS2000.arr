use context dcic2024

# fun add-till-zero(l :: List<Number>) -> Number:
#  0
#where:
#  add-till-zero([list: 7, 3, 0, 5]) is 7 + 3 + 0
#  add-till-zero([list:    3, 0, 5]) is     3 + 0
#  add-till-zero([list:       0, 5]) is         0
#  add-till-zero([list:])            is 0
#end



#fun add-till-zero2(l :: List<Number>) -> Number:
#  0
#where:
#  add-till-zero2([list: 7, 3, 0, 5]) is 7 + add-till-zero2([list: 3, 0, 5])
#  add-till-zero2([list:    3, 0, 5]) is     3 + add-till-zero2([list: 0, 5])
#  add-till-zero2([list:       0, 5]) is         0
#  add-till-zero2([list:])            is 0
#end



#fun add-till-zero3(l :: List<Number>) -> Number:
# 0
#where:
#  add-till-zero3([list: 7, 3, 0, 5]) is 
# [list: 7, 3, 0, 5].first + add-till-zero3([list: 7, 3, 0, 5].rest)
  
#  add-till-zero3([list:    3, 0, 5]) is     
#  [list: 3, 0, 5].first + add-till-zero3([list: 3, 0, 5].rest)
  
#  add-till-zero3([list:       0, 5]) is 0
#  add-till-zero3([list:])            is 0
#end



fun add-till-zero4(l :: List<Number>) -> Number:
  cases (List) l:
    | empty      => 0 
    | link(f, r) => 
      if f == 0:
        0
      else:
        f + add-till-zero4(r)
      end
    end
where:
  add-till-zero4([list: 7, 3, 0, 5]) is 
  [list: 7, 3, 0, 5].first + add-till-zero4([list: 7, 3, 0, 5].rest)
  add-till-zero4([list:    3, 0, 5]) is     
  [list: 3, 0, 5].first + add-till-zero4([list: 3, 0, 5].rest)
  add-till-zero4([list:       0, 5]) is 0
  add-till-zero4([list:])            is 0
end

fun add-till-zero5(l :: List<Number>) -> Number block: 
  doc: "sums all numbers until zero"
  
  var total = 0
  for each (num from l):
    if ([list: ]): total = 0
      else: total := L.fold-while(add-till-zero5, lam((num): num <> 0) end)
    end
  end
    total
end
