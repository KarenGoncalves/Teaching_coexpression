#### Calculate minimum expression threshold
#### Install and load packages ####
#### All packages should be installed already if "prepare_environment.R" was run

pkgs = c("tidyverse", 
         "CustomSelection")

sapply(pkgs, \(curPkg) library(curPkg, character.only = T) )

tpm_matrix <- read_delim("INPUTS/tpm_matrix.tsv")
Exp_table <- tpm_matrix %>%
  data.frame(row.names = tpm_matrix$gene_ID) %>%
  dplyr::select(!gene_ID)

metadata <- read_delim("INPUTS/metadata.txt", 
                       col_names = T) |>
  dplyr::select(SampleName, replicateName)

#### run DAFS ####
cutv = DAFS(tpm = Exp_table)

data.frame(Replicates = names(cutv),
           thresholds = cutv) %>%
  write.table(file = "INPUTS/cutv.tsv",
              append = F, quote = F, sep = "\t", 
              row.names = F, col.names = T)
