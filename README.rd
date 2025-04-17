# Woodstock: Using Twitter Sentiments to Predict Stock Price Movements

## Overview

**Woodstock** is a real-time stock prediction system powered by sentiment analysis of Twitter data. By evaluating public sentiment surrounding companies and market trends, the project identifies correlations between social media buzz and stock price fluctuations. The goal is to help investors and analysts make data-driven decisions.

 **Live Demo:** [Hugging Face Deployment](https://huggingface.co/spaces/Knight-coderr/StockAnalysis)

---

## System Architecture

1. **Data Collection**  
   - Tweets are collected via the Twitter API using Tweepy.
   - Streaming is handled through Amazon Kinesis.
   - Tweets are stored as CSV files in S3 via AWS Lambda.
   - Live stock prices are fetched using the Alpha Vantage API.
   - Real-time data updates are triggered and stored in Amazon DynamoDB.

2. **Sentiment Analysis**  
   - Sentiments are extracted from tweets using **TextBlob** in real time.

3. **Data Integration**  
   - Sentiment scores are aligned with historical stock price data for modeling.

4. **Predictive Modeling**  
   - Multiple models were tested: Random Forest, Gradient Boosting, SVR, and XGBoost.
   - **XGBoost** performed best after hyperparameter tuning.

5. **ML Lifecycle Management**  
   - **MLflow** is used to track experiments and manage model versions.

6. **User Interface**  
   - A **Streamlit** web app allows users to select stocks, view sentiment trends, and forecast price changes.
   - Deployed via **Hugging Face Spaces**.

---

## Benchmarking & Results

### Model Performance (Mean Squared Error - MSE)

| Model             | Best Parameters                             | MSE        |
|------------------|----------------------------------------------|------------|
| Random Forest     | `max_depth=7, n_estimators=200`             | 13.02      |
| Gradient Boosting | `learning_rate=0.1, max_depth=3`            | 4.04       |
| SVR               | `C=10, epsilon=0.2`                          | 24.58      |
| **XGBoost**       | `learning_rate=0.1, max_depth=5`            | **5.82**   |

---

## Tech Stack

- **Languages & Libraries:** Python, Pandas, NumPy, Scikit-learn, XGBoost, TextBlob  
- **APIs & Data Sources:** Twitter API, Alpha Vantage API  
- **Cloud Services:** AWS Lambda, S3, DynamoDB  
- **Model Tracking:** MLflow  
- **Web Framework:** Streamlit  
- **Deployment Platform:** Hugging Face Spaces  
- **Version Control:** Git & GitHub

---

## Methodology

1. **Data Collection:** Tweets and stock prices gathered over a 6-month period.
2. **Sentiment Analysis:** Conducted in real time using TextBlob.
3. **Model Training:** Trained on combined stock and sentiment features.
4. **Evaluation:** Models assessed with MSE, R², and MAE.
5. **Conclusion:** TextBlob proved effective for quick sentiment analysis, while XGBoost yielded the best predictive performance.

---

## Future Improvements

- Enhance sentiment analysis using transformer models like **BERT**.
- Incorporate additional sources (e.g., Reddit, financial news).
- Improve explainability with **SHAP** or **LIME**.
- Expand to portfolio-level analysis and optimization.

---

## Contributors

- **Soumalya Mondal** (M24DE2031)  
- **Joel Paul** (M24DE2012)

---

## References

- [Twitter Developer API](https://developer.twitter.com/)  
- [Alpha Vantage API](https://www.alphavantage.co/)  
- [TextBlob](https://textblob.readthedocs.io/en/dev/) for Sentiment Analysis
