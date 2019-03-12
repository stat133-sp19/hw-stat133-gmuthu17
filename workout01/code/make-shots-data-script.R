#Title: Make Shots Data Script
#Description: Create a csv file with all required files for a visualization phase
#Input: 5 dataframes of nba player shot data
#Output: a single csv file with all shot data

library(dplyr)
library(stringr)
data_types = c('character', 'factor', 'integer', 'integer', 'integer', 'integer', 'character', 'character', 'character', 'integer', 'character', 'integer', 'integer')

andreData = read.csv('./data/andre-iguodala.csv', header = TRUE, sep = ",", colClasses = data_types)
draymondData = read.csv('./data/draymond-green.csv', header = TRUE, sep = ",", colClasses = data_types)
kevinData = read.csv('./data/kevin-durant.csv', header = TRUE, sep = ",", colClasses = data_types)
klayData = read.csv('./data/klay-thompson.csv', header = TRUE, sep = ",", colClasses = data_types)
stephenData = read.csv('./data/stephen-curry.csv', header = TRUE, sep = ",", colClasses = data_types)

andreData = mutate(andreData, name = 'Andre Iguodala')
draymondData = mutate(draymondData, name = 'Draymond Green')
kevinData = mutate(kevinData, name = 'Kevin Durant')
klayData = mutate(klayData, name = 'Klay Thompson')
stephenData = mutate(stephenData, name = 'Stephen Curry')

andreData$shot_made_flag = str_replace_all(andreData$shot_made_flag, 'y', 'shot_yes')
andreData$shot_made_flag = str_replace_all(andreData$shot_made_flag, 'n', 'shot_no')
draymondData$shot_made_flag = str_replace_all(draymondData$shot_made_flag, 'y', 'shot_yes')
draymondData$shot_made_flag = str_replace_all(draymondData$shot_made_flag, 'n', 'shot_no')
kevinData$shot_made_flag = str_replace_all(kevinData$shot_made_flag, 'y', 'shot_yes')
kevinData$shot_made_flag = str_replace_all(kevinData$shot_made_flag, 'n', 'shot_no')
klayData$shot_made_flag = str_replace_all(klayData$shot_made_flag, 'y', 'shot_yes')
klayData$shot_made_flag = str_replace_all(klayData$shot_made_flag, 'n', 'shot_no')
stephenData$shot_made_flag = str_replace_all(stephenData$shot_made_flag, 'y', 'shot_yes')
stephenData$shot_made_flag = str_replace_all(stephenData$shot_made_flag, 'n', 'shot_no')

andreData = mutate(andreData, minute = (12 * period) - minutes_remaining)
draymondData = mutate(draymondData, minute = (12 * period) - minutes_remaining)
kevinData = mutate(kevinData, minute = (12 * period) - minutes_remaining)
klayData = mutate(klayData, minute = (12 * period) - minutes_remaining)
stephenData = mutate(stephenData, minute = (12 * period) - minutes_remaining)

sink(file = './output/andre-iguodala-summary.txt')
summary(andreData)
sink()

sink(file = './output/draymond-green-summary.txt')
summary(draymondData)
sink()

sink(file = './output/kevin-durant-summary.txt')
summary(kevinData)
sink()

sink(file = './output/klay-thompson-summary.txt')
summary(klayData)
sink()

sink(file = './output/stephen-curry-summary.txt')
summary(stephenData)
sink()

shotData = rbind(andreData, draymondData, kevinData, klayData, stephenData)

write.csv(shotData, file = './data/shots-data.csv')

sink(file = './output/shots-data-summary.txt')
summary(shotData)
sink()

