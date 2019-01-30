# library
library(stringr)
library(tm)
library(wordcloud)
library(tidyverse)

text <- 'Fully furnished ready to move-In 2bhk in a 3 storeyed private apartment located in ulloor bahsi nagar,kochulloor. Residential locality.Karunya residence association
Accessibility-450 m to nh47, 2 kms to byepass and very proximate to medical college,kims hospital and other educational institutions.5 kms to technopark campus.
Occupied only for 2 years and very well maintained. No wall sharing with two covered balconies. Borewell and corporation water connection'

corpus <- VCorpus(VectorSource(text))
corpus <- tm_map(corpus, removeWords, stopwords())
corpus <- tm_map(corpus, stripWhitespace)
wordcloud(corpus, min.freq = 25, random.order = FALSE, colors = "red")


str_to_lower(text)
str_view(x, "an")
str_view(x, ".a.")
str_detect(x, "e")
ptrn_rNb <- '[1-9]bhk'

^ to match the start of the string.
$ to match the end of the string.

\d: matches any digit.
\s: matches any whitespace (e.g. space, tab, newline).
[abc]: matches a, b, or c.
[^abc]: matches anything except a, b, or c.

You can also specify the number of matches precisely:
  
{n}: exactly n
{n,}: n or more
{,m}: at most m
{n,m}: between n and m

df <- tibble(
  word = words, 
  i = seq_along(word)
)

has_room <- str_subset(text, ptrn_rNb)
str_match(text, ptrn_rNb)
matches <- str_extract_all(has_room, ptrn_rNb)
head(matches)
