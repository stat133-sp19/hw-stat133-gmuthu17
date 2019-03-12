#Title: Make Shot Charts Script
#Description: Create shot charts
#Input: CSV file with all shot data
#Output: Shot charts

library(jpeg)
library(grid)
library(ggplot2)

imageUrl = 'https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/images/nba-court.jpg'
court_file = './images/nba-court.jpeg'
download.file(imageUrl, court_file)

courtImage = rasterGrob(
  readJPEG(court_file),
  width = unit(1, 'npc'),
  height = unit(1, 'npc'))

shotsData = read.csv('./data/shots-data.csv', header = TRUE, sep = ",")

andreShotChart = ggplot(data = filter(shotsData, name == 'Andre Iguodala')) + 
  annotation_custom(courtImage, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()
ggsave('./images/andre-iguodala-shot-chart.pdf', plot = andreShotChart, width = 6.5, height = 5) 

draymondShotChart = ggplot(data = filter(shotsData, name == 'Draymond Green')) + 
  annotation_custom(courtImage, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()
ggsave('./images/draymond-green-shot-chart.pdf', plot = draymondShotChart, width = 6.5, height = 5) 

kevinShotChart = ggplot(data = filter(shotsData, name == 'Kevin Durant')) + 
  annotation_custom(courtImage, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()
ggsave('./images/kevin-durant-shot-chart.pdf', plot = kevinShotChart, width = 6.5, height = 5) 

klayShotChart = ggplot(data = filter(shotsData, name == 'Klay Thompson')) + 
  annotation_custom(courtImage, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
ggsave('./images/klay-thompson-shot-chart.pdf', plot = klayShotChart, width = 6.5, height = 5) 

stephenShotChart = ggplot(data = filter(shotsData, name == 'Stephen Curry')) + 
  annotation_custom(courtImage, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()
ggsave('./images/stephen-curry-shot-chart.pdf', plot = stephenShotChart, width = 6.5, height = 5) 

gswShotChart = ggplot(data = shotsData) + 
  annotation_custom(courtImage, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') +
  theme_minimal() +
  facet_wrap(~name)
ggsave('./images/gsw-shot-charts.pdf', plot = gswShotChart, width = 8, height = 7) 
ggsave('./images/gsw-shot-charts.png', plot = gswShotChart, width = 8, height = 7) 


