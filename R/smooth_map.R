smooth_map <-
  function(in.raster, window.size = 25, smooth.function = mean, dark.rm = TRUE, darkValue = 100, clip.frame = FALSE){
    
    require(terra)
    
    # Stop and provide a useful error message if the orig.raster object is not found or not a SpatRaster object
    
    if(!class(in.raster)[1] == "SpatRaster"){
      stop("Error: Input must be a SpatRaster object")
    }
    
    if(any(names(in.raster) != c("red", "green", "blue"))){
      stop("Error: Bands incorrectly named - please rename and if necessary reorder to 'red', 'green' and 'blue'")
    }
    
    # Create "frame" for cutting away edges that smooth into non-mapped areas
    if(clip.frame == TRUE){map.frame <- in.raster[[1]]==0 | in.raster[[2]]==0 | in.raster[[3]]==0}
    
    # Remove dark text, boundaries etc first by assigning values as NA (if that option is selected by the user) 
    if(dark.rm == TRUE){
    dark.cells <- which(values(in.raster[[1]])<darkValue & values(in.raster[[2]])<darkValue & values(in.raster[[3]]<darkValue))
    values(in.raster)[dark.cells] <- NA
    }
    
    # Smooth the bands of the original raster
    in.raster <- sapp(in.raster, function(x, ...) focal(x, w=window.size, na.rm=TRUE, fun=smooth.function))
    set.names(in.raster, c("red","green","blue"))
    
    # Use the frame created earlier to assign NA to those pixels outside the mapped area.
    if(clip.frame == TRUE){set.values(in.raster, which(values(map.frame)==1), NA)}
    
    # return the smoothed raster stack object
    return(in.raster)
    
  }
