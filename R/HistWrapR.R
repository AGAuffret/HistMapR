HistWrapR <- function(ras.file, colour.table=NULL, out.format="save", out.dir=".", ...){
	
	if(file.exists(ras.file)==FALSE){
      stop("Error: Raster file does not exist")
    }
	
    if(is.null(colour.table) == TRUE){
      stop("Error: No colour table specified")
    }

	dots <- list(...) # make list of additional arguments
	
	## Bring in raster and set names
	in.ras <- rast(ras.file)
	set.names(in.ras, c("red","green","blue"))
	
	## Smooth map
	smooth.args <- formals(smooth_map) # default smooth map arguments
	smooth.args$in.raster <- in.ras # assign raster to first argument
	smooth.dots <- dots[names(dots) %in% names(smooth.args)] # identify any non-default arguments specified
	smooth.args[match(names(smooth.dots), names(smooth.args))] <- smooth.dots # replace defaults with those

	in.ras.smo <- do.call(smooth_map, smooth.args) # smooth the map
	
	## Class map
	class.args <- formals(class_map) # default arguments
	class.args$in.raster <- in.ras.smo # assign smoothed raster to first argument
	class.args$plot.raster <- FALSE # don't want to plot the raster
	class.args$colour.table <- colour.table
	class.dots <- dots[names(dots) %in% names(class.args)] # identify any non-default arguments specified
	class.args[match(names(class.dots), names(class.args))] <- class.dots # replace defaults with those

	if(out.format=="return"){
	class.args$return.raster <- TRUE
	in.ras.cla <- do.call(class_map, class.args)
	return(in.ras.cla)}
			
	if(out.format=="save"){
	class.args$save.raster <- TRUE
	class.args$out.file <- paste0(out.dir,"/",ras.file)
	do.call(class_map, class.args)	
	}
	}
