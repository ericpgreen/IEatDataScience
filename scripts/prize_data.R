# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# This script creates a data set of NAs and prize data.
# Students are given the index that contains a prize,
# if they invert the rows and columns, they get a WHAMMY!
# code by: Amy Finnegan
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


# prize data
prizes <-
  data.frame(matrix(NA,
                       nrow=100,
                       ncol=100))

# hid prizes

# prize 1 - weird kit kat
  prizes[2,6] <- "weird kit kat"
  prizes[6,2] <- "WHAMMY!"


# prize 2 - firm handshake
  prizes[75,89] <- "firm handshake"
  prizes[89,75] <- "WHAMMY!"
  
  
# prize 3 - "free questions all day"
  prizes[80,15] <- "free questions all day"
  prizes[15,80] <- "WHAMMY!"
  
# save data
  write.csv(prizes, "data/prizes.csv")
  