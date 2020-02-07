#' Get stemness score from transcriptome data
#'
#' @import tibble
#' @import dplyr
#' @param expr a dataframe. Rowname is gene symbol id. Colname is sample id.
#' @return a named vector
#' @export
#'
#' @examples rnascore <- getRNAstemness(expr = expr)
getRNAstemness <- function(expr = NULL){
  w <- rnasig
  X <- expr
  X <- expr %>%
    as.data.frame() %>%
    tibble::rownames_to_column(var="gene_id") %>%
    dplyr::filter( gene_id %in% names(w) ) %>%
    tibble::column_to_rownames( "gene_id" ) %>% as.matrix()
  #Reduce the signature to the common set of genes.
  stopifnot( all( rownames(X) %in% names(w)))
  w <- w[ rownames(X)]
  X <- as.matrix(X)
  #Score the Matrix `X` using Spearman correlation.
  s <- apply(X, 2, function(z) {cor( z, w, method="sp", use="complete.obs" )})
  s <- s - min(s)
  s <- s / max(s)
  cat("Print RNA stemness scores")
  s[1:5]
  stm_rna_score <- s
  return(stm_rna_score)
}

#' Get stemness score from DNA methylation data
#'
#' @import dplyr
#' @param expr a dataframe. Rowname is probe id. Colname is sample id.
#'
#' @return a named vector
#' @export
#'
#' @examples dna_score <- getDNAstemness(expr = expr)
getDNAstemness <- function(expr = NULL){
  w <- mm$w
  w[1:5]
  w <- w[ names(w)  %in% rownames(expr)]
  X <- expr[as.character(names(w)),]
  X <- as.matrix(X)
  X[1:5,1:5]
  ss <- t(w) %*% X
  ss[1,1:3]
  ## Scale the scores to be between 0 and 1
  ss <- ss - min(ss)
  ss <- ss / max(ss)
  cat("Print DNA methylation stemness scores")
  ss[1:5]
  stm_dna_score <- ss
  return(stm_dna_score)
}
