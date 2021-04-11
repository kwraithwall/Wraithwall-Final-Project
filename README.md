# Wraithwall-Final-Project
Repository for Kristen Wraithwall's Final Project for YSE603

Data folder includes U.S. Census Data by Zip Code (complete dataset with all variables) as well as smaller datasets 
with just SNAP and SNAP + uninsurance data.

I think there might be too many columns (500+ apparently) in the full census data, so I wasn't actually 
able to use the variables I wanted (they were cut off in the preview and wouldn't show up when I tried to 
plot them in ggplot). That is why I made the additional shortened datasets with SNAP and SNAP + uninsurance. 

Other issue I had was in plotting the percentage (vs. the total number of residents per zip code). Was showing 
up as a very chaotic graph and relationships weren't clear (plots went beyond the bounds of the chart and every
one of the 280+ points was labled on the axis - it worked fine when using the total # variable, so assuming it
has something to do with it being represented as a discrete vs. continuous variable). 

Would want to also explore the USDA Ag Census data, but didn't have the time to attempt that this week due to
the large amount of time spent wrangling my data to make the chart and troubleshooting my graphing issues. 

I also wasn't sure what the file titled .gitgnore was. Any suggestions? I had to commit the changes so that 
I could push my final graphs, but I don't actually know what it (github also wouldn't let me delete it). 

Definitely took a while to get a hang of the pull-commit-push flow, but finally was able to push a .png
of my final graphic. This is an updated version of one that I made in Tableau (however, the one in tableau
was using the PERCENTAGE variable (which I wasn't able to use here) as opposed to the total number variable). 
