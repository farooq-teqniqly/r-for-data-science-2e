library(nycflights13)
library(tidyverse)
library(dplyr)


glimpse(flights)

f <- flights |>
  filter(dep_delay >= 60) |>
  filter(dep_delay - arr_delay > 30) |>
  head()


flights |>
  filter(dep_delay >= 60) |>
  filter(dep_delay - arr_delay > 30) |>
  head(3)


flights |>
  arrange(desc(dep_delay)) |>
  head(3)


f <- flights |>
  mutate(mph = (distance / air_time) * 60) |>
  arrange(desc(mph)) |>
  head(3)

daily_flights <- flights |>
  group_by(year, month, day) |>
  summarize(flights_per_day = n())
nrow(daily_flights) == 365


least_distance <- flights |>
  arrange(distance) |>
  relocate(distance, .before = year) |>
  na.omit()
head(least_distance, 3)
