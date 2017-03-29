# batch processing of atf files from axoscope  

getwd("")
setwd("")

# building file index 
files <- c()
for (i in dir("axonfiles/atf")) {	
	files = c(files, i) 
}

# setting up plot functions
plot_all <- function() {
par(mfrow=c(3,3))
for (i in files) {
	xy <- read.table(i, sep="\t", skip=10, header=TRUE)
	xy_df <- data.frame(xy[1], xy[2])
	# pdf file muss noch gemacht werden
	plot(xy_df, main="Turgor Pressure in Stylus Cells of Lilium longiflorum", # main sollte per Eingabe einstellbar sein!! 
		 sub=i,  xlab="Time (s)", ylab="Pressure (MPa)", type="l")
}
dev.off()
}
