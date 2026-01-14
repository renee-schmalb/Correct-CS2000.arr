use context dcic2024

fun greeting(NAME :: String) -> String:
  doc: "creates a greeting to welcome student to the class"
  "Hello, " + NAME + "!! Welcome to CS2000!"
  where: 
  greeting("Joe") is "Hello, " + ("Joe") + "!! Welcome to CS2000!"
  greeting("Bob") is "Hello, " + ("Bob") + "!! Welcome to CS2000!"
end

# Design Recipe for Functions
# 1º Step: create a function signature:
#             function name + argument names + type                       annotations + return type
#2º Step: create a docstring to explain what the function             does


fun area-rectangle(WIDTH :: Number, HEIGHT :: Number) -> Number : 
  doc: "computes area of a rectangle"
  WIDTH * HEIGHT
where:
  area-rectangle(10, 40) is 400
  area-rectangle(5, 2) is 10
end


fun three-layer-cake(COLOR1 :: String, COLOR2 :: String, COLOR3 :: String) -> Image:
  doc: "takes each color to create 3 colorful layers for a cake with a caddle on top"
  above(rectangle(10, 50, "solid", "yellow"), above(rectangle(150, 40, "solid", COLOR1), above(rectangle(150, 40, "solid", COLOR2), rectangle(150, 40, "solid", COLOR3))))
where: 
  three-layer-cake("blue", "white", "pink") is above(rectangle(10, 50, "solid", "yellow"), above(rectangle(150, 40, "solid", "blue"), above(rectangle(150, 40, "solid", "white"), rectangle(150, 40, "solid", "pink"))))
end

fun cost-personalized-tshirt(SENTENCE :: String) -> Number : 
  doc: "takes amount of letters in sentence to calculate the cost of a personalized tshirt"
  5 + (string-length(SENTENCE) * 0.10)
where:
  cost-personalized-tshirt("Go Team!") is 5 + (string-length("Go Team!") * 0.10)
  cost-personalized-tshirt("Hello World") is 5 + (string-length("Hello World") * 0.10)
end



