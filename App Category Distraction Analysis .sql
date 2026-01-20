use attention_analytics;
CREATE OR REPLACE VIEW vw_app_category_distraction AS
SELECT
    app_category,
    COUNT(DISTINCT user_id) AS users_count,
    SUM(minutes_used) AS total_minutes_used,
    AVG(distraction_intensity) AS avg_distraction_intensity,
    AVG(context_switches) AS avg_context_switches,
    AVG(focus_rating_norm) AS avg_focus_rating_norm
FROM digital_attention_fact
GROUP BY app_category;

-- Row count check

SELECT COUNT(*) FROM digital_attention_fact;

-- Sample data check

SELECT * FROM digital_attention_fact
LIMIT 10;

-- Performance check

EXPLAIN SELECT * FROM digital_attention_fact;
select * from digital_attention_fact;
