#hw-5

#1
...
qqnorm(s1.g1)
qqline(s1.g1)
...

#2
library(readxl)

par(mar=c(4,4,3,2))
# Диаграмма рассеяния по экспорту и импорту:
plot(sub$МетЭкспорт, 
     sub$МетИмпорт,
     col="red", 
     xlab="Экспорт, млн. долл. США", 
     ylab = "Импорт, млн. долл. США", 
     main = "Экспорт/импорт металлов и изделий из них по субъектам РФ")

plot(sub$МетЭкспорт, 
     sub$МетИмпорт, 
     col="red", 
     xlab="Экспорт, млн. долл. США", 
     ylab = "Импорт, млн. долл. США", 
     main = "Экспорт/импорт металлов и изделий из них по субъектам РФ", 
     asp = 1)



#3
plot(okr$МетЭкспорт, 
     okr$МетИмпорт, 
     col=rgb(1,0,0,0.5), 
     xlab="Экспорт, млн. долл. США", 
     ylab = "Импорт, млн. долл. США", 
     main = "Экспорт/импорт металлов и изделий из них по ФО РФ (2013 г.)", 
     asp = 1,
     pch = 20, 
     cex = 2+log(sub$МетИмпорт/sub$МетЭкспорт)) # размер кружка зависит от соотношения импорта и экспорта



#4
hist(sub$ПродЭкспорт, breaks = seq(0,3000,100), col="olivedrab3")


#5
pie(okr$ХимЭкспорт, names2, main = "Доля федеральных округов в экспорте \n продукции химической промышленности")


#6
library('dplyr')
library('tidyr')
library('ggplot2')
library('eurostat')
library('nasapower')

library(eurostat)

tables = c('tet00034', 'tet00033', 'tet00032', 'tet00031','tet00030', 'tet00029')

trades = lapply(tables, function(X) { # прочтем несколько таблиц в список
  get_eurostat(X) %>% label_eurostat()
}) %>% 
  bind_rows() %>% # объединим прочитанные таблицы в одну
  select(-geo) %>% # убираем столбец с территорией торговли, т.к. там только Евросоюз
  filter(stringr::str_detect(indic_et, 'Exports in|Imports in')) %>% # оставим только экспорт и импорт
  pivot_wider(names_from = indic_et, values_from = values) %>%  # вынесем данные по экспорту и импорту в отдельные переменные
  rename(export = `Exports in million of ECU/EURO`, # дадим им краткие названия
         import = `Imports in million of ECU/EURO`) %>% 
  mutate(partner = as.factor(partner))

trades %>% 
  dplyr::filter(sitc06 == 'Machinery and transport equipment', time == as.Date('2017-01-01')) %>% 
  ggplot(mapping = aes(x = partner, y = export, fill = partner)) +
  geom_col() +
  coord_polar()
