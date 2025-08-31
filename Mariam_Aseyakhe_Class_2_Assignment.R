
classify_gene <- function(logFC, padj) {
  if (logFC > 1 & padj < 0.05){
    return("Upregulated")
  } else if (logFC < -1 & padj < 0.05){
    return("Downregulated")
  } else {
    return("Not_Significant")
  }
}

# Define input and output folders
input_dir <- "Raw_data"
output_dir <- "Results"

if(!dir.exists(output_dir)){
  dir.create(output_dir)
}

# List which files I'll process
 files_to_process <- c("DEGs_Data_1.csv", "DEGs_Data_2.csv")
 
 
 Result_List <- list()
 
 for(file_name in files_to_process) {
   cat("\nProcessing:", file_name, "\n")
 }

# import dataset
  data <- read.csv(file.path(input_dir, file_name), header = TRUE)

# Checking data type
data$logFC <- as.numeric(data$logFC)
data$padj <- as.numeric(data$padj)

# Handling missing values
data$padj[is.na(data$padj)] <- 1

# Create a status column
data$status <- mapply(classify_gene, data$logFC, data$padj)

# Save results in results folder
Result_List[[file_name]] <- data

output_file_path <- file.path(output_dir, paste0("DEGs_Results", file_name))
write.csv(data, output_file_path, row.names = FALSE)
cat("Resultes saved to:", output_file_path, "\n")


results_1 <- Result_List[["DEGs_Data_1.csv"]]
results_2 <- Result_List[["DEGs_Data_2.csv"]]

save.image(file = "Mariam_Aseyakhe_Class_2_Assignment.RData")

