smooth_map <-
  function(in.raster, window.size = 25, smooth.function = mean, dark.rm = TRUE, darkValue = 100, clip.frame = FALSE, frame.type = "black"){
    
    require(terra)
    
    # Stop and provide a useful error message if the orig.raster object is not found or not a SpatRaster object
    
    if(!class(in.raster)[1] == "SpatRaster"){
      stop("Error: Input must be a SpatRaster object")
    }
    
    if(any(names(in.raster) != c("red", "green", "blue"))){
      stop("Error: Bands incorrectly named - please rename and if necessary reorder to 'red', 'green' and 'blue'")
    }
    
    if(clip.frame == TRUE & !frame.type %in% c("black", "na")){
      stop("Error: frame.type must be either 'black', or 'na'")
    }
    
    # Identify pixels for "frame" for cutting away edges that smooth into non-mapped areas
    # Black frame
    if(clip.frame == TRUE & frame.type == "black"){frame.cells <- which(values(in.raster[[1]])==0 & values(in.raster[[2]])==0 & values(in.raster[[3]])==0)}
    # NA frame
    if(clip.frame == TRUE & frame.type == "na"){which(is.na(values(in.raster[[1]])))}
    
    # Remove dark text, boundaries etc first by assigning values as NA (if that option is selected by the user) 
    if(dark.rm == TRUE){
    dark.cells <- which(values(in.raster[[1]])<darkValue & values(in.raster[[2]])<darkValue & values(in.raster[[3]]<darkValue))
    values(in.raster)[dark.cells] <- NA
    }
    
    # Smooth the bands of the original raster
    in.raster <- sapp(in.raster, function(x, ...) focal(x, w=window.size, na.rm=TRUE, fun=smooth.function))
    set.names(in.raster, c("red","green","blue"))
    
    # Use the frame created earlier to assign NA to those pixels outside the mapped area.
    if(clip.frame == TRUE){values(in.raster)[frame.cells] <- NA}
    
    # return the smoothed raster stack object
    return(in.raster)
    
  }
