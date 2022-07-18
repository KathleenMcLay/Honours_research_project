# Plot MDS1 (or MDS2) against the chromosome windows. 

# Load libraries 
library(lostruct)
library(doParallel)
library(tools)
library(stringr)

# Load files from directory into list
chrfiles <- list.files(path = "/g/data/ht96/McLay_UQ/Honours/Output/WGS/local_pca/100_D1H1D4H5A3A7", pattern="chr", all.files=FALSE)
extremes <- list.files(path = "/g/data/ht96/McLay_UQ/Honours/Output/WGS/local_pca/100_D1H1D4H5A3A7/extreme_values", all.files=TRUE)

# Select the number of cores to use with doParallel
registerDoParallel(20)

# Loop through the chrfiles , to create a plot for each one
foreach(i=1:length(chrfiles)) %dopar% {
    chr <- read_vcf(paste("/g/data/ht96/McLay_UQ/Honours/Output/WGS/local_pca/100_D1H1D4H5A3A7/", chrfiles[i], sep = ""))
    
    # Loop through the extreme values files, match to the correct mds coordinate file using the chromsome ID from the file names, and read in the correct file 
    for (j in 1:length(extremes)){
        if (str_split(chrfiles[i], "_", n = 2, simplify=TRUE)[1] == str_split(extremes[j], "_", n = 2, simplify=TRUE)[1]) {
            extreme_val <- read.table(paste("/g/data/ht96/McLay_UQ/Honours/Output/WGS/local_pca/100_D1H1D4H5A3A7/extreme_values/", extremes[j], sep = ""))
        }
    }

    eig_win <- eigen_windows(chr, win=100, k=2)
    win_dist <- pc_dist(eig_win, npc=2)
    index <- (1:ncol(win_dist))[!is.na(win_dist[1,])]
    rownames(win_dist) <- index
    colnames(win_dist) <- index
    mds <-cmdscale(win_dist,eig=TRUE, k=2) 
    windows=rownames(win_dist) 
    windows=as.numeric(windows) 
    coordinate1 <- mds$points[,1] #This is for MDS1. For MDS2 select the second index [,2]
    coordinate1=as.matrix(coordinate1) 
    row.names(coordinate1)=rownames(win_dist)
    plot_name <- paste("/g/data/ht96/McLay_UQ/Honours/Output/WGS/local_pca/100_D1H1D4H5A3A7/mds_plots/", tools::file_path_sans_ext(chrfiles[i]), "_MDS1.jpeg", sep = "")
    jpeg(file=plot_name)  
    plot(windows,coordinate1,xlab=paste(str_split(chrfiles[i], "_", n = 2, simplify=TRUE)[1], " Windows", sep = ""), main="MDS1")
    points(c(extreme_val[,3]),coordinate1[as.character(c(extreme_val[,3])),1],col="blue",pch=15)
    points(c(extreme_val[,2]),coordinate1[as.character(c(extreme_val[,2])),1],col="green",pch=17)
    points(c(extreme_val[,1]),coordinate1[as.character(c(extreme_val[,1])),1],col="red",pch=19)
    dev.off()

}