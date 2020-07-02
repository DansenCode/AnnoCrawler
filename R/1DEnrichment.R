#' @title 1D Annoation Enrichment
#'
#' @description 1D Annoation Enrichment function that takes as an input  ";" separated identifiers and annotations.
#'
#' @param OneDeAnnotationDF
#'
#' @param quantities
#'
#' @return DataOut
#'
#' @export ODE

#########################################################################################
################################
#### function to calculate 1 D annotation enrichment
ODE = function(OneDeAnnotationDF = NULL,
                            quantities = NULL){
  # OneDeAnnotationDF: dataframe to work on.
  # quantities: column thatprovides quantifications
  # performes 1D annotation enrichment according to Cox et al. NAs are not considered a category but are counted in "Rest"
  # accepts now also multiple entries per element if separated by ";"
  DataOut = as.data.frame(matrix(data = NA,nrow = 0,ncol = 0))
  OneDeAnnotationDF = as.data.frame(OneDeAnnotationDF)
  r = 0
  
  for(k in colnames(OneDeAnnotationDF)[colnames(OneDeAnnotationDF)!=quantities]){
    categories = unique(unlist(sapply(OneDeAnnotationDF[,k],function(x){str_split(x,";")})))
    categories = categories[!is.na(categories)]
    categories = categories[!categories == ""] ## all unique annotaions in a given category
    
    AnnoList = lapply(OneDeAnnotationDF[,k],function(x){str_split(x,";",simplify = FALSE)[[1]]}) ## all unique and redundant annotaions in a given category
    # loop per column
    for(i in categories){
      Rest = sapply(AnnoList, function(x){sum(x %in% i) == 0 })
      SelectedCategory = sapply(AnnoList, function(x){sum(x %in% i) > 0 })
      
      x = OneDeAnnotationDF[SelectedCategory,quantities]
      y = OneDeAnnotationDF[Rest,quantities]
      
      r = r + 1
      if((length(x) > 0 ) & (length(y) > 0)) {
      ## wilcox test and output
      wilcox.out = wilcox.test(x = x,y = y, alternative = "two.sided")
      
      PvOut = wilcox.out$p.value
      DeltaMeanOut = mean(x,na.rm = TRUE) - mean(y,na.rm = TRUE) ## difference of means (selection non selection)
      DeltaMedianOut = median(x,na.rm = TRUE) - median(y,na.rm = TRUE) ## difference of medians (selection non selection)
      SeleMeanOut = mean(x,na.rm = TRUE) ## mean selection
      SeleMedianOut = median(x,na.rm = TRUE)  ## median selection
      
      
      ## calculate score according to cox et al
      R1 = mean(rank(OneDeAnnotationDF[,quantities])[SelectedCategory]) # average ranks within the group under consideration
      R2 = mean(rank(OneDeAnnotationDF[,quantities])[Rest]) # average ranks of all remaining proteins in the experiment
      n = nrow(OneDeAnnotationDF) # is the total number of data points
      
      ScoreOut = 2 * (( R1 - R2 ) / (n))
      
      ## update DF
      DataOut[r,"Column"] = k
      DataOut[r,"Category"] = i
      DataOut[r,"pvals"] = PvOut
      DataOut[r,"DeltaMean"] = DeltaMeanOut
      DataOut[r,"DeltaMedian"] = DeltaMedianOut
      DataOut[r,"SeleMean"] = SeleMeanOut
      DataOut[r,"SeleMedian"] = SeleMedianOut
      DataOut[r,"scores"] = ScoreOut
      DataOut[r,"SelectionSize"] = sum(SelectedCategory)
      
      }
      
    }
  }
  # adjust p value
  
  DataOut[,"BH"] = p.adjust(DataOut$pvals,method = "BH")
  
  return(DataOut)
}
#########################################################################################
################################
