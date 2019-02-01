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

library('rvest')
library('dplyr')

#Specifying the url for desired website to be scrapped
url <- 'https://www.99acres.com/search/property/buy/residential-apartments/ernakulam?search_type=QS&search_location=HP&lstAcn=HP_R&lstAcnId=0&src=CLUSTER&preference=S&selected_tab=1&city=130&res_com=R&property_type=1&isvoicesearch=N&keyword=ernakulam&strEntityMap=IiI%3D&refine_results=Y&Refine_Localities=Refine%20Localities&action=%2Fdo%2Fquicksearch%2Fsearch&searchform=1&price_min=null&price_max=null'

#Reading the HTML code from the website
webpage <- read_html(url)

#address 
info_html <- html_nodes(webpage,'._srpttl')
Info_data <- html_text(info_html)

#price
price_html <- html_nodes(webpage,'.srpNw_price')
price_data <- html_text(price_html)

#surfaceliving
surLiving_html <- html_nodes(webpage,'._auto_areaValue')
surLiving_data <- html_text(surLiving_html)

#BHK
BHK_html <- html_nodes(webpage,'._auto_bedroom')
BHK_data <- html_text(surLiving_html)

#Bathrooms
Bath_html <- html_nodes(webpage,'._auto_bath_balc_roadText')
Bath_data <- html_text(Bath_html)


#publishDate
publishDate_html <- html_nodes(webpage,'.srpNw_dlrNme')
publishDate_data <- html_text(publishDate_html)


propertyData <- data.frame(description = Info_data,
                           price = price_data,
                           surfaceliving = surLiving_data,
                           roomNb = BHK_data,
                           bathNb = Bath_data,
                           publishDate = publishDate_data)
propertyData %>% View
save(propertyData, file = "E:/MyLab/Text_Mining/Data/propertyData.RData")