# User Submission & Points Analysis (SQL)

This project analyzes user engagement and performance metrics from a competitive programming/quiz platform using PostgreSQL.

## 📊 Project Overview
The project processes submission data to derive insights into user activity, ranking top performers, and evaluating the quality of submissions (correct vs. incorrect) based on point distribution.

## 🛠 Tech Stack
* **Database:** PostgreSQL
* **Tool:** pgAdmin 4
* **Analysis:** Conditional Aggregation, Time-series manipulation, and Ranking Functions (Window Functions).

## 🔑 Key Insights
* **User Performance:** Identifying highly active users and their total points earned.
* **Submission Quality:** Tracking "Incorrect Submission" counts (points < 0) vs. "Correct Submissions" (points > 0).
* **Daily Leaderboards:** Utilizing `DENSE_RANK()` to highlight top performers on a daily basis.

## 📂 Repository Structure
- `data.sql`: Clean, commented SQL queries for all business analysis tasks.
- `user_sub_sql_mentor06nov.csv`: Raw submission dataset.

---
*Priyodeep Sinha | (https://www.linkedin.com/in/priyodeep-sinha/)*
