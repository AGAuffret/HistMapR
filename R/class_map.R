class_map <-
  function(in.raster, colour.table = NULL, errors = 0, exceptions = NULL, plot.raster = TRUE, raster.summary = FALSE, return.raster=FALSE, save.raster = FALSE, out.file = NULL){
    
    require(raster)
    
    # Stop and provide a useful error message if the in.raster object is not found or not a Raster* object or cats/save location aren't specified
    
    if(save.raster == TRUE & is.null(out.file) == TRUE){
      stop("Error: Output file location not specified")
    }
    
    if(any(j <- grep("Raster",class(in.raster)[1])) == FALSE){
      stop("Error: Input is not a valid raster object")
    }
    
    if(is.null(colour.table) == TRUE){
      stop("Error: No colour table specified")
    }
    
    if(!is.null(exceptions) & any(colour.table$cat == exceptions) == FALSE){
      stop("Error: Specified outlier category does not exist in colour table input.")
    }
    
    if(save.raster==TRUE){ if(file.exists(out.file) == TRUE){
      stop("Error: Output file already exists")
    }}
    
    colour.table$newvar <- 1:nrow(colour.table)
    
    reclassified.raster <-raster(in.raster,layer=0) # create new RasterLayer based on the RGB stack, with no values
    values(reclassified.raster)<-0 # create empty value category
    
    # loop through each category, take the threshold values for each band from the colour table & perform the 
    # reclassification.
    for(i in colour.table$newvar){
      reclassified.raster[in.raster$red< colour.table$Rmax[i] + colour.table$Rse[i]*errors & 
                                in.raster$green< colour.table$Gmax[i] + colour.table$Gse[i]*errors & 
                                in.raster$blue< colour.table$Bmax[i] + colour.table$Bse[i]*errors &
                                in.raster$red > colour.table$Rmin[i] - colour.table$Rse[i]*errors & 
                                in.raster$green > colour.table$Gmin[i] - colour.table$Gse[i]*errors & 
                                in.raster$blue > colour.table$Bmin[i] - colour.table$Bse[i]*errors] <- i
    }
    
    
    if(!is.null(exceptions)){
      reclassified.raster[reclassified.raster == 0 & !is.na(in.raster[[1]])] <- which(colour.table$cat == exceptions)
    }
    
    
    # Print map summary if requested
    
    if(raster.summary == TRUE){
      ras.summary<-data.frame(cat=colour.table$cat, pixels=sapply(colour.table$cat,function(x) sum(values(reclassified.raster==which(colour.table$cat==x)))), 
                              area= sapply(colour.table$cat,function(x) sum(values(reclassified.raster==which(colour.table$cat==x)))*res(reclassified.raster)[1]), 
                              fraction=sapply(colour.table$cat,function(x) sum(values(reclassified.raster==which(colour.table$cat==x)))/length(values(reclassified.raster))))
      
      cat("\n Summary table for output raster: \n\n",sep="")
      
      print(ras.summary)
      
    }
    
    
    # Remind user which category is which
    
    cat("\n Raster categories:\n") 
    for(j in colour.table$newvar){
      cat("\n\t", as.character(colour.table$cat[j]), " = ", j, sep = "")
    } 
    cat("\n\n") 
    
    
    # plot if desired
    if(plot.raster == TRUE){
      
      # plot next to original
      
      par(mfrow=c(2,round((nrow(colour.table)+2.1)/2))) # create set of panels according to number of map categories
      par(col.axis="white",col.lab="white",tck=0);plotRGB(in.raster, axes=TRUE, main="orig.raster") # create 'invisible' axes and plot original raster
      
      for(k in colour.table$newvar){
        catlabel <- colour.table$cat[k]
        par(col.axis="white",col.lab="white",tck=0); raster::plot(reclassified.raster==k, axes=TRUE, legend=FALSE, main=paste("Category",catlabel)) # create invisible axes and plot raster categories
      }
      par(col.axis="white",col.lab="white",tck=0); raster::plot(reclassified.raster==0, axes=TRUE, legend=FALSE, main="unclassed") # finally create invisible axes and plot pixels not in a class
      
      
      # reset plotting window
      
      par(mfrow = c(1,1))
      
      
      # Print user guidance  
      
      cat("\n\n If this classification looks inaccurate, we recommend: \n\t [1] Changing the 'error' argument to alter the threshold boundaries (currently +/- ",errors,"* the sampled standard error for each colour band) \n\t [2] Altering the 'exceptions' argument to assign unclassed pixels as a specific category (currently ",exceptions,")\n\t [3] Altering the row order in your colour threshold table (plotting order) \n\t [4] Re-running click_sample \n\t [5] Manually editing the colour table.\n\n",sep="")
      
    }
    
    if(save.raster == TRUE){
      
      writeRaster(reclassified.raster, out.file, "GTiff", datatype="INT1U", overwrite = FALSE)
      
      cat("Map saved to ", out.file, "\n")
    }
    
    if(return.raster == TRUE){
      
      return(reclassified.raster)
    }
  }
