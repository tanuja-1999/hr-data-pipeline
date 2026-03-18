# HR Extract Pipeline — Setup & Development Guide

## 📌 Purpose of This Document :

This document provides a **step-by-step guide** to set up and build the project from scratch, along with **clear explanations of why each step is performed**.

This acts as a **revision guide + real-world workflow reference**.

---

# 🚀 STEP 1 — Create Git Repository

## What We Did

* Created a new repository on GitHub:

```
hr_extract_pipeline
```

## Why This Step Matters

Git is used for:

* Version control (track changes)
* Collaboration
* Backup of code
* Industry standard workflow

👉 In real companies, **every data project lives inside Git**

---

# 🚀 STEP 2 — Clone Repository into VSCode

## Command

```bash
git clone <repo-url>
cd hr_extract_pipeline
code .
```

## Why We Clone

* Creates a **local copy** of the remote repository
* Allows development on your machine
* Syncs with GitHub

---

# 🚀 STEP 3 — Check Git Status

```bash
git status
```

## Output Example

```
On branch main
nothing to commit
```

## Why This Matters

* Shows current branch
* Shows changed/untracked files
* Helps avoid mistakes before committing

---

# 🚀 STEP 4 — Understand Git Branches

## What is a Branch?

A branch is:

```
A separate version of your code
```

## Example

```bash
git branch feature/hr-model
git checkout feature/hr-model
```

## Why Branches Are Important

| Reason           | Explanation               |
| ---------------- | ------------------------- |
| Safe development | No risk to main code      |
| Parallel work    | Multiple features at once |
| Code reviews     | PR-based workflows        |

👉 In companies:

```
main → production
dev → integration
feature → development
```

---

# 🚀 STEP 5 — Create Project Structure

We create folders to organize the project properly.

## Structure

```
hr_extract_pipeline
│
├── data_pipeline/
├── sql_queries/
├── erd/
├── data/
└── README.md
```

## Why This Structure?

| Folder        | Purpose                |
| ------------- | ---------------------- |
| data_pipeline | transformation scripts |
| sql_queries   | KPI queries            |
| erd           | data model diagram     |
| data          | raw data (SQLite file) |

👉 This mirrors **real production data projects**

---

# 🚀 STEP 6 — Add Files to Git

```bash
git add .
```

## What This Does

* Stages all files for commit

---

# 🚀 STEP 7 — Commit Changes

```bash
git commit -m "Initial project setup"
```

## What is a Commit?

A commit is:

```
A snapshot of your project at a point in time
```

## Why Commits Matter

* Track changes
* Rollback capability
* Code history

---

# 🚀 STEP 8 — Push to GitHub

```bash
git push origin main
```

## What This Does

* Uploads your local changes to GitHub

---

# 🚀 STEP 9 — Recommended Workflow (Real Industry)

## Standard Flow

```bash
git checkout -b feature/model-design
git add .
git commit -m "Add dimensional model design"
git push origin feature/model-design
```

Then:

* Create Pull Request (PR)
* Review changes
* Merge into main

---

# 🚀 STEP 10 — Why This Workflow Matters

Without Git:

```
Code gets lost
No history
No collaboration
```

With Git:

```
Safe development
Traceability
Professional workflow
```

---

# 🧠 Key Concepts Summary

| Concept      | Meaning           |
| ------------ | ----------------- |
| Repository   | project container |
| Clone        | copy repo locally |
| Commit       | save changes      |
| Push         | upload changes    |
| Branch       | parallel version  |
| Pull Request | merge request     |

---

# ⚠️ Common Mistakes Beginners Make

❌ Not using branches
❌ Pushing everything to main
❌ No meaningful commit messages
❌ Not checking `git status`

---

# ✅ Best Practices

✔ Use meaningful commit messages
✔ Use branches for features
✔ Push frequently
✔ Keep repo organized

---

# 🧩 Next Steps

After setup, we will:

1. Explore SQLite database
2. Design dimensional model (ERD)
3. Build data pipeline (SQL)
4. Create KPI queries
5. Document assumptions

---

# ⏱ Time Tracking (Fill This Later)

| Task          | Time Spent |
| ------------- | ---------- |
| Setup         |            |
| Modeling      |            |
| Pipeline      |            |
| Queries       |            |
| Documentation |            |

---

# ✍️ Notes

This document is meant to be:

* a learning guide
* a revision checklist
* a real-world workflow reference

---

# 👩‍💻 Author

Tanuja Kesireddy
Data Engineering Project
