Title: Credit Risk Analysis with SQL and Machine Learning

Objective:
This project is an exploration into the use of SQL and machine learning within the context of finance, specifically for assessing credit risk. Utilizing the German Credit Dataset, which encapsulates a range of financial attributes across a number of individuals, this project applies a series of data preprocessing techniques followed by a logistic regression model to predict the level of risk associated with credit.

Dataset:
The German Credit Dataset is an intricate compilation of 1000 individual records, each detailed with 20 different attributes alongside a target variable. These attributes encompass various aspects of an individual's financial history and current status, such as their account status, loan duration, credit history, and purpose of the loan, among others.

Prerequisites:
Before diving into the project, it is essential to set up the environment correctly. This involves installing a SQL database system like MySQL and ensuring that Python 3.8 or newer is up and running on your system. The project also relies on several Python libraries, including pandas, numpy, scikit-learn, matplotlib, and seaborn, all pivotal for data manipulation and analysis.

Installation:
To get the project up and running on your local machine, start by cloning the repository from GitHub. Once cloned, navigate to the project directory and install the necessary Python libraries specified within the requirements.txt file.

Usage:
The analysis begins with the execution of an SQL script designed to create the database schema and populate it with the dataset provided in the GermanCredit.sql file. The exploration and modeling process is encapsulated within a Jupyter notebook, GermanCredit.ipynb, which can be launched and executed to reproduce the analysis and results.

Structure:
Within the repository, you will find the SQL script for database setup, the Jupyter notebook containing the analysis, the requirements.txt file for environment setup, and a data directory where the dataset is stored in CSV format.

Methods Used:
The project takes a structured approach to data analysis, starting with an exploration phase where data distributions and relationships are uncovered. Following this, various preprocessing steps, such as encoding categorical variables and scaling features, are applied to prepare the data for modeling. The Logistic Regression model is then trained and evaluated, and results are visualized to convey the findings effectively.

Results:
Through the logistic regression model, the project achieves a classification accuracy that highlights the model's predictive capabilities. The model also offers valuable insights into the significant predictors that influence credit risk assessment.

