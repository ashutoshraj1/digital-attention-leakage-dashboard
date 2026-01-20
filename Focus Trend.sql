use attention_analytics;
CREATE OR REPLACE VIEW v_focus_trend AS
SELECT
  date,
  AVG(rolling_focus_7d) AS rolling_focus_7d
FROM digital_attention_fact
GROUP BY date
ORDER BY date;

-- Row count check

SELECT COUNT(*) FROM digital_attention_fact;

-- Sample data check

SELECT * FROM digital_attention_fact
LIMIT 10;

-- Performance check

EXPLAIN SELECT * FROM digital_attention_fact;