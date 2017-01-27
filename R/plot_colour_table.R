plot_colour_table <-
function(colour.table, errors = 0){
  
  require(ggplot)
  require(gridExtra)
  
  # convert the colour vectors to something ggplot can handle. A vector for mean colours, max and min. Each record is a different category
  coloursmean <- c()
  for(i in 1:nrow(colour.table)){
    coloursmean[i] <- rgb(colour.table[i,3], colour.table[i,7], colour.table[i,11], maxColorValue = 255)
  }
  
  coloursmin <- c()
  for(i in 1:nrow(colour.table)){
    coloursmin[i] <- rgb(pmin((colour.table[i,2] + colour.table[i,13]*errors), 255),
                         pmin((colour.table[i,6]+ colour.table[i,14]*errors), 255), 
                         pmin((colour.table[i,10]+ colour.table[i,15]*errors), 255), 
                         maxColorValue = 255)
  }
  
  coloursmax <- c()
  for(i in 1:nrow(colour.table)){
    coloursmax[i] <- rgb(pmax(colour.table[i,4]- colour.table[i,13]*errors, 0),
                         pmax(colour.table[i,8]- colour.table[i,14]*errors, 0), 
                         pmax(colour.table[i,12]- colour.table[i,15]*errors, 0), 
                         maxColorValue = 255)
  }
  
  
  plotdat <- data.frame(x = colour.table$cat, y = rep(1, nrow(colour.table)))
  
  # and plot the figure
  colplot <- grid.arrange(
    ggplot(plotdat, aes(x =x)) + geom_bar(fill = coloursmax) + theme_classic() + scale_y_continuous(breaks=NULL)+ scale_x_discrete(breaks=NULL)+ ylab("Min Colour")+ theme(axis.title.x = element_blank()),
    ggplot(plotdat, aes(x =x)) + geom_bar(fill = coloursmean) + theme_classic()+ scale_y_continuous(breaks=NULL)+ scale_x_discrete(breaks=NULL)+ ylab("Mean Colour")+ theme(axis.title.x = element_blank()),
    ggplot(plotdat, aes(x =x)) + geom_bar(fill = coloursmin) + theme_classic()+ scale_y_continuous(breaks=NULL)+ scale_x_discrete(breaks=NULL) + ylab("Max Colour")+ theme(axis.title.x = element_blank())
  )
  
  colplot
  
  cat("\n Colour range shown is +/-",errors,"* the sampled standard error for each colour band \n ")
  
  # return the desired output
  return(colplot)
}
