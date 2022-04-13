library("LexisNexisTools") #data wranglind Nexis Uni data
library(dplyr)
library(readr)
library(gsubfn)
library(stringr)
library(sentimentr)

#Help understanding and trouble shooting the Nexis data wrangling process here: https://github.com/JBGruber/LexisNexisTools

#download the Nexis Uni results and put them in your working directory

#create a string consisting of the file path of your data .docx
my_files <- list.files(pattern = ".docx", path = getwd(),
                       full.names = TRUE, recursive = TRUE, ignore.case = TRUE)

dat <- lnt_read(my_files) #Object of class 'LNT output'


meta_df <- dat@meta
articles_df <- dat@articles
paragraphs_df <- dat@paragraphs

dat2<- data_frame(element_id = seq(1:length(meta_df$Headline)), Date = meta_df$Date, Headline = meta_df$Headline)#, Article = articles_df@articles) #issue here with the articles column
