# load packages -----------------------------------------------------------

library(tidyverse)

# death from tigers -------------------------------------------------------

tiger_data <- read_csv("https://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02e2aDeathsFromTigers.csv")

#print table in console

tiger_data                                              

# list of different activities when attacted by tigers (categorical)

distinct(tiger_data, activity)                           

# Contingency table displaying the occurance of each activity

count(tiger_data, activity)


# creating bar graph for tiger data ---------------------------------------

# create new ggplot

ggplot(data = tiger_data)

# add geometric object to the canvas (bar graph)

ggplot(data = tiger_data) +
  geom_bar(mapping = aes(x = activity))

# print data in the console 

tiger_data

# arrange levels of activities in discending order 

ggplot(data = tiger_data) +
  geom_bar(mapping = aes(x = fct_infreq(activity)))

# Change color of the bars to red

ggplot(data = tiger_data) +
  geom_bar(mapping = aes(x = fct_infreq(activity)), fill = "#C5351B")

# adding axis labels 

ggplot(data = tiger_data) +
  geom_bar(mapping = aes(x = fct_infreq(activity)), fill = "#C5351B") +
  labs(x = "Activity", y = "Frequency (number of people)")

# Adjusting  the graph 

ggplot(data = tiger_data) +
  geom_bar(mapping = aes(x = fct_infreq(activity)), fill = "#C5351B", 
           width = .8) +
  labs(x = "Activity", y = "Frequency (number of people)") +
  scale_y_continuous(limits = c(0, 50), expand = expansion(mult = 0)) +
  theme_classic(base_size = 12) +
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(1)),
    axis.text.x = element_text(angle = 45, hjust = 1),
    axis.ticks.x = element_blank()
  )


# bird abundances ---------------------------------------------------------

# read birds data

bird_data <- read_csv("https://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02e2bDesertBirdAbundance.csv")

# print data in the console

bird_data                  


# Creating histogram for the birds data -----------------------------------

# create new ggplot

ggplot(data = bird_data)

# add geometric objects to the canvas (histogram)

ggplot(data = bird_data) +
  geom_histogram(mapping = aes(x = abundance))

# bin width setting

ggplot(data = bird_data) +
  geom_histogram(mapping = aes(x = abundance), binwidth = 50)

# boundary setting

ggplot(data = bird_data) +
  geom_histogram(mapping = aes(x = abundance), binwidth = 50,
                 boundary = 0, closed = "left")

# fixing data point for Gila woodpecker (for the edge to be include in the bin, bot the right)

ggplot(data = bird_data) +
  geom_histogram(mapping = aes(x = abundance), binwidth = 50,
                 boundary = 0, closed = "left")

# axis label and graph editing 

ggplot(data = bird_data) +
  geom_histogram(mapping = aes(x = abundance), binwidth = 50,
                 boundary = 0, closed = "left", 
                 fill = "#C5351B", color = "black") +
  labs(x = "Abundance", y = "Frequency (number of species)") +
  scale_y_continuous(breaks = seq(0, 30, 5), limits = c(0, 30), 
                     expand = expansion(mult = 0)) +
  scale_x_continuous(breaks = seq(0, 600, 100)) +
  theme_classic() +
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(1))
  )



















