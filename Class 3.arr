use context dcic2024

CIRCLE1 = circle(50, "solid", "grey")
SQUARE1 = square(60, "solid", "red")
C-AND-S = beside(CIRCLE1, SQUARE1)
S-AND-C = beside(SQUARE1, CIRCLE1)

################################

COLOR = "green"
RECTANGLE1 = rectangle(50, 50, "solid", COLOR)
TRIANGLE1 = triangle(70, "solid", COLOR)

overlay(RECTANGLE1, TRIANGLE1)

###############################

orange-triangle = triangle(35, "solid", "orange")

LENGTH = 70
COLOR2 = "green"
SQUARE2 = square(LENGTH, "solid", COLOR2)
SQUARE3 = square(50, "solid", "green")

COLOR3 = "red"
above(circle(30, "solid", "yellow"), rectangle(60, 80, "solid", COLOR3))

COLOR4 = "blue"
TRIANGLE2 = triangle(35, "solid", COLOR4)
RECTANGLE2 = rectangle(60, 80, "solid", COLOR3)
above(beside(TRIANGLE2, TRIANGLE2), RECTANGLE2)

RECTANGLE3 = rectangle(60, 120, "solid", "blue")
RECTANGLE4 = rectangle(60, 120, "solid", "white")
RECTANGLE5 = rectangle(60, 120, "solid", "red")
beside(RECTANGLE3, beside(RECTANGLE4, RECTANGLE5))
