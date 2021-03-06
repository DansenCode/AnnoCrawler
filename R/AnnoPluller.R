#' @title AnnoPuller
#'
#' @description Allows to match annotations to dataframe
#'
#' @param InputVector
#'
#' @param AnnoID
#'
#' @param AnnoAnno
#'
#' @return OutVector
#'
#' @export AnnoPuller

#########################################################################################
################################
AnnoPuller = function(InputVector = NULL,
                       AnnoID = NULL,
                       AnnoAnno = NULL){
  ## InputVector is a vector of that is supposed to be interogated for matching annotations. multiple ids (e.g. protei groups) should be separeted by ";"
  ## AnnoID is the vector into which the InputVector is matches and should align to the AnnoAnno, multiple annotations should be splitted by;
  ## AnnoAnno is the vector that contains the annotations and should align with AnnoID                                                      
  ## extract all Annotation IDs       
  AnnoUniprot = sapply(AnnoID,function(x){str_split(x,";")[[1]]})
  
  ## loop through annotations of interest
  OutVector = c()
  for(i in 1: length(InputVector)) {
    
    ## find index
    ProtGroup = str_split(InputVector[i],";")[[1]]
    AnnoIndex = unlist(lapply(AnnoUniprot,function(x){sum(x %in% ProtGroup) > 0}))
    
    ## pull all annotations & make unique
    ## making it unique is important since some proteins in a protein group have exactly the same annotations
    UniqueAnno = paste(unique(AnnoAnno[AnnoIndex]),collapse=";")
    
    ## concatenate                    
    OutVector = c(OutVector,UniqueAnno)
  }
  return(OutVector)
}   
#########################################################################################
################################
