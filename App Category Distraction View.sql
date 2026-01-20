use attention_analytics;
CREATE OR REPLACE VIEW v_category_distraction AS
SELECT
  app_category,
  AVG(distraction_intensity) AS avg_distraction,
  AVG(focus_efficiency) AS avg_focus_efficiency
FROM digital_attention_fact
GROUP BY app_category;

-- Row count check

SELECT COUNT(*) FROM digital_attention_fact;

-- Sample data check

SELECT * FROM digital_attention_fact
LIMIT 10;

-- Performance check

EXPLAIN SELECT * FROM digital_attention_fact;