# CIND820 – Streaming Cultural Exports Project

**Author:** Kabilan Puvaneswaran  
**Course:** CIND820 – Big Data Analytics Project (F2025)  
**Institution:** Toronto Metropolitan University  

---

## Overview

This project examines how major streaming platforms, Netflix, Disney+, and Amazon Prime, act as cultural intermediaries by curating and promoting international media.  
The goal is to compare how each platform represents content, and test whether the metadata can predict popularity whiel also identifying cross-platform cultural groupings.

This analysis will combine exploratory data analysis (EDA), classification, and clustering methods to study representation patterns and cultural diversity across the three streaming services.

---

## Research Questions

1. How do Netflix, Disney+, and Amazon Prime differ in representing international titles by **genre**, **release period**, and **inferred language or regional indicators**?  
2. Can we predict whether a title will be **popular** based on metadata such as **platform**, **genre**, **release year**, and **type**, without relying on incomplete country information?  
3. What **clusters or groupings** of titles emerge when grouped by metadata features such as genre, year, and platform?  
4. Which platform demonstrates the strongest **cultural diversity or cross-regional representation** based on these findings?

---

## Dataset Sources

| Platform | Source | License |
|-----------|---------|----------|
| Netflix | [Kaggle – Netflix Movies and TV Shows](https://www.kaggle.com/datasets/shivamb/netflix-shows) | Public Domain |
| Amazon Prime | [Kaggle – Amazon Prime Movies and TV Shows](https://www.kaggle.com/datasets/shivamb/amazon-prime-movies-and-tv-shows) | Public Domain |
| Disney+ | [Kaggle – Disney+ Movies and TV Shows](https://www.kaggle.com/datasets/shivamb/disney-movies-and-tv-shows) | Public Domain |

Cleaned combined dataset:  
`data/clean_streaming_metadata.csv`

#### Data Limitations

The `country` field across all three Kaggle datasets has only about **66% completeness** and contains numerous multi-country or ambiguous entries.  
To preserve analytical validity, *country* was excluded as a primary modeling feature. Instead, **genre-based** and **language-inferred proxies** were used to approximate regional and cultural representation.  
All preprocessing, imputation, and transformation steps are documented in the `Cleaning.ipynb` notebook and reflected in `clean_streaming_metadata.csv`.  

*Note:* The research questions and analysis pipeline were updated accordingly to focus on genre, platform, and inferred linguistic/regional diversity rather than direct country comparisons.


## External Data  

Additional metadata was sourced from official **IMDb public datasets** for improved coverage of ratings and release details:  
- `title.basics.tsv.gz`  
- `title.akas.tsv.gz`  
- `title.ratings.tsv.gz`

**Path:** `notebooks/data/imdb/`  

These files were obtained from IMDb’s [official dataset portal](https://datasets.imdbws.com/) and corresponding [Kaggle mirrors](https://www.kaggle.com/datasets/ashirwadsangwan/imdb-dataset).  
**OMDb API** was tested but not used due to API rate limits and scalability constraints for large datasets.

---

## Project Workflow  

1. **Data Cleaning & Integration**  
   - Combined Netflix, Disney+, and Amazon Prime datasets.  
   - Removed duplicates, standardized column names, and harmonized data formats.  
   - Excluded unreliable `country` field and created inferred language/genre-based region indicators.  

2. **Exploratory Data Analysis (EDA)**  
   - Visualized content distributions by platform, genre, and year.  
   - Analyzed IMDb rating distributions and missingness patterns.  

3. **Modeling (Classification)**  
   - Predicted popularity using logistic regression, random forest, and XGBoost classifiers.  
   - Evaluated with accuracy, precision, recall, and F1-score.  

4. **Unsupervised Clustering**  
   - Applied K-Means and Hierarchical Clustering to detect cultural content groupings.  
   - Validated with Silhouette and Davies–Bouldin scores.  

5. **Interpretation & Reporting**  
   - Compared representation and performance across platforms.  
   - Interpreted results through a cultural globalization and soft-power lens.  

---

## Reproducibility  

- All preprocessing, merging, and modeling scripts are included in the repository (`Cleaning.ipynb`, `EDA.ipynb`, and `Modeling.ipynb`).  
- The complete workflow is version-controlled through GitHub and documented through comments and this README.  
- Visual outputs and results are reproducible from the cleaned dataset.  

