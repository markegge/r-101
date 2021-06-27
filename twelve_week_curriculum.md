# R Training

Training Goal: develop R skills needed to manipulate large datasets, visualize and map their contents, and build and maintain R Shiny applications

## R Basics

### Week 1

Readings:

- Base R Core Functions and Data Types (Reference: Base R Cheat Sheet)
- Tour of RStudio IDE (Reference: RStudio IDE Cheat Sheet)
- Hadley Wickham&#39;s R Style Guide seems to be the most broadly adopted R style: [http://adv-r.had.co.nz/Style.html](http://adv-r.had.co.nz/Style.html)
- R project organization: [https://nicercode.github.io/blog/2013-04-05-projects/](https://nicercode.github.io/blog/2013-04-05-projects/)
- R accessors ([] vs [[]] vs $ explained): [https://www.r-bloggers.com/r-accessors-explained/](https://www.r-bloggers.com/r-accessors-explained/)

Training Material &amp; Exercises:

- Practice Basic R: [https://practice.datacamp.com/p/2](https://practice.datacamp.com/p/2)

Aim to get 10 challenges correct.

If you get six or fewer questions correct on first try consider reviewing the Intro to R course: https://learn.datacamp.com/courses/free-introduction-to-r

## Data Manipulation

### Weeks 2 &amp; 3

Data Manipulation with Data.Table (fread, :=, .SD, by, setorder): [https://www.datacamp.com/courses/data-manipulation-with-datatable-in-r](https://www.datacamp.com/courses/data-manipulation-with-datatable-in-r) (4 hours, 15 videos)

Joining and Reshaping data with Data.Table (Joining, merging, and reshaping data with base R and data.table (merge, dcast, melt)): [https://www.datacamp.com/courses/joining-data-with-datatable-in-r](https://www.datacamp.com/courses/joining-data-with-datatable-in-r) (4 hours, 15 videos)

Readings:

- Non-equi joins with data.table: [https://channel9.msdn.com/Events/useR-international-R-User-conference/useR2016/Efficient-in-memory-non-equi-joins-using-datatable](https://channel9.msdn.com/Events/useR-international-R-User-conference/useR2016/Efficient-in-memory-non-equi-joins-using-datatable)
- data.table::foverlaps for LRS functions: [https://www.rdocumentation.org/packages/data.table/versions/1.13.2/topics/foverlaps](https://www.rdocumentation.org/packages/data.table/versions/1.13.2/topics/foverlaps)

foverlaps is a useful function for working with linearly reference data.

### Week 4

Data Manipulation with dplyr: https://learn.datacamp.com/courses/data-manipulation-with-dplyr (4 hrs)

Like data.table, dplyr is a popular package that extends the power and versatility of the data frame for tasks like aggregation and other data manipulation tasks.

### Week 5

Importing data to R from Database and Web sources: [https://learn.datacamp.com/courses/intermediate-importing-data-in-r](https://learn.datacamp.com/courses/intermediate-importing-data-in-r) (Chapters 1 – 4, but not 5)

**Evaluation exercise** 


## Unit 2: Visualizing Data and Mapping

## Plotting and Data Viz

### Week 6

ggplot2 [https://www.datacamp.com/courses/introduction-to-data-visualization-with-ggplot2](https://www.datacamp.com/courses/introduction-to-data-visualization-with-ggplot2) (4 hours, 14 videos)

## Mapping &amp; Spatial Analysis

### Week 7

Chapter 4 (&quot;Data import and projections&quot;) in [https://www.datacamp.com/courses/visualizing-geospatial-data-in-r](https://www.datacamp.com/courses/visualizing-geospatial-data-in-r) provides a nice introduction to many of the concepts (projections, coordinate reference systems, etc.). Skip the first three chapters—while ggplot can be used with spatial data, it&#39;s not recommended. Instead, use mapview for quick map rendering and Leaflet for interactive map rendering. (Note: the rgdal package is older and no longer preferred, and most folks are using the sf package now, but the concepts are the same.)

The sf package is a modern package for performing analysis with spatial data: [https://www.datacamp.com/courses/spatial-analysis-with-sf-and-raster-in-r](https://www.datacamp.com/courses/spatial-analysis-with-sf-and-raster-in-r) (4 hours)

Note, sf objects and data.table objects do not play nicely together. If &quot;shp&quot; is your sf object, just DT \&lt;- as.data.table(st\_drop\_geometry(shp)) to convert from an sf object to a data.table object.

### Week 8

R Leaflet – displaying spatial data on an interactive map: [https://learn.datacamp.com/courses/interactive-maps-with-leaflet-in-r](https://learn.datacamp.com/courses/interactive-maps-with-leaflet-in-r) (4 hours)

**Evaluation exercise**


## Interactive Applications

### Weeks 9 – 11

Shiny basics: [https://www.datacamp.com/courses/building-web-applications-with-shiny-in-r](https://www.datacamp.com/courses/building-web-applications-with-shiny-in-r) (4 hours, 16 videos)

**Exercise #3 assigned, due 3/11.**

### Week 10

Applying Shiny: [https://learn.datacamp.com/courses/case-studies-building-web-applications-with-shiny-in-r](https://learn.datacamp.com/courses/case-studies-building-web-applications-with-shiny-in-r) (4 hours, 16 videos)

### Week 11

On 3/12 from 1 – 2:30 pm Mark will schedule and lead a discussion of options for deploying Shiny apps to end users.

## Introduction to Machine Learning and Regression

### Week 12

Supervised Learning and Regression: https://learn.datacamp.com/courses/supervised-learning-in-r-regression (4 hours, 19 videos)

### Week 13

Unsupervised Learning: https://learn.datacamp.com/courses/unsupervised-learning-in-r (4 hours, 16 videos)