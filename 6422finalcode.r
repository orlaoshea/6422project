library(dplyr) 
library(tidyr) #Both packages allowed me to clean the data before visualising it.

#I had to remove the first few headings to make sure the data read correctly, 
#and then separated the variable columns from the data as they had merged together.
df <- read.csv("gcses-and-equivalent-in-english-and-maths-table-data.csv", 
               skip = 7, 
               header = FALSE, 
               quote = "\"", 
               sep = ",")
names(df) <- c("Area code","Area name","2016-17","2017-18","2018-19", "2019-20","2020-21","2021-22","2022-23","2023-24")

#Accounting for a space mark in one of the headings.
df <- df %>% filter(`Area code` != "Area code")

#Had to separate the data for each year which had also merged together.
df_long <- df %>% 
  pivot_longer( 
    cols = `2016-17`:`2023-24`, 
    names_to = "Year", 
    values_to = "Value")

#Converted from a wide to a long dataset so that I could demonstrate change over time,
#rather than focus on regional trends.
#The numbers were originally down as character rather than numeric data, and cleaned 
#the data to remove N/A values that weren't converted.
df_long <- df_long %>% mutate(Value = as.numeric(Value))
df_long_clean <- df_long %>% 
  mutate(Value = as.numeric(Value)) %>% 
  filter(!is.na(Value))

#Summary of cleaned data.
summary(df_long_clean)
#Area code          Area name             Year               Value      
#Length:2642        Length:2642        Length:2642        Min.   :50.13  
#Class :character   Class :character   Class :character   1st Qu.:69.56  
#Mode  :character   Mode  :character   Mode  :character   Median :73.73  
                                                          #Mean   :73.62  
                                                          #3rd Qu.:78.07  
                                                          #Max.   :90.68

#Showing the first few rows of data as a tibble.
head(df_long_clean, 10)
# A tibble: 10 × 4
#`Area code` `Area name`   Year    Value
#<chr>       <chr>         <chr>   <dbl>
#1 E06000001   Hartlepool    2016-17  74.2
#2 E06000001   Hartlepool    2017-18  69.4
#3 E06000001   Hartlepool    2018-19  66.0
#4 E06000001   Hartlepool    2019-20  67.6
#5 E06000001   Hartlepool    2020-21  70.5
#6 E06000001   Hartlepool    2021-22  69.6
#7 E06000001   Hartlepool    2022-23  72.8
#8 E06000001   Hartlepool    2023-24  74.0
#9 E06000002   Middlesbrough 2016-17  63.2
#10 E06000002   Middlesbrough 2017-18  64.3

library(ggplot2)
library(tidyverse)
library(plotly) #These packages allowed me to visualise the data and make it interactive.

#I wanted to create a heatmap to communicate the bigger picture, demonstrating 
#trends over time but also accounting for regional differences.
df_heatmap <- df_long_clean %>%
  mutate(`Area name` = fct_reorder(`Area name`, Value, .fun = 'mean')) %>%
#Mutated the y-axis so it would be shown from highest to lowest regional percentages
#rather than alphabetically.
  ggplot(mapping = aes(x = Year, y = `Area name`, fill = Value)) +
  geom_tile() +
  scale_fill_viridis_c(option = "magma", direction = -1) +
#Wanted the darker colours to represent higher percentages and vice versa.
  labs(title = "Attainment of GCSEs in English and Maths across England",
       x = "Year", y = "Lower-tier/Unitary Authority", fill = "Pass Rate") +
  theme(axis.text.y = element_text(size = 4))
df_heatmap

df_heatmap +
  theme_minimal() +
  theme(
    legend.position = "right",
    plot.title = element_text(size = 11, face = "bold"),
    axis.title = element_text(size = 8),
    panel.grid.minor = element_blank()
  )

#Made the heatmap longer in order to leave spaces between the y-axis variables,
#and used the plotly package to make the map interactive so you can get the specific
#percentages of qualifications for each region per academic year.
ggplotly(df_heatmap, height = 1600)