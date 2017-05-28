# Data preparation. 
# Loads baltimore_service_calls.csv file. 
countries_dataset <- as_tibble(read.csv(file = "./data/tidy_countries_dataset.csv", 
                                        stringsAsFactors = FALSE))

# Calculatting population density variable for each observation. 
countries_density <- countries_dataset %>% 
       select(country, year, continent.x, lifeExp, pop, areaInSqKm) %>%
       mutate(pop_density = (pop / areaInSqKm)) %>%
       write_csv("./data/countries_density.csv")

