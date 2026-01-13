--- 
title: "Orla O'Shea PSY6422 Project" 
format: html 
---

## Longitudinal trends in attainment of GCSEs in English and Maths across England, 2016-2024.

## Overview

This dataset was published through the Office for National Statistics (ONS), and was collected by the Department for Education by matching data from the School Census, information provided by the Awarding Organisation, and information provided by the Individualised Learner Record Database

The variable on the X axis shows the academic years from 2016 to 2024, which will indicate change over time.

The variables on the Y axis represent the division of England into lower tier/unitary authorities, such as city councils and London's borough councils. This was determined by what local authority individuals attended school in by the time they left at the age of 16. I decided to use these variables rather than vaster areas as it is more representative.

The constant/measurement represents the percentage of the population of the area who by the age of 19 had achieved a GCSE (or equivalent Level 2 qualification) in both Mathematics and either English Language and/or Literature.

***Research questions:***

-   Is there a general trend over time for the attainment of GCSEs in Maths and English at a national level?

-   Did the COVID-19 pandemic affect the attainment of these qualifications, and why might this be?

## Repository Structure, including visualisation

**Dataset:** [gcses-and-equivalent-in-english-and-maths-table-data.csv](https://github.com/orlaoshea/6422project/blob/main/docs/gcses-and-equivalent-in-english-and-maths-table-data.csv)

**Quarto Script (.qmd):** [Project Script](https://github.com/orlaoshea/6422project/blob/main/docs/PSY6422_Project_250123623.qmd)

**Rendered HTML Report:** [Interactive Heatmap Report](https://orlaoshea.github.io/6422project/PSY6422_Project_250123623.html)

**Live Interactive Report:** <https://orlaoshea.github.io/6422project/>

## Prerequisites

To reproduce this analysis, you need the following installed:

-   \* R (Version 4.0 or higher recommended)

-   RStudio IDE

-   Quarto

### Required R Packages

Install the following before reproducing this analysis (using the install.packages command):

tidyverse

dplyr

tidyr

ggplot2

plotly

## Data Source

The data used in this project comes from the Office of National Statistics and can be found at

<https://www.ons.gov.uk/explore-local-statistics/indicators/gcses-and-equivalent-in-english-and-maths>

-   **License:** Open Government License v3.0

-   **Date Accessed:** 04/01/2026

## License

This project is licensed under the MIT License

## 
