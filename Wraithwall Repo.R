library(ggplot2)

census <- Connecticut_Census_Data_JUST SNAP

ggplot(census, aes(x = "NAME", y = "SNAP_Percentage")) +
  geom_point()+
  labs(x = "Zip Code", 
       y = "Percentage of Residents Utilizing Food Stamps/SNAP Benefits", 
       title = "Presidential Elections: Popular & Electoral College Margins", 
       subtitle = "1824-2016")

# Now, uncomment the geom_text_repel() above and replot. See what happens to the labels if you adjust the size of your plot window in RStudio. 

# It's messy, but all points are labeled without tremendous overlaps. For this plot, we might be more interested in how far away each point is from the 50% threshold on both axis, or in the outcome of a particular election. So, it might make more sense to pick out points of interest in the data instead of labelling every single point. And this is where geom_text_repel() is powerful.

ggplot(elections_historic, aes(x = popular_pct, y = ec_pct,
                               label = winner_label)) + 
  geom_hline(yintercept = 0.5, size = 1.4, color = "gray80") +
  geom_vline(xintercept = 0.5, size = 1.4, color = "gray80") +
  geom_point() +
  geom_text_repel(data = subset(elections_historic,
                                ec_pct < 0.7 & popular_pct < 0.4)) +
  scale_x_continuous(labels = scales::percent) +
  scale_y_continuous(labels = scales::percent) +
  labs(x = "Winner's share of popular vote", 
       y = "Winner's share of electoral college vote", 
       title = "Presidential Elections: Popular & Electoral College Margins", 
       subtitle = "1824-2016")

ggplot(elections_historic, aes(x = popular_pct, y = ec_pct,
                               label = winner_label)) + 
  geom_hline(yintercept = 0.5, size = 1.4, color = "gray80") +
  geom_vline(xintercept = 0.5, size = 1.4, color = "gray80") +
  geom_point() +
  geom_text_repel(data = subset(elections_historic,
                                year %in% "1912")) +
  scale_x_continuous(labels = scales::percent) +
  scale_y_continuous(labels = scales::percent) +
  labs(x = "Winner's share of popular vote", 
       y = "Winner's share of electoral college vote", 
       title = "Presidential Elections: Popular & Electoral College Margins", 
       subtitle = "1824-2016")

# Sometimes we want to annotate a figure directly. Let's use annotate() to add text.

ggplot(elections_historic, aes(x = popular_pct, y = ec_pct,
                               label = winner_label)) + 
  geom_hline(yintercept = 0.5, size = 1.4, color = "gray80") +
  geom_vline(xintercept = 0.5, size = 1.4, color = "gray80") +
  geom_point() +
  geom_text_repel(data = subset(elections_historic,
                                year %in% "1912")) +
  annotate(geom="text", x = .47, y = .9,
           label = "Wilson won just 41.8% of the popular vote",
           fontface = "bold",
           color = "red",
           hjust=1) +
  scale_x_continuous(labels = scales::percent) +
  scale_y_continuous(labels = scales::percent) +
  theme_classic() + # removes gridlines
  labs(x = "Winner's share of popular vote", 
       y = "Winner's share of electoral college vote", 
       title = "Presidential Elections: Popular & Electoral College Margins", 
       subtitle = "1824-2016",
       caption = "Wilson took advantage of a Republican split, winning 40 states with just 41.8% of the popular vote.") # adds a caption

# annotate() can be used for other geoms too, including rectangles, line segments, and arrows

ggplot(elections_historic, aes(x = popular_pct, y = ec_pct,
                               label = winner_label)) + 
  geom_hline(yintercept = 0.5, size = 1.4, color = "gray80") +
  geom_vline(xintercept = 0.5, size = 1.4, color = "gray80") +
  geom_point() +
  geom_text_repel(data = subset(elections_historic,
                                year %in% "1912" |
                                  winner %in% "John Quincy Adams")) +
  annotate(geom="text", x = .3, y = .93,
           label = "Wilson still performed better than \n Adams' 30% share of the popular vote.",
           hjust=0, 
           fontface="italic", 
           color = "red") +
  annotate(geom = "segment", 
           x = .41, xend = .32,
           y = .78, yend = .37, 
           colour = "red",
           alpha = .4,
           arrow =arrow()) +
  scale_x_continuous(labels = scales::percent) +
  scale_y_continuous(labels = scales::percent) +
  theme_classic() + # removes gridlines
  labs(x = "Winner's share of popular vote", 
       y = "Winner's share of electoral college vote", 
       title = "Presidential Elections: Popular & Electoral College Margins", 
       subtitle = "1824-2016",
       caption = "Wilson took advantage of a Republican split, winning 40 states with just 41.8% of the popular vote.") # adds a caption


# Armed with the numerous examples from above, and using the elections_historic dataset, make a new graph that:
# (1) Highlights at least two outliers, either using text or color.
# (2) Includes annotated text
# (3) Includes an annotated shape
# Be sure to update the title and caption accordingly. 

view(elections_historic)

ggplot(elections_historic, aes(x = popular_pct, y = ec_pct,
                               label = winner_label)) + 
  geom_hline(yintercept = 0.5, size = 1.3, color = "gray80") +
  geom_vline(xintercept = 0.5, size = 1.3, color = "gray80") +
  geom_point() +
  geom_text_repel(data = subset(elections_historic,
                                year %in% "1860" |
                                  winner %in% "Abraham Lincoln")) +
  annotate(geom="text", x = .3, y = .93,
           label = "Lincoln's share of vote grew significantly \n between first and second term.",
           hjust=0, 
           fontface="italic", 
           color = "red") +
  annotate(geom = "segment", 
           x = .40, xend = .55,
           y = .60, yend = .90, 
           colour = "red",
           alpha = .4,
           arrow =arrow()) +
  scale_x_continuous(labels = scales::percent) +
  scale_y_continuous(labels = scales::percent) +
  theme_classic() + # removes gridlines
  labs(x = "Winner's share of popular vote", 
       y = "Winner's share of electoral college vote", 
       title = "Presidential Elections: Share of Popular & Electoral College Vote", 
       subtitle = "1824-2016",
       caption = "Lincoln had the greatest election-to-election increase in share of \n electoral college and popular vote of any two-term president.")


# Save your plot: 

ggsave("Wraithwall_plot3.png",
       plot = last_plot(),
       dpi = 300)