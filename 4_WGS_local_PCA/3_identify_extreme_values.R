# Runs local PCA and Corners function to identify extreme values
# The distance matrix (win_dist), MDS coordinates (mds_coords) and extreme values(ext_vals) are written to file 
# Using doParallel, the script is run on all 20 chromosome files in parallel 

# Load libraries 
library(lostruct)
library(doParallel)
library(tools)

# Load VCF chromosome files from directory into list, identify only relevant files using chr as a uniqie identifier
files <- list.files(path = "/g/data/ht96/McLay_UQ/Honours/Output/WGS/local_pca/100_D1H1D4H5", pattern="chr", all.files=FALSE, full.names=TRUE)

# Select the number of cores to use with doParallel
registerDoParallel(20)

# For each VCF chromosome file in directory list run local PCA, write the distance matrix, MDS coords to file and run corners and write to file
foreach(i=1:length(files)) %dopar% {
    chr <- read_vcf(files[i])
    eig_win <- eigen_windows(chr, win=100, k=2)
    win_dist <- pc_dist(eig_win, npc=2)
    write.table(win_dist,file=paste(tools::file_path_sans_ext(files[i]), "_windist.txt", sep = ""),sep="\t")
    mds_dat <- cmdscale(win_dist, eig=TRUE, k=2)
    MDS1 <- mds_dat$points[,1]
    MDS2 <- mds_dat$points[,2]  
    mds_coords <- cbind(MDS1,MDS2)
    mds_coords <- as.matrix(mds_coords)
    write.table(mds_coords,file=paste(tools::file_path_sans_ext(files[i]), "_mdscoords.txt", sep = ""),sep="\t")
    ext_val <- corners(mds_coords, prop=0.05, k=3)
    ext_val <- as.matrix(ext.val)
    write.table(ext_val,file=paste(tools::file_path_sans_ext(files[i]), "_extval.txt", sep = ""),sep="\t")
}
