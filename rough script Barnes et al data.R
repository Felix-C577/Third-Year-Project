
library(tidyverse) #for ggplot etc??
library(lubridate) #need if changing dates etc?
pred_prey_data <- read.csv("Predator_and_prey_body_sizes_in_marine_food_webs_vsn4_csvcopy.csv")

summary(pred_prey_data)

#ggplot(x= pred_prey_data$Predator.length, y= pred_prey_data$Predator.mass)

#plot(pred_prey_data$Prey.mass)

unique(pred_prey_data$Predator.mass.unit) #shows all are measured in grams
unique(pred_prey_data$Prey.mass.unit) #some in grams, some in miligrams

pred_prey_data$Prey.mass[pred_prey_data$Prey.mass.unit == "mg"] <- 1000*pred_prey_data$Prey.mass[pred_prey_data$Prey.mass.unit == "mg"]
#for any value in mg, converts to grams
pred_prey_data$Prey.mass.unit[pred_prey_data$Prey.mass.unit == "mg"] <- "g"
#sets units to grams for those converted values

unique(pred_prey_data$Prey.mass.unit) #shows now all in grams
  
  
pred_mass_g <-pred_prey_data$Predator.mass #all in grams anyway
prey_mass_g <-pred_prey_data$Prey.mass # now all converted to grams

plot(x= prey_mass_g, y= pred_mass_g)
