# 📊 Flash Sale Profitability Analysis  
### 🚀 Why High Revenue Doesn’t Always Mean High Profit

An end-to-end SQL-based business analysis of a large Indian fashion e-commerce company to uncover why flash sales increase revenue but hurt profitability.

Flash sales are commonly used in e-commerce to boost order volume and revenue through heavy discounts.

However, this project investigates a critical business question:

👉 Do flash sales actually improve profitability, or do they create a misleading picture of growth?

Using transactional data from a large Indian fashion and lifestyle e-commerce company (Livo), this project uncovers how discount strategies impact revenue, profit, and customer behavior.
## 🎯 Business Problem

The company observed:

- 📈 Strong increase in revenue and order volume during flash sales  
- 📉 Unexpected decline in profit margins  

Despite high-performing sales periods, profitability did not improve.

This raised a key question:

👉 Why are our best revenue months also our weakest profit months?
## 🧠 Approach & Methodology

### 1️⃣ Data Validation
Performed sanity checks to ensure data reliability:
- Revenue, cost, and profit consistency  
- Discount validity  
- Unit economics (price vs cost)  
- Return handling  
- Duplicate order detection  

---

### 2️⃣ Problem Validation
- Compared monthly revenue vs profit  
- Identified months where:
  - Revenue was high  
  - Profit was disproportionately low  

---

### 3️⃣ Identifying Hidden Patterns
Initial analysis across:
- Customer segments  
- Categories  
- Cities  

Showed stable metrics, indicating the issue was hidden in aggregated data.

---

### 4️⃣ Time-Based Segmentation
Split data into:
- 🔥 FLASH periods (high discount months)  
- 📅 NORMAL periods  

This revealed the true behavior of the business.
## 📊 Key Findings

### 🔻 Profit Collapse During Flash Sales
- Profit per order dropped by ~60–65%  
- Total profit was ~80% lower than normal periods  
- Despite similar revenue levels  

---

### 💸 Discount Depth is the Root Cause
- 0–10% → Highest profitability and stable demand  
- 25–40% → High volume but weak margins  
- 40%+ → Often loss-making per order  

---

### 🧩 Not a Segment or Category Problem
Profit decline observed across:
- All customer segments  
- All categories  
- All cities  

---

### 🔁 Returns Are Not the Main Driver
- Return rates increased slightly  
- But were not the primary cause of losses  

---

### ⚠️ Revenue Illusion
Flash sales create the illusion of growth:
- Revenue increases  
- Profit significantly decreases  

👉 Volume does NOT compensate for margin loss
## 🧪 Stress Testing the Analysis

Tested multiple scenarios:

- ❌ Customer acquisition benefit → Not supported  
- ❌ Higher volume compensates losses → Not supported  
- ❌ Category-specific issue → Not supported  
- ❌ Returns as root cause → Not supported  

✅ Conclusion remained consistent across all tests:
Deep discounting is structurally damaging profitability.
## 📌 Final Conclusion

Flash sales increase revenue but significantly reduce profitability due to aggressive discounting.

👉 Once discounts exceed ~40%, each order becomes loss-making  
👉 Higher order volume amplifies losses instead of improving profit  

Flash sales, in their current form, are not sustainable.
## 💡 Recommendations

- Cap discounts at ≤25–30%  
- Avoid 40%+ discount campaigns  
- Focus on profit-based KPIs instead of revenue alone  
- Use targeted and time-limited promotions  
- Monitor profit per order during campaigns  
## 🛠️ Tools Used

- SQL (Data Analysis)
- Business Analysis & Problem Solving
## 📌 Future Improvements

- Build Power BI dashboard for visualization  
- Add what-if analysis for discount optimization  
- Extend to customer lifetime value (CLV)  
## 🙋 About Me

Aspiring Data Analyst focused on solving real-world business problems using data.

🔗 LinkedIn: [Shiva Kumar Bandari](https://www.linkedin.com/in/shiva-kumar-bandari-6851963a0/)