# Create MDS plot with coloured points for extreme values

#load libraries 
library(lostruct)
library(doParallel)
library(tools)
library(stringr)

# Load MDS coordinates files and extreme value files from directories into lists
mdsfiles <- list.files(path = "/g/data/ht96/McLay_UQ/Honours/Output/WGS/local_pca/100_D1H1D4H5/mds_coords", pattern="mdscoords", all.files=FALSE)
extremes <- list.files(path = "/g/data/ht96/McLay_UQ/Honours/Output/WGS/local_pca/100_D1H1D4H5/extreme_values", all.files=TRUE)

# Select the number of cores to use with doParallel
registerDoParallel(20)

# Loop through the mds coordinate files for each chromosome, to create a plot for each one
foreach(i=1:length(mdsfiles)) %dopar% {
    mds_dat <- read.table(paste("/g/data/ht96/McLay_UQ/Honours/Output/WGS/local_pca/100_D1H1D4H5/mds_coords/", mdsfiles[i], sep = ""))

    # Loop through the extreme values files, match to the correct mds coordinate file using the chromsome ID from the file names, and read in the correct file 
    for (j in 1:length(extremes)){
        if (str_split(mdsfiles[i], "_", n = 2, simplify=TRUE)[1] == str_split(extremes[j], "_", n = 2, simplify=TRUE)[1]) {
            extreme_val <- read.table(paste("/g/data/ht96/McLay_UQ/Honours/Output/WGS/local_pca/100_D1H1D4H5/extreme_values/", extremes[j], sep = ""))
        }
    } 

    mds_dat <- as.matrix(mds_dat)
    plot_name <- paste("/g/data/ht96/McLay_UQ/Honours/Output/WGS/local_pca/100_D1H1D4H5/mds_plots/", tools::file_path_sans_ext(mdsfiles[i]), "_MDS.jpeg", sep = "")
    jpeg(file=plot_name)
    plot(mds_dat, xlab=paste(str_split(mdsfiles[i], "_", n = 2, simplify=TRUE)[1], " Coordinate 1", sep = ""), ylab="Coordinate 2")
    points(mds_dat[as.character(c(extreme_val[,3])),1], mds_dat[as.character(c(extreme_val[,3])),2], col="blue",pch=15) 
    points(mds_dat[as.character(c(extreme_val[,2])),1], mds_dat[as.character(c(extreme_val[,2])),2], col="green",pch=17)
    points(mds_dat[as.character(c(extreme_val[,1])),1], mds_dat[as.character(c(extreme_val[,1])),2], col="red",pch=19)
    dev.off()

}