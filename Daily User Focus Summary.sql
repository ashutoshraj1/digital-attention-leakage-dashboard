use attention_analytics;
CREATE OR REPLACE VIEW vw_user_daily_focus AS
SELECT
    user_id,
    date,
    SUM(minutes_used) AS total_minutes_used,
    SUM(focus_minutes) AS total_focus_minutes,
    SUM(context_switches) AS total_context_switches,
    SUM(notifications) AS total_notifications,
    AVG(focus_rating) AS avg_focus_rating,
    AVG(distraction_intensity) AS avg_distraction_intensity
FROM digital_attention_fact
GROUP BY user_id, date;

-- Row count check

SELECT COUNT(*) FROM digital_attention_fact;

-- Sample data check

SELECT * FROM digital_attention_fact
LIMIT 10;

-- Performance check

EXPLAIN SELECT * FROM digital_attention_fact;

select * from digital_attention_fact;
