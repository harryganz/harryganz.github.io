---
layout: post
title: Are Houses Actually More Expensive?
---

Every time I compulsively check house prices near me I feel like I am picking at a scab. Everything just seems so crazy expensive it is hard to believe that things have ever been so bad. But is that actually true? It is easy to see that house prices are higher now, even adjusted for inflation, than they have ever been, and interest rates are still quite high (in early 2024) relative to the past 30 years or so. However, I can't quite shake the feeling that perhaps what we are really seeing is a return to how housing was earlier in the century. How can we know? I have looked through historic data on house prices, wages, interest rates, and house features to get to the bottom of this question. Are houses really more expensive than they have ever been or were the last couple decades an anomaly of especially low housing prices?

### House Prices vs. Income

The chart you usually see when discussing the rising costs of housing is that of house prices vs. income. To generate this graph, I looked at data from the American Housing Survey. A longitudinal survey conducted by the U.S. Census Bureau every odd year since 1973. I limited the data used to 1985 to 2021, as the survey designed changed in 1985 and 2021 was the last year that data is publicly available for the survey (it was conducted in 2023, but that data has not yet been released).

{% include responsive-image.html src='/assets/img/housing/fig1.png' alt="Median House Value and Median Household Income from 1985-2021 in the U.S." %}

In 1985 the median home cost nearly 3 times the median salary, but that had grown to nearly 5 times the median salary by 2021. This certainly makes it seem like houses are becoming less affordable. However, as those who lived through the very high interest rates of the 1980s will tell you, total house price does not tell the whole story of affordability. An inexpensive house can become out of reach if mortgage rates are high, and an expensive house can be affordable, from a cash-flow perspective, if mortgage rates are low. 

### Expected Mortgage Payment

To calculate what the mortgage payment would be for a median house purchased between 1985-2021 I used data on historic mortgage rates, then calculated the expected monthly payment for a house given a 20% down payment. I also adjusted the value to 2023 dollars, so it would possible to compare from year to year.

{% include responsive-image.html src='/assets/img/housing/fig2.png' alt="Expected mortgage payment from 1985-2021 in the U.S., adjusted to 2023 dollars." %}

Based on this graph, housing payments appear to be *highest* in the mid-1980s, with the lowest payments around 2009-2013 when housing prices were still depressed from the Great Recession and interest rates were very low. However, this analysis is limited as it doesn't really tell you what new homeowners were actually paying for housing, just that *if* someone were to purchase a median house with a 20% down payment at the average 30 year fixed rate, *then* they would be paying X amount. In reality, people tend not to buy homes when rates are very high unless they absolutely have to, and then, they either pay more in cash (e.g. higher down payment), purchase a cheaper home, or, at least, they refinance as soon as they can. If we look at what owners and renters actually pay for housing, we see another interesting pattern.

## Cost of Ownership vs. Rental

Using the American Housing Survey data again, I was able to look at the total cost, in 2023 dollars, for owning versus renting, as well as the cost relative to household income. 


{% include responsive-image.html src='/assets/img/housing/fig3.png' alt="Total housing costs, for renters versus owners, from 1985-2021 in the U.S., adjusted to 2023 dollars." %}

{% include responsive-image.html src='/assets/img/housing/fig4.png' alt="Percentage of household income used for housing, for renters versus owners, from 1985-2021 in the U.S." %}

These graphs tell a different story. First, that the cost to own was highest right around the Great Recession. This is not surprising as the Great Recession was partially caused by banks giving out expensive mortgages to those who could not afford it (and then packaging those bad mortgages in "safe" mortgage backed securities). Second, that while both renting and owning have gotten more expensive since the 1980s, in real terms, renting has nearly caught up with owning, so that the median amount that a renting household spends on housing in 2021 is nearly the same as an owning household spends on housing. Finally, looking at housing as a percentage of income, we see that the amount of income that owners have spent on housing has been fairly steady over the past 35 years or so at between 10-20%, with only a short time around the Great Recession when it peaked at around 22%, while the cost to rent, relative to income, has continually increased from around 25% in 1990 to nearly 35% in 2021. 

### The Low Income Trap

So, how do we make sense of this data? In theory, housing *should* be more affordable now than it was in the 1980 and on par with most of the 1990s if all we consider is the monthly payment; however, the actual amount that people are paying for housing, both in real dollar terms as well as relative to income is around the same or higher than it has ever been. With just the data that is publicly available from the American Housing Survey (house purchase prices are collected, but not released in the public data file) it is hard to say for certain, but I think that it ultimately comes down to the increasing gap in income between owners and renters. Even though, technically speaking, renters *could* probably afford to own, the barrier to entry, in terms of a down payment, closing costs, and other up-front cash expenses are so high that most renters cannot make the leap to ownership. Low and middle income Americans are increasingly left in the dust, paying just as much to rent as they would to own, but without building equity or the control and predictability of ownership.

{% include responsive-image.html src='/assets/img/housing/fig5.png' alt="Median Household Income, for renters versus owners, from 1985-2021 in the U.S., adjusted to 2023 dollars" %}

### Data Sources and Source Code

The source code for this project can be found on my Github, [here](https://github.com/harryganz/housing).

Data Sources (also included in the Github repo):

* Federal Reserve Bank of St. Louis (n.d). Freddie Mac, 30-Year Fixed Rate Mortgage Average in the United States. Retrieved Feb. 19, 2024 from: https://fred.stlouisfed.org/series/MORTGAGE30US 

* Federal Reserve Bank of St. Louis (n.d). Consumer Price Index for  All Urban Consumers: All Items in U.S. City Average. Retrieved Jan. 21, 2024 from https://fred.stlouisfed.org/series/CPIAUCSL

* U.S. Census Bureau (n.d.) American Housing Survey, National, Public Use Files. Retrieved Feb. 17, 2024 from https://www.census.gov/programs-surveys/ahs/data.html

* U.S. Census Bureau (2015) AHS Variable Crosswalk. Retrieved Feb. 17, 2024 from https://www.census.gov/programs-surveys/ahs/data/2015/ahs-2015-public-use-file--puf-/ahs-2015-national-public-use-file--puf-.html

