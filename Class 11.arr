use context dcic2024
include csv
include data-source

employees =
  table: full-name :: String, department :: String
    row: "Jordan Smith", "Sales"
    row: "Alexandra Lee", "Engineering"
    row: "Sam", "Marketing"
    row: "Alice Ng", "Operations"
  end

# You want to have in your data, in addition to "full name", columns for given name (or first name) and family name (or last name).

fun name-separation(r :: Row) -> List:
  doc:"separates the first and family name"
  string-split(r["full-name"], " ")
where:
  name-separation(employees.row-n(0)) is [list: "Jordan", "Smith"] 
  name-separation(employees.row-n(1)) is [list: "Alexandra", "Lee"]
  name-separation(employees.row-n(3)) is [list: "Alice", "Ng"]
end


fun first-name(r :: Row) -> String:
  separated = (string-split(r["full-name"], " ")
  separated.get(0)
end


fun last-name(r :: Row) -> String:
  name-list = string-split(r["NAME"], " ")
  name-list.get(1)
end



fun family-name(r :: Row) -> String:
  doc:"gives only the family name"
   separated = (string-split(r["full-name"], " ")
   separated.get(1)
end

updated1 = build-column(employees, "first-name", first-name)
updated2 =  build-column(updated1, "family-name", family-name)
updated2
