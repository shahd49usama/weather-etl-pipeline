# 🌤️ Egypt Weather ETL Pipeline

An end-to-end data engineering project that extracts live weather data for
10 Egyptian cities from the OpenWeatherMap API, transforms it using the
Medallion Architecture (Bronze → Silver → Gold) in SQL Server, and presents
the results in an interactive Power BI dashboard.

## 🎯 Project Goal
Practice the full data flow: **API → Python → ETL → Bronze → Silver → Gold → SQL Server → Power BI**.

## 🏗️ Architecture
OpenWeatherMap API → Python → Bronze → Silver → Gold → SQL View → Power BI

## 🥉🥈🥇 Data Layers
| Layer | Purpose |
|---|---|
| **Bronze** | Raw API data, stored as received (temperature in Kelvin) |
| **Silver** | Cleaned data: Kelvin → Celsius, standardized city names, Region mapping, Temperature / Humidity / Cloud categories, Sunrise/Sunset converted to Cairo time, wind speed (km/h) and direction |
| **Gold** | Analytics-ready data with extra metrics: HeatIndex, ComfortScore, TempRank, WindCategory, TempRange. Exposed to Power BI via the `vw_WeatherDashboard` view |

## 📊 Power BI Dashboard
- **KPIs:** Avg / Max / Min Temperature, Avg Humidity, Number of Cities
- **Quick Insights:** Hottest, Coolest and Most Humid city, Earliest Sunrise, Latest Sunset, Last Update
- **Visuals:** Temperature by City, Humidity by City, Weather Conditions, Temperature Category, Temperature vs Humidity, Wind Speed, Comfort Score gauge, City Map, Details table
- **Slicers:** City, Region, WeatherMain

## 🛠️ Tech Stack
Python (requests, pandas, NumPy, SQLAlchemy, PyODBC) · SQL Server · Power BI (DAX) · OpenWeatherMap API

## 📁 Project Structure
├── weather_etl.py
├── weather.sql
├── WeatherDashboard.pbix
├── requirements.txt
├── .env.example
└── images/

## ▶️ How to Run
1. `pip install -r requirements.txt`
2. Copy `.env.example` to `.env` and add your OpenWeatherMap API key
3. Run `weather.sql` in SQL Server to create the database, schemas, tables and view
4. Run `python weather_etl.py`
5. Open `WeatherDashboard.pbix` and click Refresh

## 💡 Key Learnings
- Building a layered (Medallion) data warehouse
- Handling API errors and data-quality issues (e.g., a wrong-country city match fixed with the `,EG` country code)
- Data modeling for BI and designing a clean dashboard
