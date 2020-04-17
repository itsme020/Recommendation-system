library(arules)
library(car)
library(carData)
library(mvinfluence)


library(recommenderlab)
library(ggplot2)
library(data.table)
library(reshape2)
library(caTools)
#download data
View(book)

#metadata about the variable
str(book)
book

book$ChildBks <- factor(book$ChildBks,levels = c("1","0"),labels = c("ChildBks",""))
book$YouthBks <- factor(book$YouthBks,levels = c("1","0"),labels = c("YouthBks",""))
book$CookBks <- factor(book$CookBks,levels = c("1","0"),labels = c("CookBks",""))
book$DoItYBks <- factor(book$DoItYBks,levels = c("1","0"),labels = c("DoItYBks",""))
book$RefBks <- factor(book$RefBks,levels = c("1","0"),labels = c("RefBks",""))
book$ArtBks <- factor(book$ArtBks,levels = c("1","0"),labels = c("ArtBks",""))
book$GeogBks <- factor(book$GeogBks,levels = c("1","0"),labels = c("GeogBks",""))
book$ItalCook <- factor(book$ItalCook,levels = c("1","0"),labels = c("ItalCook",""))
book$ItalAtlas <- factor(book$ItalAtlas,levels = c("1","0"),labels = c("ItalAtlas",""))
book$ItalArt <- factor(book$ItalArt,levels = c("1","0"),labels = c("ItalArt",""))
book$Florence <- factor(book$Florence,levels = c("1","0"),labels = c("Florence",""))


booknew <- as(book,"transactions")

#rating distribution

itemFrequencyPlot(booknew,topN=25)

View(book)

#the datatype should be realRatingMatrix inorder to build recommendation engine
book_matrix <- as(booknew, "binaryRatingMatrix")

#Popularity based 

book_recomm_model1 <- Recommender(book_matrix, method="POPULAR")
book_recomm_model1

#Predictions for two users 
recommended_items1 <- predict(book_recomm_model1, book_matrix[413:414], n=5)
as(recommended_items1, "list")


## Popularity model recommends the same movies for all users , we need to improve our model using # # Collaborative Filtering

#User Based Collaborative Filtering

book_recomm_model2 <- Recommender(book_matrix, method="UBCF")
book_recomm_model2




#Predictions for two users 
recommended_items2 <- predict(book_recomm_model2, book_matrix[413:414], n=5)
as(recommended_items2, "list")

