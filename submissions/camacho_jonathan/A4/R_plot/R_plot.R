library(flexdashboard)
library(tidyverse)
library(plotly)
library(shiny)


# Data preparation. 
# Loads baltimore_service_calls.csv file. 
countries_dataset <- as_tibble(read.csv(file = "./data/tidy_countries_dataset.csv", 
                                        stringsAsFactors = FALSE))

# Calculatting population density variable for each observation. 
countries_density <- countries_dataset %>% 
       select(country, continent.x, lifeExp, pop, areaInSqKm) %>%
       mutate(pop_density = (pop / areaInSqKm))

# Creating vector for selectInput tool.
continents_tool_vector <- unique(countries_density$continent.x)


all_data <- ggplot(countries_density, aes(pop_density, lifeExp)) +
       geom_point(alpha = .2) +
       geom_smooth() +
       scale_x_log10() +
       labs(x = "Population Density (Millions/Kilometer^2)",
            y = "Life Expectancy") +
       theme_minimal()