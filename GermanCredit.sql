USE germancredit;
SELECT * FROM GermanCredit LIMIT 5;
SELECT * FROM GermanCredit LIMIT 5;
SELECT COUNT(*) FROM GermanCredit;
SELECT
  MIN(duration) AS min_duration,
  MAX(duration) AS max_duration,
  AVG(duration) AS avg_duration,
  MIN(amount) AS min_amount,
  MAX(amount) AS max_amount,
  AVG(amount) AS avg_amount
FROM GermanCredit;
SELECT
  credit_risk,
  COUNT(*) AS number_of_clients
FROM GermanCredit
GROUP BY credit_risk;
SELECT
  SUM(CASE WHEN status IS NULL THEN 1 ELSE 0 END) AS missing_status,
  SUM(CASE WHEN duration IS NULL THEN 1 ELSE 0 END) AS missing_duration,
  SUM(CASE WHEN credit_history IS NULL THEN 1 ELSE 0 END) AS missing_credit_history,
  SUM(CASE WHEN purpose IS NULL THEN 1 ELSE 0 END) AS missing_purpose,
  SUM(CASE WHEN amount IS NULL THEN 1 ELSE 0 END) AS missing_amount,
  SUM(CASE WHEN savings IS NULL THEN 1 ELSE 0 END) AS missing_savings,
  SUM(CASE WHEN employment_duration IS NULL THEN 1 ELSE 0 END) AS missing_employment_duration,
  SUM(CASE WHEN installment_rate IS NULL THEN 1 ELSE 0 END) AS missing_installment_rate,
  SUM(CASE WHEN personal_status_sex IS NULL THEN 1 ELSE 0 END) AS missing_personal_status_sex,
  SUM(CASE WHEN other_debtors IS NULL THEN 1 ELSE 0 END) AS missing_other_debtors,
  SUM(CASE WHEN property IS NULL THEN 1 ELSE 0 END) AS missing_property,
  SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS missing_age,
  SUM(CASE WHEN other_installment_plans IS NULL THEN 1 ELSE 0 END) AS missing_other_installment_plans,
  SUM(CASE WHEN housing IS NULL THEN 1 ELSE 0 END) AS missing_housing,
  SUM(CASE WHEN number_credits IS NULL THEN 1 ELSE 0 END) AS missing_number_credits,
  SUM(CASE WHEN job IS NULL THEN 1 ELSE 0 END) AS missing_job,
  SUM(CASE WHEN people_liable IS NULL THEN 1 ELSE 0 END) AS missing_people_liable,
  SUM(CASE WHEN telephone IS NULL THEN 1 ELSE 0 END) AS missing_telephone,
  SUM(CASE WHEN foreign_worker IS NULL THEN 1 ELSE 0 END) AS missing_foreign_worker,
  SUM(CASE WHEN credit_risk IS NULL THEN 1 ELSE 0 END) AS missing_credit_risk
FROM GermanCredit;

#Distribution of Numerical Variables
SELECT
    MIN(duration) AS min_duration,
    MAX(duration) AS max_duration,
    AVG(duration) AS avg_duration,
    STDDEV(duration) AS stddev_duration,
    MIN(amount) AS min_amount,
    MAX(amount) AS max_amount,
    AVG(amount) AS avg_amount,
    STDDEV(amount) AS stddev_amount
FROM GermanCredit;

#Distribution of Categorical Variables
SELECT credit_history, COUNT(*) AS frequency
FROM GermanCredit
GROUP BY credit_history;
SELECT purpose, COUNT(*) AS frequency
FROM GermanCredit
GROUP BY purpose;

#Distribution of Target Variable (credit_risk)
SELECT credit_risk, COUNT(*) AS count
FROM GermanCredit
GROUP BY credit_risk;

#Relationship Between Numerical Variables and Target
SELECT
    credit_risk,
    AVG(duration) AS avg_duration,
    AVG(amount) AS avg_amount
FROM GermanCredit
GROUP BY credit_risk;

#Cross-Tabulation Between Categorical Variables and Target
SELECT
    credit_history,
    credit_risk,
    COUNT(*) AS count
FROM GermanCredit
GROUP BY credit_history, credit_risk;

SELECT
    purpose,
    credit_risk,
    COUNT(*) AS count
FROM GermanCredit
GROUP BY purpose, credit_risk;

#Numerical Features and Target Variable
SELECT
    credit_risk,
    AVG(duration) AS average_duration,
    AVG(amount) AS average_amount
FROM GermanCredit
GROUP BY credit_risk;

#Categorical Features and Target Variable
SELECT
    credit_history,
    credit_risk,
    COUNT(*) AS count
FROM GermanCredit
GROUP BY credit_history, credit_risk
ORDER BY credit_history, credit_risk;

SELECT
    purpose,
    credit_risk,
    COUNT(*) AS count
FROM GermanCredit
GROUP BY purpose, credit_risk
ORDER BY purpose, credit_risk;

#Correlation Between Numerical Features and Target Variable
SELECT
    AVG(CASE WHEN credit_risk = 1 THEN duration ELSE NULL END) AS good_risk_avg_duration,
    AVG(CASE WHEN credit_risk = 0 THEN duration ELSE NULL END) AS bad_risk_avg_duration,
    AVG(CASE WHEN credit_risk = 1 THEN amount ELSE NULL END) AS good_risk_avg_amount,
    AVG(CASE WHEN credit_risk = 0 THEN amount ELSE NULL END) AS bad_risk_avg_amount
FROM GermanCredit;

#Using Subqueries for Deeper Analysis
SELECT
    credit_risk,
    amount,
    (SELECT AVG(amount) FROM GermanCredit WHERE credit_risk = gc.credit_risk) AS group_average_amount
FROM GermanCredit gc;

#Loan Amount Categories
ALTER TABLE GermanCredit ADD COLUMN Loan_amount_category VARCHAR(20);
UPDATE GermanCredit
SET Loan_amount_category = CASE
  WHEN amount <= 2000 THEN 'low'
  WHEN amount > 2000 AND amount <= 5000 THEN 'medium'
  WHEN amount > 5000 THEN 'high'
  ELSE 'unknown' END;

#Age Categories
ALTER TABLE GermanCredit ADD COLUMN age_category VARCHAR(20);
UPDATE GermanCredit
SET age_category = CASE
  WHEN age <= 25 THEN 'young'
  WHEN age > 25 AND age <= 50 THEN 'adult'
  WHEN age > 50 THEN 'senior'
  ELSE 'unknown' END;

#Credit History Score
ALTER TABLE GermanCredit ADD COLUMN credit_history_score INT;
UPDATE GermanCredit
SET credit_history_score = CASE
  WHEN credit_history = 'no credits taken/ all credits paid back duly' THEN 0
  WHEN credit_history = 'all credits at this bank paid back duly' THEN 1
  WHEN credit_history = 'existing credits paid back duly till now' THEN 2
  WHEN credit_history = 'delay in paying off in the past' THEN 3
  WHEN credit_history = 'critical account/ other credits existing (not at this bank)' THEN 4
  ELSE NULL END;

#Savings Stock Categories
ALTER TABLE GermanCredit ADD COLUMN savings_stock_category VARCHAR(20);
UPDATE GermanCredit
SET savings_stock_category = CASE
  WHEN savings LIKE '... < 100 DM' THEN 'low'
  WHEN savings LIKE '100 <= ... < 500 DM' THEN 'medium_low'
  WHEN savings LIKE '500 <= ... < 1000 DM' THEN 'medium_high'
  WHEN savings LIKE '... >= 1000 DM' THEN 'high'
  WHEN savings = 'unknown/no savings account' THEN 'none'
  ELSE 'unknown' END;

#Employment Duration Score
ALTER TABLE GermanCredit ADD COLUMN employment_duration_score INT;
UPDATE GermanCredit
SET employment_duration_score = CASE
  WHEN employment_duration LIKE 'unemployed' THEN 0
  WHEN employment_duration LIKE '... < 1 year' THEN 1
  WHEN employment_duration LIKE '1 <= ... < 4 years' THEN 2
  WHEN employment_duration LIKE '4 <= ... < 7 years' THEN 3
  WHEN employment_duration LIKE '... >= 7 years' THEN 4
  ELSE NULL END;

#Binary Encoding for Housing
ALTER TABLE GermanCredit ADD COLUMN own_house BOOLEAN;
UPDATE GermanCredit SET own_house = (housing = 'own');
