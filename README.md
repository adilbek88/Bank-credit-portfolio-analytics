# Banking portfolio analytics | Portfolio project
All 100,000 loans and 300,000 monthly snapshots are **synthetic**. This is a demonstration, not a real bank's financial data.

## Files
- `portfolio.sqlite` — SQLite database (`loans`, `monthly_snapshots`)
- `loans_synthetic.csv` — 100,000 synthetic loans
- `monthly_snapshots.csv` — 300,000 synthetic monthly records
- `analysis.sql`, `monthly_analysis.sql` — reproducible SQL
- `portfolio_report_v2.xlsx` — Excel summary and sample data
- `power_bi_measures.dax` — measures for Power BI
- `delinquency_trend.png` — preview of the time trend

## KPIs
snapshot_date  loans  balance_kzt  par30_pct  par90_pct  payments_kzt
   2026-08-31 100000 453813887153      10.46       2.29             0
   2026-09-30 100000 446575688807      14.82       2.55    7238198346
   2026-10-31 100000 439583530609      16.63       3.10    6992158198

## Power BI setup
1. Import `loans_synthetic.csv` and `monthly_snapshots.csv`.
2. Create one-to-many relationship on `loan_id`.
3. Create DAX measures from `power_bi_measures.dax`.
4. Add date slicer, PAR30/PAR90 line chart, balance card, payments card, region and product slicers.

**Limitations:** No native `.pbix` file has been created. Payment behavior and delinquency transitions are illustrative, not calibrated to real bank data. First snapshot is a starting stock with zero simulated payments. PAR metrics are balance-weighted; neither is a provision under IFRS 9. `monthly_interest_accrual_kzt` is not cash revenue.


## Interactive dashboard
Open `dashboard_interactive.html` in a browser; works offline, filter by region and product. See `PORTFOLIO_CASE.md` for employer-facing summary.
