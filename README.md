# Flash Sale Profitability Analysis

## Why High Revenue Does Not Always Mean High Profit

An end-to-end SQL-based business analysis of a large Indian fashion and lifestyle e-commerce company to investigate how flash sales impact profitability.

## Methodology

### 1. Data Validation

Performed sanity checks to ensure data quality and reliability:

- Revenue, cost, and profit consistency checks
- Discount validation
- Unit economics validation
- Return handling verification
- Duplicate order detection

### 2. Problem Validation

Compared monthly:
- Revenue
- Profit
- Profit margins
- Order volume

This confirmed that high-revenue months were frequently associated with weaker profitability.

### 3. Exploratory Analysis

Analyzed performance across:
- Customer segments
- Categories and sub-categories
- Cities
- Return rates

At an overall level, the business appeared healthy, indicating that the issue was hidden within aggregated metrics.

### 4. Time-Based Segmentation

Separated the data into:
- Flash sale periods
- Normal business periods

This revealed the true profitability behavior during promotional campaigns.

## Key Findings

### Profitability Declined During Flash Sales

- Profit per order dropped by approximately 60–65% during flash sale periods
- Total profit during flash periods was significantly lower than normal periods
- Revenue remained high despite margin deterioration

### Discount Depth Was the Primary Driver

- 0–10% discounts produced the strongest and most stable profitability
- 25–40% discounts increased order volume but weakened margins significantly
- Discounts above 40% frequently resulted in loss-making orders

### The Problem Was System-Wide

Profit deterioration was observed consistently across:
- Customer segments
- Product categories
- Cities

This confirmed that the issue was strategic rather than localized.

### Returns Were Not the Main Cause

Return rates increased slightly during flash sales but did not account for the majority of profit decline.

The primary issue was excessive discounting.

## Stress Testing the Analysis

Several alternative hypotheses were tested:

- Customer acquisition benefits
- Volume scaling offsetting margin loss
- Category-specific profitability issues
- Returns as the primary cause

The analysis consistently showed that deep discounting was the dominant factor reducing profitability.

## Final Conclusion

Flash sales increased revenue and order volume but significantly reduced profitability due to aggressive discounting.

Once discount levels exceeded approximately 40%, orders frequently became loss-making, meaning that additional volume amplified losses instead of improving profit.

The analysis suggests that flash sales, in their current form, are not financially sustainable and require redesign through stricter discount controls and profit-focused performance metrics.

## Recommendations

- Limit discount levels to approximately 25–30%
- Avoid broad 40%+ discount campaigns
- Measure campaign success using profit-based KPIs rather than revenue alone
- Use targeted and time-limited promotions
- Monitor profit per order during promotional periods.

## Tools Used

- SQL
- Business Analysis
- Data Validation and Exploratory Analysis

## Future Improvements

- Build an executive Power BI dashboard
- Add what-if analysis for discount optimization
- Extend analysis to customer lifetime value (CLV)

## About Me

Aspiring Data Analyst focused on solving real-world business problems using data and delivering actionable insights.

LinkedIn:
[Shiva Kumar Bandari](https://linkedin.com/in/shiva-kumar-bandari-6851963a0)
