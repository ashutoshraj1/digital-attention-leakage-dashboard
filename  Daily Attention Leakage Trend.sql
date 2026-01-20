USE attention_analytics;
CREATE OR REPLACE VIEW v_daily_attention AS
SELECT
  date,
  user_id,
  SUM(minutes_used) AS total_minutes,
  SUM(context_switches) AS total_context_switches,
  AVG(focus_rating) AS avg_focus_rating
FROM digital_attention_fact
GROUP BY date, user_id;

-- Row count check

SELECT COUNT(*) FROM digital_attention_fact;

-- Sample data check

SELECT * FROM digital_attention_fact
LIMIT 10;

-- Performance check

EXPLAIN SELECT * FROM digital_attention_fact;









