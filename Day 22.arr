use context dcic2024
data River:
  | merge(width :: Number, left :: River, right :: River)
  | stream(flow-rate :: Number)
end

fun total-flow(r :: River) -> Number:
  doc: "computes the total flow of the given river"
  cases (River) r:
    | merge(width, left, right) => total-flow(left) + total-flow(right)
    | stream(flow) => flow
  end
where:
  stream-a = stream(5) 
  stream-b = stream(8) 
  stream-c = stream(3)  
  merge-1 = merge(12, stream-a, stream-b) 
  main-river = merge(15, merge-1, stream-c)  
  
  total-flow(stream-a) is 5
  total-flow(merge-1) is 13
  total-flow(main-river) is 16
end

fun count-merges(r :: River) -> Number: 
  doc: "counts the number of merges in the given river"
  cases (River) r:
    | merge(width, left, right) => 1 + count-merges(left) + count-merges(right)
    |  stream(flow) => 0
where: 
  count-merges(main-river) is 2
  count-merges(stream-a) is 0
end
  
# Design a function count-streams that counts how many individual streams feed into a river network.
    fun count-streams(r :: River) -> Number:
      doc: "counts how many streams feed into a river"
      cases (River) r:
        | merge(width, left, right) => 1 + count-streams(left) + count-streams(right)
        | stream(flow) => 0
where: 
          count-streams(main-river) is 2
          count-streams(stream-a) is 0
end
          
  
  
  









data AncTree:
  | nodata
  | person(name :: String, year-of-birth :: Number, parent1 :: AncTree, parent2 :: AncTree)
end

    # where: 
    # nd = nodata
    # carla = person("Carla", 1999, nd, 
  
    #   fun at-fun(t :: AncTree) ->:
    # cases (AncTree) t:
    # | nodata =>
    # | person(name, year-of-birth, parent1, parent2) => 
    #   ...n.... 
    #   ...d...
    #   at-fun(parent1) ...
    #   at-fun(parent2) ...
    # end
    

