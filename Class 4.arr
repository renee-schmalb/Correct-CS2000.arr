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


fun color-cake-layer(COLOR1 :: String, COLOR2 :: String, COLOR3 :: String) :
  doc: "creates 3 colorful rectangles as a layers of a cake"
  above(rectangle(10, 50, "solid", "yellow"), above(rectangle(150, 40, "solid", COLOR1), above(rectangle(150, 40, "solid", COLOR2), rectangle(150, 40, "solid", COLOR3))))
end


