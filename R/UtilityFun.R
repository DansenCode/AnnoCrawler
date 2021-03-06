#' @title Annotation Puller
#'
#' @description IpseLorum
#'
#' @param InputVector
#'
#' @param InputVectorSep
#'
#' @param AnnoID
#'
#' @param AnnoIDSep
#'
#' @param AnnoAnno
#'
#' @param OutputSep
#'
#' @return OutVector
#'
#' @export AnnoPuller2

#########################################################################################
################################
AnnoCount = function(data = NULL,separator = ";"){
  #count annotation
  Vec = unlist(sapply(data,function(x){str_split(x,separator)[[1]]}))
  Count = as.data.frame(table(Vec))  
  Count$Vec = as.character(Count$Vec)
  return(Count)
}
#########################################################################################
################################


#########################################################################################
################################
AnnoPuller2 = function(InputVector = NULL,
                       InputVectorSep = ";",
                       AnnoID = NULL,
                       AnnoIDSep = ";",
                       AnnoAnno = NULL,
                       OutputSep = ";"){
  ## InputVector is a vector of that is supposed to be interogated for matching annotations. multiple ids (e.g. protei groups) should be separeted by ";"
  ## AnnoID is the vector into which the InputVector is matches and should align to the AnnoAnno, multiple annotations should be splitted by;
  ## AnnoAnno is the vector that contains the annotations and should align with AnnoID                                                      
  ## extract all Annotation IDs       
  AnnoUniprot = sapply(AnnoID,function(x){str_split(x,AnnoIDSep)[[1]]})
  
  ## loop through annotations of interest
  OutVector = c()
  for(i in 1: length(InputVector)) {
    
    ## find index
    ProtGroup = str_split(InputVector[i],InputVectorSep)[[1]]
    AnnoIndex = unlist(lapply(AnnoUniprot,function(x){sum(x %in% ProtGroup) > 0}))
    
    ## pull all annotations & make unique
    ## making it unique is important since some proteins in a protein group have exactly the same annotations
    UniqueAnno = paste(unique(AnnoAnno[AnnoIndex]),collapse=OutputSep)
    
    ## concatenate                    
    OutVector = c(OutVector,UniqueAnno)
  }
  return(OutVector)
}   
#########################################################################################
################################
