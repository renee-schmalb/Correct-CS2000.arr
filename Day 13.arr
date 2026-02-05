use context dcic2024
include csv
include data-source
import math as M
import statistics as S

cafe-data = table:
  DAY :: String,
  DRINKS-SOLD :: Number
  row: "Monday", 45
  row: "Tuesday", 30
  row: "Wednesday", 55
  row: "Thursday", 40
  row: "Friday", 60
end

sales = cafe-data.get-column("DRINKS-SOLD")

M.max(sales)
S.mean(sales)
M.sum(sales)

sample-list = [list: 10, 20, 30]
empty-list = [list: ]



quiz-scores = table: 
  student :: String, 
  quiz1 :: Number, 
  quiz2 :: Number,
  quiz3 :: Number
    row: "Alice", 85, 92, 78
    row: "Bob", 90, 88, 95
    row: "Charlie", 78, 85, 82
    row: "Diana", 95, 90, 88
  end

# Extract each quiz column and calculate the class average for each quiz using S.mean. Which quiz had the highest average?

quiz1-score = quiz-scores.get-column("quiz1")
S.mean(quiz1-score)

quiz2-score = quiz-scores.get-column("quiz2")
S.mean(quiz2-score)

quiz3-score = quiz-scores.get-column("quiz3")
S.mean(quiz3-score)


check: (S.mean(quiz2-score) > S.mean(quiz1-score)) and (S.mean(quiz1-score) > S.mean(quiz3-score)) is true end
# The highest average is from the quiz 2
