use context dcic2024

data Book:
    book(title :: String, author :: String, pages :: Number)
end

intro-computing = book("A Data Introduction to Computing", "Fisler, et al.", 200)

the-dispossed = book("The Dispossessed", "Ursula", 287)

intro-computing.title
the-dispossed.pages

data Podcast:
    podcast(title :: String, episode :: Number, channel :: String, participants :: String, legth :: Number)
end

the-daily = podcast("Can AI already do your job", 16, "The New York Times", "Joe B" , 30)