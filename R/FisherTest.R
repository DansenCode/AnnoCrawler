#' @title Hyperparametric Test
#'
#' @description Hyperparametric test for enrichment analysis that takes as an input  ";" separated identifiers and annotations.
#'
#' @param data
#'
#' @param AnnoCol
#'
#' @param SubSelectionCol
#'
#' @param MinCatSize
#'
#' @return FisherOutDF
#'
#' @export HypPara


#### function to calculate fisher exact test enrichments
HypPara = function(data = NULL, # data frame (wide) with features, subselection and matched categorical annotations
                          AnnoCol = NULL, # Names of columns in "data" that contain annotations
                          SubSelectionCol = NULL, # Name of columns in "data" that contain logical selection or not
                          MinCatSize = NULL # set a value for minimal category size to be considered
){ 
  # check input
  if (!is.data.frame(data)) stop("data must be dataframe")
  if (!is.vector(AnnoCol)) stop("AnnoCol must be vector")
  if (!is.vector(SubSelectionCol) | length(SubSelectionCol)!=1) stop("SubSelectionCol must be vector of length 1")
  if (sum(!(AnnoCol %in% colnames(data))) > 0) stop(paste("following columns not found: ",
                                                          colnames(data)[!(AnnoCol %in% colnames(data))], sep = " "))
  
  #                selection   non selection
  # is feature       One           Two
  # not feature      Three         Four
  # odds of selection being feature
  
  FisherOutDF = data.frame(matrix(data = NA,nrow = 0,ncol = 0))  
  
  ## Loop for counting categories across all annotations
  for(k in AnnoCol){
    # find unique
    Categories = str_split(as.matrix(data[, k]), ";")
    UniqueCategories = unique(unlist(Categories))
    TempDF = data.frame(matrix(data = NA, nrow = length(UniqueCategories), ncol = 0))
    
    # loop 
    for (i in 1 : length(UniqueCategories)){
      FoundCat = unlist(lapply(Categories,function(x){UniqueCategories[i] %in% x}))
      TempDF[i,"Annotation"] = k
      TempDF[i,"Category"] = UniqueCategories[i]
      TempDF[i,"CategorySize"] = sum( FoundCat )
      TempDF[i,"One"] = sum( data[,SubSelectionCol] & FoundCat )  ### is feature and selection
      TempDF[i,"Two"] = sum( !data[,SubSelectionCol] & FoundCat )  ### is feature and non-selection
      TempDF[i,"Three"] = sum( data[,SubSelectionCol] & !FoundCat ) ### not feature and selection
      TempDF[i,"Four"] = sum( !data[,SubSelectionCol] & !FoundCat )  ### not feature and non-selection
    }
    #concatenate dataframe
    FisherOutDF = bind_rows(FisherOutDF,TempDF)
  }
  
  # filter out small categories
  FisherOutDF = FisherOutDF[FisherOutDF$CategorySize > MinCatSize,]
  
  # contingency table loop
  for (i in 1: nrow(FisherOutDF)){
    ContiTable = matrix(data = unlist(FisherOutDF[i,c("One", "Two", "Three", "Four")]),
                        nrow = 2, ncol = 2, byrow = TRUE)
    FisherOut = fisher.test(ContiTable)
    #fill ne tall df with annotation, log ods and p values
    FisherOutDF[i,"pvalue"] = FisherOut$p.value
    FisherOutDF[i,"OddsRatio"] = FisherOut$estimate
    ## PERSEUS style
    IntersectionSize = FisherOutDF[i,"One"]
    TotalSize =  sum(FisherOutDF[i,c("One", "Two", "Three", "Four")])
    SelectionSize = sum(FisherOutDF[i,c("One", "Three")])
    CategorySize = sum(FisherOutDF[i,c("One", "Two")])
    FisherOutDF[i,"Enrichment"] = ((IntersectionSize)*(TotalSize))/((SelectionSize)*(CategorySize))
  }
  
  # adjust p value
  FisherOutDF[,"BH"] = p.adjust(FisherOutDF$pvalue,method = "BH")
  
  # log odds
  FisherOutDF[,"Log2_Odds"] = log2(FisherOutDF$OddsRatio)
  
  #flag infinite odds and set to max value
  FisherOutDF[,"Log2_OddsFinite"] = is.finite(FisherOutDF[,"Log2_Odds"])
  
  # set infinite to maximum, omit if no finite
  DynamicRange = FisherOutDF$Log2_Odds[is.finite(FisherOutDF[,"Log2_Odds"])]
   if(length(DynamicRange) > 0){
    FisherOutDF$Log2_Odds[which(FisherOutDF$Log2_Odds == -Inf)] = min(DynamicRange)
    FisherOutDF$Log2_Odds[which(FisherOutDF$Log2_Odds == Inf)] = max(DynamicRange)
    }
  return(FisherOutDF)
  
}
#########################################################################################
################################
