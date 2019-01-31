# http://www.mjdenny.com/Text_Processing_In_R.html

# Text Processing in R
# Text mining features in R
# Clustering technique used to find out duplicates in IAZI

# library
library(stringr)
library(tm)
library(wordcloud)
library(tidyverse)

# Introduction
# Data mining has to do with the discovery of useful, valid, unexpected, and understandable knowledge from data.
# One of the most important distinguishing issues in data mining is size.

text <- 'Fully furnished ready to move-In 2bhk in a 3 storeyed private apartment located in ulloor bahsi nagar,kochulloor(best##$//). Residential locality.Karunya residence association
Accessibility-450 m to nh47, 2 kms to byepass and very proximate to medical college,kims hospital and other educational institutions.5 kms to technopark campus.
Occupied only for 2 years and very well maintained. No wall sharing with two covered balconies. Borewell and corporation water connection'

ptrn_rNb <- '[1-9]bhk'

corpus <- VCorpus(VectorSource(text))
corpus <- tm_map(text, removeWords, stopwords())
corpus <- tm_map(corpus, stripWhitespace)
wordcloud(corpus, min.freq = 25, random.order = FALSE, colors = "red")

# String Processing
## Using stringr package
# In this section we present some of the availabe functions that rely on regular expression.

# View HTML Rendering Of Regular Expression Match
str_view(text, "an") # shows first match
str_view_all(text, "an") # shows all the matches 

# To extract the first/all instances of a match between the regukar expression and the string.
str_extract(text, ptrn_rNb) # extract the first matching instace to a regular expression
str_extract_all(text, ptrn_rNb) # extract all of the matches

# To find the position of pattern match
str_locate(text, "an")
str_locate_all(text, "an")

str_replace(text, "\\)", "") # To replace first pattern match
str_split(text, ptrn_rNb) # Splits string at pattern

str_count(text, "an") # count number of pattern occurrences in string

# One way to deal with messy text data is agrep() function
agrep('a', text)
# agrep provides approximate matching via the Levenshtein distance. This function calculates the number of insertions, deletions 
# and substitutions necessary to transform one string into another. Specifying a cutoff, we can provide a criterion on whether a pattern should be considered as
# present in a string.

# gutenbergr
library(gutenbergr)
hg <- gutenberg_download(c(35,36,523,159))
tdy <- text %>% 
  unnest_(word, text)








str_to_lower(text)
str_view(x, "an")
str_view(x, ".a.")
str_detect(x, "e")
ptrn_rNb <- '[1-9]bhk'
str_extract_all(text,"[0-9]+", simplify = TRUE)


# ^ to match the start of the string.
# $ to match the end of the string.
# 
# \d: matches any digit.
# \s: matches any whitespace (e.g. space, tab, newline).
# [abc]: matches a, b, or c.
# [^abc]: matches anything except a, b, or c.
# 
# You can also specify the number of matches precisely:
#   
# {n}: exactly n
# {n,}: n or more
# {,m}: at most m
# {n,m}: between n and m


library(SnowballC)
mydata <- tm_map(as.factor(text), stemDocument)
writeLines(text)
#create a term matrix and store it as dtm
dtm <- TermDocumentMatrix(text)

freq <- colSums(as.matrix(dtm))
length(freq)
ord <- order(freq,decreasing=TRUE)
freq[head(ord)]

findFreqTerms(dtmr,lowfreq=80)

findAssocs(dtmr,”project”,0.6)
