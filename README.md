# EIA Energy Production Analytics: End-to-End on Microsoft Fabric

An end-to-end analytics solution built on **Microsoft Fabric** that ingests, cleans, models, and visualizes global energy production data from the **U.S. Energy Information Administration (EIA)**. The project takes raw, messy source data all the way through to an interactive Power BI dashboard, following modern data-engineering practices: medallion architecture, dimensional modeling, and pipeline orchestration.

---

## Overview

This project demonstrates a complete data workflow:

**Raw EIA data, cleaned and structured, into a star schema, semantic model, and interactive dashboard**, with an automated pipeline tying it together.

The goal was to turn unstructured, inconsistently formatted energy production data into a clean, query-ready model that answers questions like *which countries produce the most, how production trends over time, and how output breaks down by product type.*

---

## Tech Stack

- **Microsoft Fabric:** Lakehouse, notebooks, Spark SQL, Data Factory pipelines
- **SQL (Spark SQL):** transformation, cleaning, aggregation, window functions
- **Python (pandas):** data wrangling (regex, forward-fill for hierarchical data)
- **Power BI:** semantic model, relationships, interactive dashboard
- **Medallion architecture:** Bronze / Silver / Gold layering

---

## Architecture

```
EIA source data
      |
      v
  BRONZE   raw ingested data (immutable)
      |
      v
  SILVER   cleaned, typed, standardized (row-level)
      |
      v
   GOLD    aggregated, business-ready summaries
      |
      v
 STAR SCHEMA   fact + dimension tables
      |
      v
 SEMANTIC MODEL -> POWER BI DASHBOARD
```

---

## Data Model (Star Schema)

A clean star schema with a central fact table and supporting dimensions:

- **Fact:** `fact_world_energy_data`, production values (measures) with foreign keys
- **Dimensions:**
  - `dim_country`: standardized country names
  - `dim_prod_description`: product / production type
  - `dim_date`: full date dimension (year, quarter, month) for time analysis

Relationships are defined one-to-many (dimension to fact), enabling slice-and-dice analysis without manual joins.

---

## Key Steps & Challenges Solved

**Data cleaning (the hard part):**
- Parsed inconsistent, non-standard formats and corrected column/header issues
- Cast text fields to correct numeric and date types (e.g., production volumes as `DOUBLE` to preserve precision)
- Used **regex and forward-fill** to reshape hierarchical data where country names appeared as header rows and needed to be propagated down to their data rows
- Separated descriptive rows from data rows using subqueries

**Modeling:**
- Designed and deduplicated dimension tables (one row per key) for valid relationships
- Built a granular fact table holding foreign keys and numeric measures only
- Created a Power BI semantic model with correct relationships

**Orchestration:**
- Built an automated **Fabric Data Factory pipeline** that runs the ETL notebook, refreshes the semantic model, and sends a completion notification, making the whole flow repeatable and reliable

---

## Dashboard

The Power BI dashboard provides:
- Production by country (ranked)
- Production by product type
- Production trends over time (year / quarter / month)
- Interactive slicers for filtering

---

## Repository Contents

```
├── notebooks/        Fabric notebooks (ingestion, cleaning, modeling)
├── images/           dashboard and star-schema screenshots
└── README.md
```

---

## About

Built by **Tola Awoniyi**, a Senior Data Analyst / BI professional with 11+ years in the energy sector, combining deep domain expertise with modern data skills (SQL, Microsoft Fabric, Power BI).

Email: awoniyibabatola@gmail.com
