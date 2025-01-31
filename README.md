### 📌 German Credit Risk Analysis

#### **Project Overview**
This project analyzes **credit risk** using the German Credit dataset. The dataset contains **1,000 records** with **20 attributes**, evaluating financial behavior and creditworthiness. The goal is to **predict credit risk levels** using **SQL queries** and a **logistic regression model** in Python.

---

## 📂 Dataset  

- The dataset originates from **[Kaggle: German Credit Dataset](https://www.kaggle.com/datasets/uciml/german-credit)**.  
- It includes **categorical and numerical features** that describe a customer’s **credit status, payment behavior, employment, and personal details**.  

**Key Columns:**  
- `Creditability` (Target Variable: 1 = Good, 0 = Bad)  
- `Duration` (Loan duration in months)  
- `CreditAmount` (Loan amount)  
- `Age` (Age of the applicant)  
- `Purpose`, `Housing`, `Job`, etc.  

---

## ⚙️ Installation & Setup  

### 1️⃣ Clone the Repository  
```bash
git clone https://github.com/Roozbehkkvnd/German-Credit.git
cd German-Credit
```

### 2️⃣ Install Dependencies  
Ensure you have Python installed, then install the required libraries:  
```bash
pip install -r requirements.txt
```

### 3️⃣ Set Up SQL Database (Optional)  
If using SQL for analysis, load `GermanCredit.csv` into a **MySQL/PostgreSQL database** before running queries.  

---

## 🚀 Usage  

### 🔹 Option 1: SQL-Based Analysis  
- Run the SQL queries from **[GermanCredit.sql](https://github.com/Roozbehkkvnd/German-Credit/blob/main/GermanCredit.sql)** in your SQL database.  
- These queries help in **data exploration, segmentation, and creditworthiness assessment**.  

### 🔹 Option 2: Python & Jupyter Notebook  
- Open **[GermanCredit.ipynb](https://github.com/Roozbehkkvnd/German-Credit/blob/main/GermanCredit.ipynb)** and run the cells step-by-step.  
- The notebook performs **data preprocessing, visualization, and logistic regression modeling** for credit risk prediction.  

---

## 🤔 Why Logistic Regression?  

Logistic regression was chosen for this project because:  

1. **Binary Classification Problem**: The target variable (`Creditability`) is binary (1 = Good, 0 = Bad), making logistic regression a natural choice.  
2. **Interpretability**: Unlike black-box models, logistic regression provides **clear coefficients** that help explain which factors contribute to credit risk.  
3. **Efficiency**: It is computationally efficient and works well even with **small to medium-sized datasets** like the German Credit dataset.  
4. **Baseline Model**: Logistic regression serves as a **strong baseline**, allowing for easy comparison if more complex models like decision trees or neural networks are introduced later.  
5. **Statistical Significance**: It helps in understanding the statistical relationship between variables, making it valuable for **financial risk assessment**.  

---

## 📁 Project Structure  

```
📂 German-Credit
 ├── 📄 GermanCredit.csv      # Dataset (CSV format)
 ├── 📄 GermanCredit.sql      # SQL queries for analysis
 ├── 📄 GermanCredit.ipynb    # Jupyter Notebook with ML model
 ├── 📄 README.md             # Project documentation
 ├── 📄 requirements.txt      # Dependencies
```

---

## 📊 Results  

- **Data Exploration**: SQL queries identify patterns in credit risk factors.  
- **Predictive Model**: Logistic regression estimates **probability of default**.  
- **Key Insights**: Higher loan amounts and longer durations are linked to **higher credit risk**.  

---

## 📜 License  

This project is licensed under the **MIT License**. Feel free to use and modify it.  

---

## 🤝 Contributing  

Contributions are welcome! If you'd like to improve the project:  
1. Fork the repo  
2. Create a feature branch (`git checkout -b feature-name`)  
3. Commit changes (`git commit -m "Added feature"`)  
4. Open a Pull Request  

---

This README provides clear guidance on **installation, usage, dataset details, and project structure**. Feel free to modify it based on any additional requirements! 🚀

