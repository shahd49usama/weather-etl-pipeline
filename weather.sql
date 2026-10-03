create database weather_dwh2;
use weather_dwh2;
create schema bronze;
create schema silver;
create schema gold;
create table bronze.Bronze_WeatherData (
    City VARCHAR(100),
    Country VARCHAR(100),
    Latitude FLOAT,
    Longitude FLOAT,
    Temperature FLOAT,
    TempMin FLOAT,
    TempMax FLOAT,
    Pressure INT,
    Humidity INT,
    Cloudiness INT,
    Visibility INT,
    WeatherMain VARCHAR(100),
    WeatherDescription VARCHAR(100),
    WindSpeed FLOAT,
    WindDeg INT,
    Sunrise BIGINT,
    Sunset BIGINT,
    IngestionTime DATETIME2
);

select * 
from bronze.weather 
where LoadTime =  (select max(LoadTime)  from bronze.weather)

CREATE TABLE silver.Silver_WeatherData (
    City VARCHAR(100),
    Country VARCHAR(100),
    Latitude FLOAT,
    Longitude FLOAT,
    Temperature FLOAT,         
    TempMin FLOAT,       
    TempMax FLOAT,         
    Pressure INT,
    Humidity INT,
    Cloudiness INT,
    CloudCategory VARCHAR(100),
    Visibility_km FLOAT,
    WindSpeed_ms FLOAT,         
    WindSpeed_kmh FLOAT,
    WindDeg INT,
    WindDirection VARCHAR(100),
    WeatherMain VARCHAR(100),
    WeatherDescription VARCHAR(100),
    Sunrise DATETIME2,
    Sunset DATETIME2,
    DaylightHours FLOAT,
    Region VARCHAR(100),
    TemperatureCategory VARCHAR(100),
    HumidityCategory VARCHAR(100),
    IngestionTime DATETIME2     
);
SELECT * FROM silver.Silver_WeatherData;

CREATE TABLE gold.Gold_WeatherData (
    ID                  INT IDENTITY(1,1) PRIMARY KEY,
    City                VARCHAR(100),
    Country             VARCHAR(100),
    Latitude            FLOAT,
    Longitude           FLOAT,
    Temperature         FLOAT,
    TempMin             FLOAT,
    TempMax             FLOAT,
    TempRange           FLOAT,
    HeatIndex           FLOAT,
    Pressure            INT,
    Humidity            INT,
    Cloudiness          INT,
    CloudCategory       VARCHAR(100),
    Visibility_km       FLOAT,
    WindSpeed_ms        FLOAT,
    WindSpeed_kmh       FLOAT,
    WindCategory        VARCHAR(100),
    WindDeg             INT,
    WindDirection       VARCHAR(100),
    WeatherMain         VARCHAR(100),
    WeatherDescription  VARCHAR(100),
    Sunrise             DATETIME2,
    Sunset              DATETIME2,
    DaylightHours       FLOAT,
    Day_Night           VARCHAR(100),
    Region              VARCHAR(100),
    TemperatureCategory VARCHAR(100),
    HumidityCategory    VARCHAR(100),
    ComfortScore        FLOAT,
    ComfortCategory     VARCHAR(100),
    TempRank            INT,
    WeatherDate         DATE,
    WeatherHour         INT,
    IngestionTime       DATETIME2
);


CREATE VIEW gold.vw_WeatherDashboard
AS
SELECT
    ID,
    City,
    Country,
    Latitude,
    Longitude,
    Temperature,
    TempMin,
    TempMax,
    TempRange,
    HeatIndex,
    Pressure,
    Humidity,
    Cloudiness,
    CloudCategory,
    Visibility_km,
    WindSpeed_ms,
    WindSpeed_kmh,
    WindCategory,
    WindDeg,
    WindDirection,
    WeatherMain,
    WeatherDescription,
    Sunrise,
    Sunset,
    DaylightHours,
    Region,
    TemperatureCategory,
    HumidityCategory,
    ComfortScore,
    ComfortCategory,
    TempRank,
    WeatherDate,
    WeatherHour,
    IngestionTime
FROM gold.Gold_WeatherData;
SELECT * FROM gold.Gold_WeatherData;
SELECT * FROM gold.vw_WeatherDashboard;
