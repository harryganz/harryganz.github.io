---
title: U.S. Home Values
layout: post
---

Living in the Northeast U.S. and looking at houses on Zillow is painful. Everything is unaffordable, but it could be worse. I could be looking for homes in Teton County, Wyoming. In this post, I have collected county level home value data to find out where the most and least expensive places to buy a home in the U.S. are.

## Sources and Methods

To find housing data, I used [Zillow's Research Page](https://www.zillow.com/research/data/) and downloaded the county level Zillow Housing Index (ZHVI), which represents the weighted average of the middle third of homes in a given region. The dataset I used was for the 34th to 65th percentile of single family homes and condominiums and was seasonally adjusted. 

To get the geographic data I used, I imported data from the [tigris package](https://cran.r-project.org/web/packages/tigris/index.html) in R, as well as using the [sf package](https://cran.r-project.org/web/packages/sf/index.html) for coordinate reference system transformations. 

For plotting I used [ggplot2](https://ggplot2.tidyverse.org/) as well as several other [tidyverse packages](https://www.tidyverse.org/) for data manipulation. 

The original data, source code, and figures can be found on my Github repo., [here](https://github.com/harryganz/zillow_home_value).

## Home Values 2014-2024

{% include responsive-image.html src='/assets/img/home-values/zhvi.gif' alt='Typical Home Values in the U.S. from 2014 to 2024 from Zillow data.' %}

Some of the trends are not a surprise. California, especially the Bay Area, is one of the most expensive areas in the U.S. As are the major cities in the Northeast, such as Boston and New York. The Mississippi Valley and Great Plains are some of the cheapest areas. There are some surprises, however. Some counties in the Mountain West that have typical home values over $1 million in 2024, many of which had home prices closer to $500 thousand in 2014. 

{% include responsive-image.html src='/assets/img/home-values/home_value_change.png' alt='U.S. Counties with largest increase and decrease in home values from Jan. 31, 2014-2024.' %}

Teton County has the largest change in home value, with the middle third of housing increasing by $1.6 million. This is mostly driven by the ultra-wealthy moving there for tax benefits. Wendover productions [made a video about it](https://www.youtube.com/watch?v=bQE_zNs5HOU&t=754s). 

## Most and Least Expensive Counties, 2024

{% include responsive-image.html src='/assets/img/home-values/home_values.png' alt='U.S. Counties with highest and lowest typical home values as of Jan. 31, 2024' %}

Other than Teton County, Wyoming there aren't any surprises here. The highest home values are in wealthy areas of Massachussets and California, and the lowest home values are in Appalachia and the Mississippi Valley. 