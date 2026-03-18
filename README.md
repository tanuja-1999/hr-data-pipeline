# HR Analytics Data Pipeline (End-to-End Project)

## 📌 Project Overview

This project demonstrates an **end-to-end data engineering and analytics workflow** built on top of a fictional HR dataset.

The objective is to design and implement a **dimensional data model (Star Schema)** and build a **data pipeline** to calculate key HR metrics for workforce analysis in 2023.

The solution focuses on transforming raw HR data into **analytics-ready datasets** that can be easily consumed by analysts and BI tools.

---

## 🎯 Business Objective

The HR team aims to analyze employee data to improve:

* Recruitment efficiency
* Employee performance evaluation
* Workforce planning
* Compensation strategies

The pipeline enables calculation of **monthly KPIs** such as:

* Total number of active employees
* Ratio of high performers by department
* Number of new hires by job position
* Recruiting cost per hire by source
* Number of active managers
* Number of direct reports per manager

---

## 🧱 Architecture Overview

```id="ybv7q3"
SQLite Source (hr_extract.db)
        ↓
Staging Layer (cleaned raw data)
        ↓
Dimensional Model (Star Schema)
        ↓
Fact Tables (HR events)
        ↓
SQL Queries (KPIs)
```

---

## 🗂️ Project Structure

```id="l7y3tt"
hr_extract_pipeline
│
├── data/
│   └── hr_extract.db
│
├── data_pipeline/
│   ├── staging.sql
│   ├── dimensions.sql
│   ├── facts.sql
│   └── pipeline_runner.sql / python
│
├── sql_queries/
│   ├── kpi_active_employees.sql
│   ├── kpi_high_performers.sql
│   ├── kpi_new_hires.sql
│   ├── kpi_recruiting_cost.sql
│   ├── kpi_active_managers.sql
│   └── kpi_direct_reports.sql
│
├── erd/
│   └── erd.png / erd.drawio
│
├── docs/
│   └── setup_guide.md
│
└── README.md
```

---

## 🧠 Data Modeling Approach

✅ Step 1 — Identify the Business Process

refer business objective line 13

✅ Step 2 — Define the Grain (Most Critical Step)
Objective

Define what one row represents in each fact table.

Important Insight

This project involves multiple business events, so we define multiple fact tables, each with a clear and consistent grain.

Fact Tables and Their Grains
1. Workforce Snapshot
1 row = 1 employee per month

Used for:

Active employees

Managers

Department analysis

2. Hiring Events
1 row = 1 employee hire event

Used for:

New hires

Hiring trends

3. Performance Reviews
1 row = 1 employee performance review

Used for:

High performer ratio

4. Recruiting Costs
1 row = 1 recruiting resource per month

Used for:

Cost per hire

Cost analysis by source

Why Multiple Fact Tables?

Each KPI represents a different type of business event:

KPI	Required Grain
Active Employees	employee per month
New Hires	hire event
Performance	review event
Recruiting Cost	resource per month

👉 Mixing these into one table leads to:

duplicate counts

incorrect aggregations

complex queries

✅ Step 3 — Identify Dimensions
Objective

Define descriptive attributes that provide context to facts.

Dimensions Identified

dim_employee → employee details

dim_department → department classification

dim_date → time-based analysis

dim_job → job roles

dim_manager → hierarchy relationships

dim_recruiting_source → recruiting channels

Purpose

Dimensions enable:

filtering (e.g., by department)

grouping (e.g., by month)

slicing data for analysis

✅ Step 4 — Identify Facts (Metrics)
Objective

Define measurable business metrics.

Facts Identified

Employee active flag

Hire count

Performance rating

Recruiting cost

Example Metrics

Total active employees

High performer ratio

Cost per hire

Number of direct reports

### Star Schema Design

* **Fact Tables**

  * `fact_workforce_snapshot`
  * `fact_hiring`
  * `fact_performance`
  * `fact_recruiting_cost`

* **Dimension Tables**

  * `dim_employee`
  * `dim_department`
  * `dim_date`
  * `dim_job`
  * `dim_manager`
  * `dim_recruiting_source`

This design ensures:

* fast query performance
* simple joins
* scalability

---

## 🔄 Data Pipeline

The pipeline transforms raw SQLite data into structured warehouse tables.

### Steps:

1. Load raw data from SQLite
2. Create staging tables
3. Build dimension tables
4. Build fact tables
5. Run KPI queries

Pipeline execution ensures **correct dependency order**.

---

## 📊 Key KPIs Implemented

Each KPI is implemented as a separate SQL script.

| KPI                      | Description                      |
| ------------------------ | -------------------------------- |
| Active Employees         | Total active employees per month |
| High Performers Ratio    | % of employees rated high        |
| New Hires                | Count of hires by role           |
| Recruiting Cost per Hire | Cost efficiency by source        |
| Active Managers          | Managers currently active        |
| Direct Reports           | Employees per manager            |

---

## 🧪 Assumptions

* Employees table represents the latest snapshot
* Hire date determines new hires
* Performance reviews apply only to employees with ≥1 year tenure
* Recruiting costs are aggregated monthly
* Managers are identified via role or hierarchy

---

## ⚠️ Limitations / Trade-offs

* Historical employee changes are not fully tracked (no SCD implementation yet)
* Some relationships are inferred due to limited dataset
* Simplified modeling for demonstration purposes

---

## ⚙️ How to Run This Project

### 1. Clone Repository

```id="sl63ur"
git clone <repo-url>
cd hr_extract_pipeline
```

### 2. Open SQLite Database

Use tools like:

* DB Browser for SQLite
* DBeaver
* SQLiteStudio

---

### 3. Run Data Pipeline

Execute scripts in order:

```id="ny02k0"
1. staging.sql
2. dimensions.sql
3. facts.sql
```

OR run automated pipeline script.

---

### 4. Run KPI Queries

Navigate to:

```id="i9e6lh"
sql_queries/
```

Execute each KPI query individually.

---

## 🧠 Key Skills Demonstrated

* Data modeling (Star Schema, Kimball methodology)
* SQL transformation pipelines
* Data pipeline design
* Analytical query design
* Business KPI translation
* Data warehouse concepts

---

## 🎯 Interview Highlights

This project demonstrates:

* Ability to translate business requirements into data models
* Understanding of fact vs dimension design
* Experience with end-to-end pipeline development
* Structured approach to analytics engineering

---

## ⏱️ Time Spent (Approximate)

| Task                 | Time |
| -------------------- | ---- |
| Setup & Exploration  |      |
| Data Modeling        |      |
| Pipeline Development |      |
| KPI Queries          |      |
| Documentation        |      |

---

## 👩‍💻 Author

Tanuja Kesireddy
Aspiring Data Engineer | Analytics Engineering Projects
