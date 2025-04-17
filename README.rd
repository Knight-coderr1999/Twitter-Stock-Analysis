# Woodstock: Using Twitter Sentiments to Predict Stock Price Change

## Overview

**Woodstock** is a real-time stock price prediction system powered by sentiment analysis of tweets. By analyzing public sentiment on Twitter regarding specific companies and the stock market, this project aims to identify patterns and correlations with stock price changes. The goal is to assist investors and analysts in making better-informed decisions.

- **Live Demo:** [Hugging Face Deployment](https://huggingface.co/spaces/Knight-coderr/StockAnalysis)

---

## Architecture

1. **Data Collection**  
   Tweets are collected using the Twitter API and Tweepy. Data is streamed via Amazon Kinesis and stored as CSV files in S3 using AWS Lambda. Live stock prices are fetched from the Alpha Vantage API. A trigger updates real-time data in Amazon DynamoDB.

2. **Sentiment Analysis**  
   TextBlob is used to perform sentiment analysis on tweets in real time.

3. **Data Integration**  
   Sentiment scores are merged with historical stock prices for training.

4. **Predictive Modeling**  
   Models including Random Forest, Gradient Boosting, SVR, and XGBoost were tested. XGBoost provided the best results after tuning.

5. **ML Lifecycle Management**  
   MLflow tracks experiment metrics and registers the best model for production.

6. **User Interface**  
   A Streamlit application lets users select a stock and time range to analyze sentiment and predict stock price changes. The app is deployed on Hugging Face Spaces.

---

## Benchmarking & Results

### Model Comparison (Mean Squared Error - MSE)

| Model             | Best Parameters                             | MSE        |
|------------------|----------------------------------------------|------------|
| Random Forest     | `max_depth=7, n_estimators=200`             | 13.02      |
| Gradient Boosting | `learning_rate=0.1, max_depth=3`            | 4.04       |
| SVR               | `C=10, epsilon=0.2`                          | 24.58      |
| **XGBoost**       | `learning_rate=0.1, max_depth=5`            | **5.82**   |

---


## Tech Stack

- **Languages & Libraries:** Python, Pandas, NumPy, Scikit-learn, XGBoost, TextBlob
- **Data Sources:** Twitter API, Alpha Vantage API
- **Cloud Services:** AWS Lambda, S3, DynamoDB
- **Model Tracking:** MLflow
- **Web App:** Streamlit
- **Deployment:** Hugging Face Spaces
- **Version Control:** Git, GitHub

---

## Methodology

1. **Data Collection:** Tweets and stock prices were collected over a 6-month period.
2. **Sentiment Analysis:** Performed using TextBlob on real-time tweets.
3. **Modeling:** Predictive models were trained using stock and sentiment data.
4. **Evaluation:** Models were evaluated using MSE, R², and MAE metrics.
5. **Conclusion:** TextBlob was effective for sentiment, and XGBoost outperformed other models in price prediction.

---

## Future Work

- Upgrade sentiment analysis using transformer models like BERT.
- Expand data sources (e.g., Reddit, financial news).
- Improve model explainability using SHAP or LIME.
- Integrate portfolio-level analysis and optimization.

---

## Contributors

- Soumalya Mondal ( M24DE2031 )
- Joel Paul ( M24DE2012 )

---

## References

- Twitter Developer API
- Alpha Vantage Stock API
- TextBlob for Sentiment Analysis
