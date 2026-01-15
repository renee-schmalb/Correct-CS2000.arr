use context dcic2024
# Design Recipe for Functions:
#1. create a function signature
#2. 




fun choose-hat(TEMP-IN-F :: Number) -> String :
  doc: "Tells user to wear a sun hat when the temperature is at least 80F"
  if (TEMP-IN-F >= 80) :
    "Wear sun hat"
  else:
    "Do not wear sun hat"
  end
where:
  choose-hat(90) is "Wear sun hat"
  choose-hat(80) is "Wear sun hat"
  choose-hat(70) is "Do not wear sun hat"
end
  

fun decide-skill-assessment(LEC-NUM :: Number) -> String :
  doc: "Decided if user is ready to skill 1 assessment based on lecture number"
  if (LEC-NUM >= 5):
    "Ready"
  else:
    "Not ready"
  end
    where:
    decide-skill-assessment(3) is "Not ready"
    decide-skill-assessment(5) is "Ready"
    decide-skill-assessment(6) is "Ready"
  end

"Hello""
