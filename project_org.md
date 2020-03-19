# Project Organization

In general, follow the (Nice R Code)[https://nicercode.github.io/blog/2013-04-05-projects/] recommendations.

## Directory layout

There is no one way to lay a project out. That said, consistency across the firm will help improve collaboration. This is the basic structure that I tend to use:

```bash
wydot
├── data
├── doc
├── out
├── shp
├── data_prep.R
├── modelling.R
└── report.Rmd
```

* The `data` directory contains data used in the analysis. The source data files in this directory are treated as read only. Depending on the project, these might be csv files, a database, and the directory itself may have subdirectories.

* The `doc` directory contains documentation related to the project. 

* The `out` directory contains project outputs, including processed datasets, logs, or other processed things.

* The `shp` directory contains spatial data used in the analysis. The source data files in this directory are treated as read only.

In this set up, I usually have the R script files that do things in the project root:

* `data_prep.R` is typically responsible for transforming the source data files into a format suitable for analysis, and saving the resulting transformed data as an RDS file in the `data` directory.

* `modelling.R` is typically where any modelling occurs

* `report.Rmd` may contain an RMarkdown summary of the project or findings. Typically, a Word of PDF export from this .Rmd will be in the `out` folder