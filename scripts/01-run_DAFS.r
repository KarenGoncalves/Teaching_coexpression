#### Calculate minimum expression threshold
#### Install and load packages ####
#### All packages should be installed already if "prepare_environment.R" was run

pkgs = c("tidyverse", 
         "CustomSelection")

sapply(pkgs, \(curPkg) library(curPkg, character.only = T) )

#### run DAFS ####
tpm_matrix <- read_delim("INPUTS/tpm_matrix.tsv")
Exp_table <- tpm_matrix %>%
  data.frame(row.names = tpm_matrix$gene_ID) %>%
  dplyr::select(!gene_ID)
