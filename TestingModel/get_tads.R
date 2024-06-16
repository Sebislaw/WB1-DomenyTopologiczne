library("SpectralTAD")
library(data.table)
library(ggplot2)
library(reshape2)

get_tads_csv <- function(txt_file_path, resolution, tads_file_path, min_size, window) {
    hic_matrix <- fread(txt_file_path, header = FALSE)
    tads <- SpectralTAD(hic_matrix, resolution = resolution, chr = 11, levels=1, qual_filter = TRUE, min_size = min_size, window_size = window)
    print(tads)
    tads_df <- as.data.frame(tads)
    write.csv(tads_df, file = tads_file_path, row.names = FALSE)
}

# Parse command line arguments
args <- commandArgs(trailingOnly = TRUE)
txt_file_path <- args[1]
resolution <- as.numeric(args[2])
tads_file_path <- args[3]
min_size <- as.numeric(args[4])
window <- as.numeric(args[5])

# Call the function with arguments
get_tads_csv(txt_file_path, resolution, tads_file_path, min_size, window)