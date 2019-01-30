library(rvest)
library('dplyr')

#load("C:/Users/sebastian.IAZI/Desktop/Presentation/propertyData.RData", verbose = T)



#Specifying the url for desired website to be scrapped
url <- 'https://www.99acres.com/search/property/buy/residential-apartments/ulloor-trivandrum?search_type=QS&search_location=SH&lstAcn=SEARCH&lstAcnId=8547467128919871&src=CLUSTER&preference=S&city=138&res_com=R&property_type=1&locality_array_for_zedo=10310&selected_tab=1&isvoicesearch=N&keyword_suggest=ulloor%2C%20trivandrum%3B&fullSelectedSuggestions=ulloor%2C%20trivandrum&strEntityMap=W3sidHlwZSI6ImxvY2FsaXR5In0seyIxIjpbInVsbG9vciwgdHJpdmFuZHJ1bSIsIkNJVFlfMTM4LCBMT0NBTElUWV8xNTk4OCwgUFJFRkVSRU5DRV9TLCBSRVNDT01fUiJdfV0%3D&texttypedtillsuggestion=triv&refine_results=Y&Refine_Localities=Refine%20Localities&action=%2Fdo%2Fquicksearch%2Fsearch&suggestion=CITY_138%2C%20LOCALITY_15988%2C%20PREFERENCE_S%2C%20RESCOM_R&searchform=1&locality=15988&price_min=null&price_max=null'

# Num <- 1:10
# #Reading the HTML code from the website
# url <- c(url1, url2, url3, url4, url5, url6, url7, url8, url9, url10)
# for (i in 1:10){
# webpage <- read_html(url[[i]])
# }

webpage <- read_html(url)


#address 
Info_html <- html_nodes(webpage,'.__srpNw_desc')
Info_data <- html_text(Info_html)

# dataframe
nrow(D10 <- data.frame(info = Info_data))

#nrow(propertyData <- rbind.data.frame(D1, D2, D3, D4, D5, D6, D7, D8,D9, D10))
#nrow(propertyData <- rbind.data.frame(propertyData, D1, D2, D3, D4, D5, D6, D7, D8,D9, D10))
# save(propertyData, file = "C:/Users/sebastian.IAZI/Desktop/Presentation/propertyData.RData")
