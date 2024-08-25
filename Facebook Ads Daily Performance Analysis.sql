SELECT 
    ad_date,
    campaign_id,
    SUM(spend) AS total_spend,
    SUM(impressions) AS total_impressions,
    SUM(clicks) AS total_clicks,
    SUM(value) AS total_value,
    round(1.0 * SUM(spend) / NULLIF(SUM(clicks), 0), 2) AS "CPC",
    round(1.0 * SUM(spend) / NULLIF(SUM(impressions), 0), 2) * 1000 AS "CPM",
    round(1.0 * SUM(clicks) / NULLIF(SUM(impressions), 0), 2) * 100 AS "CTR",
    round(1.0 * SUM(value) / NULLIF(SUM(spend), 0), 2) * 100 AS "ROMI"
FROM public.facebook_ads_basic_daily
GROUP BY 
    ad_date, 
    campaign_id
ORDER BY ad_date
    