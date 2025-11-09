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

1. How do Netflix, Disney+, and Amazon Prime differ in representing titles by **genre**, **release period**, and overall **catalogue composition**?  
2. To what extent can metadata, specifically **platform**, **genre**, **release year**, and **type**, help explain or predict a title’s **popularity** (as measured by IMDb ratings)?  
3. Are there clear **differences between platforms** in how metadata factors relate to popularity outcomes?  
4. How can the presence of **international or globally oriented genres** (e.g., “International Movies”) be used to approximate **cultural diversity** across streaming platforms?

---

## Dataset Sources

| Platform | Source | License |
|-----------|---------|----------|
| Netflix | [Kaggle – Netflix Movies and TV Shows](https://www.kaggle.com/datasets/shivamb/netflix-shows) | Public Domain |
| Amazon Prime | [Kaggle – Amazon Prime Movies and TV Shows](https://www.kaggle.com/datasets/shivamb/amazon-prime-movies-and-tv-shows) | Public Domain |
| Disney+ | [Kaggle – Disney+ Movies and TV Shows](https://www.kaggle.com/datasets/shivamb/disney-movies-and-tv-shows) | Public Domain |

Additional metadata was sourced and merged from publicly available **IMDb datasets** to supplement missing ratings and production details:  
- `title.basics.tsv.gz`  
- `title.akas.tsv.gz`  
- `title.ratings.tsv.gz`  

These files can be downloaded from [IMDb’s official dataset portal](https://datasets.imdbws.com/) or the [Kaggle IMDb mirror](https://www.kaggle.com/datasets/ashirwadsangwan/imdb-dataset).  
The **OMDb API** was tested but not used due to rate limits that prevent large-scale retrieval.

To reproduce the enriched dataset, download these files and place them in:  
`/data/imdb/`

They are not stored in this repository due to size constraints, but the cleaning notebook (`Cleaning.ipynb`) will automatically detect and merge them if present.

These files are not included in this repository due to their large size but are freely available from IMDb. The cleaning notebook (`Cleaning.ipynb`) will automatically detect and merge them if present in that folder.

Cleaned combined dataset:  
`data/clean_streaming_metadata.csv`

#### Data Limitations

The `country` field across all three Kaggle datasets has only about **60% completeness** and contains numerous multi-country or ambiguous entries.  
To preserve analytical validity, *country* was excluded as a primary modeling feature. Instead, **genre-based** and **language-inferred proxies** were used to approximate regional and cultural representation.  
All preprocessing, imputation, and transformation steps are documented in the `Cleaning.ipynb` notebook and reflected in `clean_streaming_metadata.csv`.  

*Note:* The research questions and analysis pipeline were updated accordingly to focus on genre, platform, and inferred linguistic/regional diversity rather than direct country comparisons.

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
- If the IMDb files are not found in `/data/imdb/`, the enrichment step will be skipped automatically, and the dataset will load without ratings or country backfill.

---

## Submission Notes

This repository supports **Milestone 3 – Initial Results and Code** for **CIND 820**.  
All figures and results shown in `Puvaneswaran_Kabilan_Initial_Results.pdf` were generated directly from the cleaned dataset using the notebooks in this repository.

**To reproduce the data and figures:**
1. Download the three Kaggle platform datasets (Netflix, Amazon Prime, Disney+) and place them in `/data/`.  
2. Download the following IMDb files and place them in `/data/imdb/`:
   - `title.basics.tsv.gz`  
   - `title.ratings.tsv.gz`  
   - `title.akas.tsv.gz`
3. Place all downloaded files in the `/data/` and `/data/imdb/` directories as shown above 
4. Run `Cleaning.ipynb`, then `EDA.ipynb`.

If the IMDb files are not found, the enrichment step will be skipped automatically and the dataset will still load with the base Kaggle metadata.

Deliverables:
- `Puvaneswaran_Kabilan_InitialResults.pdf`  
- `data/clean_streaming_metadata.csv`  
- `/figures/` directory (Figures output)
- `/outputs/` directory (model statistics output)  
- `Cleaning.ipynb` and `EDA.ipynb` notebooks  
-  Google Meet walkthrough (link to be added)
