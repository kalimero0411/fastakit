args = as.list(base::commandArgs(trailingOnly = TRUE))
names(args) = c("wd","lengths","split","verbose")
args[["lengths"]] = normalizePath(args[["lengths"]])
setwd(args[["wd"]])
args[["split"]] = as.numeric(args[["split"]])
proteome = read.table(file = args[["lengths"]],header = FALSE,sep = "\t",col.names = c("Protein","length"))
proteome_vec = proteome$length
names(proteome_vec) = proteome$Protein
split_balanced <- function(vec, prot_split) {
  # 1. Sort vector in descending order
  vec <- sort(vec, decreasing = TRUE)
  
  # 2. Initialize groups and their current sums
  group_vals <- replicate(prot_split, numeric(0), simplify = FALSE)
  group_prots <- replicate(prot_split, numeric(0), simplify = FALSE)
  sums <- rep(0, prot_split)
  
  # 3. Assign each number to the group with the smallest current sum
  for (prot in names(vec)) {
    if(args[["verbose"]] == "1"){
      cat("Splitting sequences: ",format(round(100*(which(names(vec) %in% prot)/length(vec)),digits = 2),nsmall = 0),"%  \r",sep = "")
    }
    val = vec[prot]
    min_idx <- which.min(sums)
    group_vals[[min_idx]] <- c(group_vals[[min_idx]], val)
    sums[min_idx] <- sums[min_idx] + val
    group_prots[[min_idx]] <- c(group_prots[[min_idx]], prot)
  }
  
  return(list(group_vals = group_vals,group_prots = group_prots, sums = sums))
}

proteome_list = split_balanced(vec = proteome_vec,prot_split = args[["split"]])
invisible(lapply(1:length(proteome_list$group_prots),function(x){
  write.table(file = paste0("balanced_chunk_",x,".fasta"),
              x = proteome_list$group_prots[x],
              quote = FALSE,
              sep = "\t",
              row.names = FALSE,
              col.names = FALSE)
  }))
