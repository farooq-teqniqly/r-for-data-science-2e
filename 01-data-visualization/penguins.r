library(tidyverse)
library(palmerpenguins)
library(ggthemes)

penguins_data <- penguins |> na.omit()

ggplot(data = penguins_data, mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(color = bill_depth_mm)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Body mass and flipper length",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "bill_depth_mm"
  ) +
  scale_color_colorblind()


ggplot(data = penguins_data, mapping = aes(x = bill_length_mm, y = bill_depth_mm)) +
  geom_point() +
  labs(
    title = "Bill length and bill depth",
    x = "Bill length (mm)", y = "Bill depth (mm)"
  ) +
  geom_smooth(method = "lm") +
  scale_color_colorblind()


cor(penguins_data$bill_length_mm, penguins_data$bill_depth_mm)
?cor

library(viridis)

penguins_data |>
  ggplot(aes(x = species, y = bill_depth_mm, fill = species)) +
  geom_boxplot() +
  scale_fill_viridis_d(option = "C") +
  theme_minimal()


ggplot(data = penguins_data) +
  geom_point()


penguins_data2 <- penguins

ggplot(data = penguins_data2, mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(na.rm = TRUE)


penguins_data$bill_depth_bin <- cut(
  penguins_data$bill_depth_mm,
  breaks = c(10, 14, 16, 18, 20, 22),
  labels = c("<14", "14", "16", "18", ">=20")
)

summary(penguins_data)

library(viridis)

ggplot(data = penguins_data, mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(color = bill_depth_mm)) +
  geom_smooth() +
  labs(
    title = "Body mass and flipper length by bill depth",
    caption = "Data comes from the palmerpenguins package",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "Bill depth (mm)"
  ) +
  scale_color_viridis_c(option = "C", direction = -1) +
  theme_minimal()


penguins_data |>
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(color = bill_depth_mm)) +
  geom_smooth() +
  labs(
    title = "Body mass and flipper length by bill depth",
    caption = "Data comes from the palmerpenguins package",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "Bill depth (mm)"
  ) +
  scale_color_viridis_c(option = "C", direction = -1) +
  theme_minimal()
