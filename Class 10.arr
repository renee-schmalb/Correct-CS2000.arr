use context dcic2024
include csv
include data-source


#If you dont know the columns, just name one column X and Pyret will show you the proper amount and names
# This function below has a cell in the url w a speling mistake:

# voting-data = load-table:  VoterID, FirstName, LastName, DOB, Party, Address, City, State, Zip, Phone, Email, LastVoted  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/10-voters.csv", default-options) end

# so create a file fixing
voting-data = load-table:
  VoterID,
  FirstName,
  LastName,
  DOB,
  Party,
  Address,
  City,
  State,
  Zip,
  Phone,
  Email,
  LastVoted
  source: csv-table-file("voters.csv", default-options)
end

republicans = filter-with(voting-data, lam(r :: Row) -> Boolean:
  r["Party"] == "Republican" end)

fun blank-to-independent(s :: String) -> String:
  doc: "replaces an empty info on party to independent"
  if s == "":
    "Independent"
  else:
    s
  end
where:
  blank-to-independent("") is "Independent"
  blank-to-independent("blah") is "blah"
end

# The other mistake with the party was the misspealing of "Democrat"
# Some states intials were not capitalized and others were missing. I fixed it by rewriting the states abbreviations and by writing the name of the state based on the registered city. For the zipcodes, I did a similar process, where the ones that were missing a number, I just looked on google for what would be their proper zip code

fun normalize-phone(p :: String) -> String:
  doc: "eliminates parenthesis, hifens, and spaces so phone numbers are just NNNNNNNNNN"
  string-replace("(", "") and string-replace(")", "") and string-replace("-", "") and string-replace(" ", "") 
end