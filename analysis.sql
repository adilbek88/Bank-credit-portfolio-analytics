-- Демонстрационный кредитный портфель, синтетические данные
-- 1. Основные KPI
SELECT COUNT(*) AS loans,
       SUM(outstanding_balance_kzt) AS total_balance_kzt,
       ROUND(100.0*SUM(CASE WHEN days_past_due>=30 THEN outstanding_balance_kzt ELSE 0 END)/SUM(outstanding_balance_kzt),2) AS par30_pct,
       ROUND(100.0*SUM(CASE WHEN days_past_due>=90 THEN outstanding_balance_kzt ELSE 0 END)/SUM(outstanding_balance_kzt),2) AS par90_pct,
       ROUND(SUM(monthly_interest_accrual_kzt),2) AS monthly_interest_accrual_kzt
FROM loans;

-- 2. Просрочка по продуктам
SELECT product, COUNT(*) AS loan_count,
       SUM(outstanding_balance_kzt) AS balance_kzt,
       ROUND(100.0*SUM(CASE WHEN days_past_due>=30 THEN outstanding_balance_kzt ELSE 0 END)/SUM(outstanding_balance_kzt),2) AS par30_pct
FROM loans GROUP BY product ORDER BY balance_kzt DESC;

-- 3. Регионы с наибольшей просрочкой
SELECT region, COUNT(*) AS loan_count,
       ROUND(100.0*SUM(CASE WHEN days_past_due>=30 THEN outstanding_balance_kzt ELSE 0 END)/SUM(outstanding_balance_kzt),2) AS par30_pct
FROM loans GROUP BY region ORDER BY par30_pct DESC;
