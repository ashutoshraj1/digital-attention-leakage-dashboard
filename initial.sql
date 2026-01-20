CREATE DATABASE attention_analytics;
USE attention_analytics;
CREATE TABLE digital_attention_fact (
    user_id VARCHAR(10),
    date DATE,
    app_name VARCHAR(50),
    app_category VARCHAR(30),
    minutes_used FLOAT,
    notifications INT,
    context_switches INT,
    focus_minutes INT,
    focus_rating FLOAT,
    focus_efficiency FLOAT,
    distraction_intensity FLOAT,
    focus_rating_norm FLOAT,
    rolling_focus_7d FLOAT
);
SET GLOBAL local_infile = 1;

SHOW VARIABLES LIKE 'local_infile';
LOAD DATA LOCAL INFILE '/Users/ashutoshraj/Downloads/Digital_Attention_Leakage_Index/python/digital_attention_cleaned.csv'
INTO TABLE digital_attention_fact
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
  user_id,
  @date,
  app_name,
  app_category,
  minutes_used,
  notifications,
  context_switches,
  focus_minutes,
  focus_rating,
  focus_efficiency,
  distraction_intensity,
  focus_rating_norm,
  rolling_focus_7d
)
SET date = DATE(@date);

USE attention_analytics;

TRUNCATE TABLE digital_attention_fact;
SELECT COUNT(*) FROM digital_attention_fact;
SHOW VARIABLES LIKE 'secure_file_priv';
SELECT COUNT(*) FROM digital_attention_fact;
select * from digital_attention_fact;






