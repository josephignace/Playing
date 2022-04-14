library('tidyverse')
library('dplyr')

df_input <- read_csv(
    here::here("output", "input.csv"),
    col_types = cols(patient_id = col_integer(), age = col_double(), sex = col_double(), region = col_double())
)     

df_input <- df_input %>% mutate(Gender.Dummy = if_else(sex == "M", 0, 1))

plot_age <- ggplot(data = df_input, aes(df_input$age)) + 
                    geom_histogram()

ggsave(
    plot = plot_age,
    filename = "Descriptive-Age.png", path = here::here("output"),
)                    

#plot_sex <- ggplot(data = df_input, aes(df_input$sex)) + geom_histogram()
#
#ggsave(
#    plot = plot_sex,
#    filename = "Descriptive-Sex.png", path = here::here("output"),
#)