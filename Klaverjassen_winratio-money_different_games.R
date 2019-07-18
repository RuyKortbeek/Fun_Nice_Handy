### Script to find out in what game mode to play best in the Dutch card-game Klaverjassen!!
### It is a totally free game, no real money is involved ;) 

# Create functions for the different game modes, depending on the amount of tokens that can
# be lost/won depending on the outcome of the game
{
game200 = function(game) {
  win = (game * ((280*a) - (200*(1-a)))+2000)
  return(win)
}

game500 = function(game) {
  win = (game * ((800*a) - (500*(1-a)))+2000)
  return(win)
}
  

game1000 = function(game) {
  win = (game * ((1500*a) - (1000*(1-a)))+2000)
  return(win)
}
}

a= 0.5 # set your current win/loose ratio
x= c(1:50) # set the amount of games to simulate

# Plot the evolution of your tokens!
{  
plot(x, game200(x),
       main="win:loose Ratio = 0.5",
       ylab="Money earned",
      xlab = "Games played",
       type="l",
       col="blue") 
lines(x,game500(x), col="red")
lines(x, game1000(x), col = "green")
legend("top", 
       c("Game 200","Game 500", "Game 1000"),
       fill=c("blue","red", "green"))
}

# What game-mode to play depends on your win-lose ratio (e.g. how good you are)
# plot win:loose ratio's against profits in different game modes and see what fits you best

b = seq(0.1,1, by = 0.01) #set win:lose ratio
c = 50 #number of games you play

{
game200_p = function(b) {
  win = (c* ((280*b) - (200*(1-b))))
  return(win)}

game500_p = function(b) {
  win = (c * ((800*b) - (500*(1-b))))
  return(win)}

game1000_p = function(b) {
  win = (c * ((1500*b) - (1000*(1-b))))
  return(win)}
}

#Plot the ratio's versus profits made after 50 games
plot(b, game200_p(b),
     main="Profits to win/lose ratio's in different game settings",
     ylab="Profits after 100 games",
     xlab = "winst:verlies ratio",
     type="l",
     col="blue")
lines(b,game500_p(b), col="red")
lines(b, game1000_p(b), col = "green")
legend("top", 
       c("Game 200","Game 500", "Game 1000"),
       fill=c("blue","red", "green"))
abline(h=0, col = "black", lwd = 1, lty= 20)


