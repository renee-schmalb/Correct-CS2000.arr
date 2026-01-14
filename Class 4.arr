use context dcic2024

fun greeting(NAME) :
  doc: "welcomes the student (name) to the class"
  "Hello, " + NAME + "!! Welcome to CS2000!"
where: 
  greeting(JOE) is "Hello, " + "Joe" + "!! Welcome to CS2000!"
  greeting(SALLY) is "Hello, " + "Sally" + "!! Welcome to CS2000!"
end
