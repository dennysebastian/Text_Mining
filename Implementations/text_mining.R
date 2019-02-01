# library
library(stringr)
library(dplyr)
library(tm)
library(wordcloud)

# Load data
load("C:/Users/sebastian.IAZI/Desktop/Presentation/propertyData.RData", verbose = T)

propertyData %>% nrow

text <- propertyData$info

corpus <- VCorpus(VectorSource(text))
corpus <- tm_map(corpus, removeWords, stopwords('english'))
corpus <- tm_map(corpus, removeWords, the)
corpus <- tm_map(corpus, stripWhitespace)

wordcloud(corpus, min.freq = 25, random.order = FALSE, colors = "red")

# Prepsrstion om dats
text <- gsub("\\(|\\)", "", text) # removing brackets from the text
text <- gsub(" ", "", text) # removing whitespaces from text

## specifying patterns for roomNb
ptrn_rNb <- '[1-9]bhk|[1-9]bedroom'

writeLines(ptrn_rNb)

# extracting values

# gregexpr(pattern, text, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
# regexec(ptrn, text, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
# as.numeric(str_extract_all(text, "[0-9]+"))

pos_len <- gregexpr(ptrn_rNb, text, ignore.case = T)
extract_len <- sapply(pos_len, attr, "match.length")
num_matched <- lengths(extract_len)
str_postn <- unlist(pos_len)
end_postn <- str_postn + unlist(extract_len) - 1 
xtracted <- 
  substr(rep(text, num_matched), str_postn, end_postn)# %>% 
  # tolower %>% 
  # stringr::str_replace_all(., c("bhk" ="")) 

Extracted <- 
  relist(unlist(xtracted), pos_len) %>%
  plyr::ldply(rbind)

names(Extracted) <- paste0("roomNb", seq_len(ncol(Extracted)))  

## specifying patterns for area
ptrn_area <- '[1-9][1-9][1-9][1-9]sq.Ft|[1-9][1-9][1-9]sq.Ft|[1-9][1-9]sq.Ft'

pos_len <- gregexpr(ptrn_area, text, ignore.case = T)
extract_len <- sapply(pos_len, attr, "match.length")
num_matched <- lengths(extract_len)
str_postn <- unlist(pos_len)
end_postn <- str_postn + unlist(extract_len) - 1 
xtracted <- 
  substr(rep(text, num_matched), str_postn, end_postn)# %>% 
# tolower %>% 
# stringr::str_replace_all(., c("bhk" ="")) 

Extracted <- 
  relist(unlist(xtracted), pos_len) %>%
  plyr::ldply(rbind)

names(Extracted) <- paste0("area", seq_len(ncol(Extracted)))  
Extracted %>% View


######
stopwords_regex = paste(stopwords('en'), collapse = '\\b|\\b')
stopwords_regex = paste0('\\b', stopwords_regex, '\\b')
documents = stringr::str_replace_all(documents, stopwords_regex, '')

