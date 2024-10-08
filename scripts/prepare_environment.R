# Prepare environment by creating right folders
options(repos=c("https://packagemanager.rstudio.com/all/__linux__/focal/latest",
                "https://cloud.r-project.org/"))

folders = c("INPUTS", "plots", "results", "rdata", "scripts")

for (folder in folders) dir.create(folder)

# then download the necessary packages 

pkgs=c("devtools", "tidyverse", "igraph", "ggraph",
       "readxl", "patchwork", "RColorBrewer",
       "viridis", "parallel", "doParallel",
       "furrr", "future", "svglite", "BiocManager"
)

install.packages(pkgs)

BiocManager::install(c("DESeq2", "GenomicFeatures"))

# CustomSelection has to be installed from github, so it cannot be grouped with the others yet
if (! "CustomSelection" %in% installed.packages() ) {
  devtools::install_github("KarenGoncalves/CustomSelection")
}