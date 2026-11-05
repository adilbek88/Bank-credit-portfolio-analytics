-- Time series and payment metrics
SELECT snapshot_date, COUNT(*) AS loans, SUM(balance_kzt) AS balance_kzt,
 ROUND(100.0 * SUM(CASE WHEN days_past_due >= 30 THEN balance_kzt ELSE 0 END)
       / NULLIF(SUM(balance_kzt), 0), 2) AS par30_pct,
 ROUND(100.0 * SUM(CASE WHEN days_past_due >= 90 THEN balance_kzt ELSE 0 END)
       / NULLIF(SUM(balance_kzt), 0), 2) AS par90_pct,
 SUM(payment_received_kzt) AS payments_kzt
FROM monthly_snapshots
GROUP BY snapshot_date ORDER BY snapshot_date;
