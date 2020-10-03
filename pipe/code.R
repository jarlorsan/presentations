
# Setup -------------------------------------------------------------------

### R Packages

library(tidyverse)



# Data Manipulation -------------------------------------------------------

### Base R: Intermediate Steps

kids <- read.csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-15/kids.csv")
kids_a <- subset(kids, state == "Iowa")
kids_b <- kids_a[kids_a$variable == "PK12ed", ]
kids_b$inf_adj_perchild_actual <- kids_b$inf_adj_perchild * 1000
kids_c <- kids_b[, c("year", "inf_adj_perchild_actual")]
plot(kids_c$year, kids_c$inf_adj_perchild_actual,
     main = "Iowa's Spending on Elementary & Secondary Education 1997-2016",
     sub = "Public prekindergarten spending transformed to be in 2016 dollars",
     xlab = "Year",
     ylab = "Amount ($)")



### Intermediate Steps

kids <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-15/kids.csv')
kids_a <- filter(.data = kids, state == "Iowa", variable == "PK12ed")
kids_b <- mutate(.data = kids_a, 
                 inf_adj_perchild_actual = inf_adj_perchild * 1000)
kids_c <- select(.data = kids_b, year, inf_adj_perchild_actual)
ggplot(data = kids_c, aes(x = year, y = inf_adj_perchild_actual)) +
  theme_bw() +
  geom_point() +
  labs(title = "Iowa's Spending on Elementary & Secondary Education 1997-2016",
       subtitle = "Public prekindergarten spending transformed to be in 2016 dollars",
       caption = "Data sourced from Urban Institute, courtesy of Joshua Rosenberg \n https://jrosen48.github.io/tidykids/index.html") +
  xlab("Year") + 
  ylab("Amount ($)")



### Overriding Objects

kids <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-15/kids.csv')
kids <- filter(.data = kids, state == "Iowa", variable == "PK12ed")
kids <- mutate(.data = kids, inf_adj_perchild_actual = inf_adj_perchild * 1000)
kids <- select(.data = kids, year, inf_adj_perchild_actual)
ggplot(data = kids, aes(x = year, y = inf_adj_perchild_actual)) +
  theme_bw() +
  geom_point() +
  labs(title = "Iowa's Spending on Elementary & Secondary Education 1997-2016",
       subtitle = "Public prekindergarten spending transformed to be in 2016 dollars",
       caption = "Data sourced from Urban Institute, courtesy of Joshua Rosenberg \n https://jrosen48.github.io/tidykids/index.html") +
  xlab("Year") + 
  ylab("Amount ($)")



### Pipe

kids <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-15/kids.csv')
kids %>%
  # Data Cleaning
  filter(state == "Iowa", variable == "PK12ed") %>%
  mutate(inf_adj_perchild_actual = inf_adj_perchild * 1000) %>%
  select(year, inf_adj_perchild_actual) %>%
  # Data Visualization
  ggplot(aes(x = year, y = inf_adj_perchild_actual)) +
  theme_bw() +
  geom_point() +
  labs(title = "Iowa's Spending on Elementary & Secondary Education 1997-2016",
       subtitle = "Public prekindergarten spending transformed to be in 2016 dollars",
       caption = "Data sourced from Urban Institute, courtesy of Joshua Rosenberg \n https://jrosen48.github.io/tidykids/index.html") +
  xlab("Year") + 
  ylab("Amount ($)")
