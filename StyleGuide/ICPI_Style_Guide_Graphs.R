

# DEPENDENCIES ------------------------------------------------------------

library(tidyverse)
library(scales)
library(extrafont)
library(gridExtra)


# DUMMY DATA --------------------------------------------------------------

df_bar <- tibble::tribble(
  ~site,   ~x,
  "Site A", 450L,
  "Site B", 300L,
  "Site C", 250L,
  "Site D", 100L
) %>% 
  arrange(x) %>% 
  mutate(site = as_factor(site))

df_scatter <- tibble::tribble(
  ~site,  ~x,   ~y, ~key,
  "Site 690", 35L,  69L,   0L,
  "Site 477", 36L,  23L,   0L,
  "Site 362", 69L, 949L,   1L,
  "Site 539", 27L, 183L,   0L,
  "Site 510", 51L, 712L,   1L,
  "Site 589", 24L, 101L,   0L,
  "Site 678", 72L, 718L,   1L,
  "Site 310", 12L, 560L,   0L,
  "Site 314", 33L, 893L,   0L,
  "Site 589", 31L, 318L,   0L,
  "Site 368",  5L, 501L,   0L,
  "Site 420", 54L, 424L,   0L,
  "Site 350", 85L, 133L,   0L,
  "Site 311",  7L, 185L,   0L,
  "Site 287", 54L, 579L,   1L,
  "Site 217", 15L, 769L,   0L
)

df_targetbar <- tibble::tribble(
  ~group, ~result, ~target, ~target_pct,
  "X",    280L,    328L,        0.85,
  "Y",    688L,    750L,        0.92,
  "Z",    406L,    380L,        1.07,
  "P",    969L,    890L,        1.09,
  "D",    432L,    391L,         1.1,
  "Q",    306L,    229L,        1.33) %>% 
  arrange(target_pct) %>% 
  mutate(group = as_factor(group))

df_dot <- df_targetbar %>% 
  mutate(ach_color = target_pct > 1,
         lab = paste0(target_pct*100,"%")) 

df_targetbar_alt <- df_targetbar %>% 
  select(-target) %>% 
  mutate(target_pct = 100 * target_pct) %>% 
  gather(type, val, -group) 

df_line <- tibble::tribble(
              ~group,        ~pd, ~val,
                 "X", "FY16Q1",  155,
                 "X", "FY16Q2",  150,
                 "X", "FY16Q3",  125,
                 "X", "FY16Q4",  160,
                 "X", "FY17Q1",  110,
                 "X", "FY17Q2",   90,
                 "X", "FY17Q3",  120,
                 "X", "FY17Q4",  140,
                 "X", "FY18Q1",  145,
                 "X", "FY18Q2",  170,
                 "X", "FY18Q3",  175,
                 "X", "FY18Q4",  170
              ) %>% 
  mutate(grp_lab = case_when(str_detect(pd, "Q1") ~ pd),
         flag = val < 125)


df_dumbell <- tibble::tribble(
                ~group, ~then, ~now,
                   "X",   105,  110,
                   "Y",   100,   80,
                   "Z",    85,  105,
                   "P",    85,   95,
                   "D",    80,   85,
                   "Q",    75,   90
                ) %>% 
  arrange(now) %>% 
  mutate(group = as_factor(group)) %>% 
  gather(pd, val, -group) %>% 
  mutate(grp_lab = case_when(pd == "then" & group != "Y" ~ as.character(group),
                             pd == "now" & group == "Y" ~ as.character(group)),
         pd_lab = ifelse(group == "X", pd, NA))


# VIZ TEMPLATES -----------------------------------------------------------

#horizontal bar chat
plot_bar <- df_bar %>% 
  ggplot(aes(site, x)) +
  geom_col(fill = ifelse(df_bar$site == "Site B", "#2166AC", "#67A9CF")) +
  coord_flip() +
  labs(title = "WITTY TITLE",
       subtitle = "Takeaway message sentence.",
       x = "", y = "", caption = "Source: My data") +
  theme_bw() +
  theme(panel.border = element_blank(),
        axis.ticks = element_blank(),
        text = element_text(family = "Calibri Light", size = 11, color = "#595959"),
        axis.text.y = element_text(size = 12),
        plot.title = element_text(family = "Calibri", color = "black",
                                  size = 12, face = "bold"),
        plot.subtitle = element_text(color = "black"),
        plot.caption = element_text(size = 10),
        panel.grid.major.y = element_blank(),
        panel.grid.major  = element_line("#bfbfbf")
  )


#scatter plot
plot_scatter <- df_scatter %>% 
  ggplot(aes(x, y)) +
  geom_point(fill = ifelse(df_scatter$key == 1, "#f5b9a1","white"),
             color = ifelse(df_scatter$key == 1, "#EF8A62","#2166AC"),
             shape = 21, stroke = 2,
             size = 6,
             na.rm = TRUE) +
  geom_label(aes(label = ifelse(df_scatter$key == 1, df_scatter$site, NA), 
                family = "Calibri Light"),
            hjust = ifelse(df_scatter$site == "Site 678", -.2, 1.3), 
            color = "#595959", size = 4, label.size = 0,
            na.rm = TRUE) +
  scale_x_continuous(breaks = seq(0, 100, 20))+
  scale_y_continuous(breaks = seq(0, 1000, 200),
                     label = comma) +
  labs(title = "WITTY TITLE",
       subtitle = "Takeaway message sentence.",
       x = "", y = "", caption = "Source: My data") +
  expand_limits(x = 100, y = 1000) +
  theme_light() +
  theme(panel.border = element_blank(),
        axis.line = element_line("#bfbfbf"),
        axis.ticks = element_blank(),
        text = element_text(family = "Calibri Light", size = 11, color = "#595959"),
        plot.title = element_text(family = "Calibri", color = "black",
                                  size = 12, face = "bold"),
        plot.subtitle = element_text(color = "black"),
        plot.caption = element_text(size = 10)
  )

#vertical bar chart with target bars
plot_targetbar <- df_targetbar %>% 
  ggplot(aes(group, result)) +
  geom_col(fill = "#67A9CF") +
  geom_errorbar(aes(ymin = target, ymax = target), color = "#EF8A62", size = 1.5) +
  geom_text(aes(y = target, label = percent(target_pct, accuracy = 1)),
            fontface = "bold",
            color = "#D95709",
            vjust = -1) +
  labs(title = "WITTY TITLE",
       subtitle = "Takeaway message sentence.",
       x = "", y = "", caption = "Source: My data") +
  scale_y_continuous(labels = comma) +
  theme_bw() +
  theme(panel.border = element_blank(),
        axis.ticks = element_blank(),
        text = element_text(family = "Calibri Light", size = 11, color = "#595959"),
        axis.text.x = element_text(size = 14),
        plot.title = element_text(family = "Calibri", color = "black",
                                  size = 12, face = "bold"),
        plot.subtitle = element_text(color = "black"),
        plot.caption = element_text(size = 10),
        panel.grid.major.x = element_blank(),
        panel.grid.major  = element_line("#bfbfbf")
  )

df_targetbar_alt %>%
  mutate(type = ifelse(type == "result", "CUM. RESULTS", "FY ACHIEVEMENT (%)")) %>% 
  ggplot(aes(group, val)) +
  geom_col(fill = "#67A9CF") +
  coord_flip() +
  scale_y_continuous(labels = comma) +
  facet_wrap(. ~ type, scales = "free_x") +
  labs(title = "WITTY TITLE",
       subtitle = "Takeaway message sentence.",
       x = "", y = "", caption = "Source: My data") +
  theme_bw() +
  theme(panel.border = element_blank(),
        strip.background = element_blank(),
        strip.text       = element_text(family = "Calibri", face = "bold", size = 12),
        axis.ticks = element_blank(),
        text = element_text(family = "Calibri Light", size = 11, color = "#595959"),
        plot.title = element_text(family = "Calibri", color = "black",
                                  size = 12, face = "bold"),
        plot.subtitle = element_text(color = "black"),
        plot.caption = element_text(size = 10),
        panel.grid.major.y = element_blank(),
        panel.grid.major  = element_line("#bfbfbf")
  )


#lollipop chart
plot_dot <- df_dot %>% 
  ggplot(aes(group, target_pct, color = ach_color)) +
  geom_segment(aes(xend=group, y=0, yend=target_pct), size = 2) +
  geom_point(size = 6) +
  geom_text(label = df_dot$lab, 
            hjust = -.5,
            #family = "Calibri",
            fontface = "bold") +
  scale_color_manual(values = c("#EF8A62", "#67A9CF")) +
  scale_y_continuous(labels = percent) +
  coord_flip() +
  expand_limits(y = 1.7) +
  labs(title = "WITTY TITLE",
       subtitle = "Takeaway message sentence.",
       x = "", y = "MER Target Achievement", caption = "Source: My data") +
  theme_bw() +
  theme(panel.border = element_blank(),
        strip.background = element_blank(),
        strip.text       = element_text(family = "Calibri", face = "bold", size = 12),
        axis.ticks = element_blank(),
        text = element_text(family = "Calibri Light", size = 11, color = "#595959"),
        plot.title = element_text(family = "Calibri", color = "black",
                                  size = 12, face = "bold"),
        plot.subtitle = element_text(color = "black"),
        plot.caption = element_text(size = 10),
        panel.grid.major.y = element_blank(),
        #panel.grid.major  = element_line("#bfbfbf"),
        axis.text = element_text(size = 14),
        legend.position = "none",
        axis.text.x = element_blank()
  )
  
#line graph
plot_line <- df_line %>% 
  ggplot(aes(pd, val, group = group, color = flag)) +
  geom_line(size = 1) +
  geom_point(fill = "white", shape = 21, stroke = 2,
             size = 6) +
  expand_limits(y = 0) +
  scale_color_manual(values = c("#B2B2B2", "#2166AC")) +
  scale_x_discrete(labels = c("FY16Q1", rep(" ", 3), "FY17Q1", rep(" ", 3), "FY18Q1", rep(" ", 3))) +
  labs(title = "WITTY TITLE",
       subtitle = "Takeaway message sentence.",
       x = "", y = "", caption = "Source: My data") +
  theme_bw() +
  theme(panel.border = element_blank(),
        strip.background = element_blank(),
        strip.text       = element_text(family = "Calibri", face = "bold", size = 12),
        axis.ticks = element_blank(),
        text = element_text(family = "Calibri Light", size = 11, color = "#595959"),
        plot.title = element_text(family = "Calibri", color = "black",
                                  size = 12, face = "bold"),
        plot.subtitle = element_text(color = "black"),
        plot.caption = element_text(size = 10),
        panel.grid.major.y = element_blank(),
        axis.line = element_line("#bfbfbf"),
        legend.position = "none"
  )

#dumbell plot
plot_dumbell <- df_dumbell %>% 
  ggplot(aes(group, val)) +
  geom_path(color = "#969696", size = 1) +
  geom_point(shape = 21, stroke = 2,
             color = ifelse(df_dumbell$pd == "then", "#969696", "#2166AC"),
             fill = ifelse(df_dumbell$pd == "then", "white", "#2166AC"),
             size = 10) +
  geom_text(aes(label = val),
            color = ifelse(df_dumbell$pd == "then","#595959", "white"),
            family = "Calibri Light") +
  geom_text(aes(label = grp_lab),
            color = "#595959", size = 6,
            family = "Calibri", fontface = "bold",
            hjust = 3.2,
            na.rm = TRUE) +
  geom_text(aes(label = pd_lab),
            color = ifelse(df_dumbell$pd == "then", "#595959", "#2166AC"),
            family = "Calibri", fontface = "bold",
            vjust = -2.3,
            na.rm = TRUE) +
  coord_flip() +
  expand_limits(x = 7, y = c(68, 115)) +
  labs(title = "WITTY TITLE",
       subtitle = "Takeaway message sentence.",
       x = "", y = "", caption = "Source: My data") +
  theme_bw() +
  theme(panel.border = element_blank(),
        strip.background = element_blank(),
        strip.text       = element_text(family = "Calibri", face = "bold", size = 12),
        axis.ticks = element_blank(),
        text = element_text(family = "Calibri Light", size = 11, color = "#595959"),
        plot.title = element_text(family = "Calibri", color = "black",
                                  size = 12, face = "bold"),
        plot.subtitle = element_text(color = "black"),
        plot.caption = element_text(size = 10),
        panel.grid = element_blank(),
        axis.text = element_blank(),
        legend.position = "none"
  )


# OUTPUT ------------------------------------------------------------------

plot_arrange <- arrangeGrob(plot_bar, plot_scatter, plot_dumbell, 
                 plot_line, plot_dot, plot_targetbar, 
                 nrow = 2)
ggsave("~/GitHub/DIV/StyleGuide/RefImages/viz_catalogue.png", plot_arrange,
       width = 11.5, height = 8, units = "in", dpi = 300)
