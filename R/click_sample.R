click_sample <-
function(in.raster, cats = NULL, npoints = 10, print.values = F, type = "p", plot.cols = T, ...){
  
  require(raster)
  
  # Stop and provide a useful error message if the orig.raster object is not found or not a Raster* object or cats isn't specified
  
  if(any(j <- grep("Raster",class(in.raster)[1])) == FALSE){
    stop("Error: Input is not a valid raster object")
  }
  
  if(is.null(cats) == TRUE){
    stop("Error: Categories not specified")
  }
  
  if(any(names(in.raster) != c("red", "green", "blue"))){
    stop("Error: Bands incorrectly named - please rename and if necessary reorder to 'red', 'green' and 'blue'")
  }
  
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
  # first generate the sample table
  
  # Make sure the plotting window is ok
  par(mfrow = c(1,1))
  
  # create an empty dataframe to insert values into
  vals <- data.frame()
  
  # Loop through the categories
  for(i in cats){
    
    # tell the user to be patient
    cat("\nOpening plot window, please wait... \n")
    
    # plot the raster
    plotRGB(in.raster,1,2,3)
    
    # print user instruction
    cat("Click on ", npoints, " areas of class ", i,  "\n",sep = "")
    
    clickvals <- data.frame(click(in.raster, n = npoints, show = print.values, type = type))
    
    # insert an identifier for the category being sampled
    clickvals$category <- i
    
    # inform user that this category is now finished
    cat("Category ", i, " sampling complete\n\n")
    
    # append to output dataframe
    vals <- rbind(vals, clickvals)
    
    # Close the plot window so that the user does not mistakenly register a click for the wrong category
    dev.off()
  }
  
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
  # second generate the summary of the sampled points
  
  # create a new dataframe to take the output values
  thresh2 <- data.frame(matrix(ncol = 13, nrow = length(cats))) 
  
  # name the columns
  colnames(thresh2) <- c("cat", "Rmax", "Rmean", "Rmin", "Rsd", "Gmax", "Gmean", "Gmin", "Gsd", "Bmax", "Bmean", "Bmin", "Bsd")
  
  # loop through the categories
  for(i in cats){
    
    # read in the subset of the sample table that corresponds to the category i
    workdat <- subset(vals, subset = (category == i))
    
    # extract the max, mean, min and sd for each band within the sample
    
    thresh2[match(i, cats),] <- c(i, 
                                  max(workdat$red),
                                  mean(workdat$red),
                                  min(workdat$red),
                                  sd(workdat$red),
                                  max(workdat$green),
                                  mean(workdat$green),
                                  min(workdat$green),
                                  sd(workdat$green),
                                  max(workdat$blue),
                                  mean(workdat$blue),
                                  min(workdat$blue),
                                  sd(workdat$blue))
  }
  
  # make numeric
  thresh2[,c(2:13)] <- as.numeric(as.character(unlist(thresh2[,c(2:13)])))
  
  
  # calculate the standard error for each band
  thresh2$Rse <- thresh2$Rsd/sqrt(npoints)
  thresh2$Gse <- thresh2$Gsd/sqrt(npoints)
  thresh2$Bse <- thresh2$Bsd/sqrt(npoints)
  
  
  
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
  # Finally, if requested, generate the plot of the sampled points
  
  if(plot.cols == T){
    
    colplot <- plot_colour_table(thresh2, ...)
    
  }else{
    print("Plot not drawn")
    
    colplot <- "Plot not drawn"
  }
  
  # return the desired output
  return(list(sample.table = vals,colour.summary = thresh2, colour.plot = colplot))
}
