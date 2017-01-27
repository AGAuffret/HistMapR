smooth_map <-
function(in.raster, window.size = 25, smooth.function = mean, dark.rm = T, darkValue = 100, pad = T, padValue = NA){
  
  require(raster)
  
  # Stop and provide a useful error message if the orig.raster object is not found or not a Raster* object
  
  if(any(j <- grep("Raster",class(in.raster)[1])) == FALSE){
    stop("Error: Input is not a valid raster object")
  }
  
  # Grab the names from orig.raster for applying to the output raster later
  
  band.names<-names(in.raster)
  
  
  # Create "frame" for cutting away halo effect caused by padding when there are empty rows surrounding the map extent (e.g. when map not "straight")
  
  if(pad == TRUE){
    map.frame<-is.na(in.raster[[1]])
  }
  
  
  # Remove dark text, boundaries etc first by assiging values as NA (if that option is selected by the user) 
  
  if(dark.rm == TRUE){
    in.raster[in.raster[[1]]<darkValue & in.raster[[2]]<darkValue & in.raster[[3]]<darkValue]<-NA
  }
  
  
  # Create an empty raster stack
  ras.smoothed <- stack()
  
  
  # Loop through the bands of the original raster
  for(i in 1:length(names(in.raster))){
    
    # For each, perform the smoothing...
    tempband <- focal(in.raster[[i]],w=matrix(1,window.size,window.size), pad = T, padValue = NA, na.rm=TRUE, fun=smooth.function) 
    
    #... then add to the previously empty raster
    ras.smoothed <- addLayer(ras.smoothed,tempband)
    
  }
  
  
  # Then, use the frame created earlier to assign NA to those pixels outside the mapped area.
  if(pad == TRUE){
    ras.smoothed[map.frame==1]<-NA
  }
  
  # Finally, rename the bands as in the original raster file
  names(ras.smoothed)<-band.names
  
  
  # return the smoothed raster stack object
  return(ras.smoothed)
  
}
