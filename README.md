# Smart Canteen and Waiting System
### AI-Based SmartQueue and Waiting Time Prediction System for a College Canteen

[![Review 3 Milestone](https://img.shields.io/badge/Milestone-Review%203%20Passed-success?style=flat-square)](docs/DEVELOPMENT_PROGRESS.md)
[![Project Completion](https://img.shields.io/badge/Completion-88.5%25%20Verified-blue?style=flat-square)](docs/DEVELOPMENT_PROGRESS.md)
[![Test Suite](https://img.shields.io/badge/Tests-27%2F27%20Passing-brightgreen?style=flat-square)](docs/TESTING_DOCUMENTATION.md)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](LICENSE)
[![GitHub Repo](https://img.shields.io/badge/GitHub-smart--canteen--and--waiting--system-indigo?style=flat-square&logo=github)](https://github.com/ss37666555-cmyk/smart-canteen-and-waiting-system)

---

## 📌 Executive Summary

During short 15-to-30-minute lecture intervals, college dining halls face extreme counter congestion. Students endure chaotic queues without knowing whether food will be served in 5 or 25 minutes, leading to missed classes and operational chaos.

**SmartQueue** is a full-stack, responsive web application engineered to modernize campus dining operations:
- **For Students:** Digital token dispenser (`A127`), live crowd metrics, transparent AI-based waiting time estimations, and categorized food menus.
- **For Canteen Operators:** Dedicated back-office dashboard (`/admin`) for sequential order dispatching, order completion tracking, and real-time counter capacity adjustment.

---

## 📑 Technical Documentation Library (`docs/`)

For in-depth evaluation and engineering specifications, refer to our dedicated documentation suite:

| Document | Purpose & Key Contents |
|---|---|
| 📘 [**Project Overview**](docs/PROJECT_OVERVIEW.md) | Campus problem statement, Review 2 &rarr; Review 3 roadmap, user personas, and project scope. |
| 🧩 [**Functional Modules**](docs/FUNCTIONAL_MODULES.md) | Exhaustive specifications for all 8 modules (requirements, implementation, I/O, functions, and status). |
| 📈 [**Development Progress**](docs/DEVELOPMENT_PROGRESS.md) | Mathematical progress calculation (35% &rarr; 88.5%), deliverable matrix, challenges, and future milestones. |
| 🏛️ [**System Architecture**](docs/SYSTEM_ARCHITECTURE.md) | Tiered system topology, component tree, sequence diagrams, and mathematical prediction model. |
| 🧪 [**Testing Documentation**](docs/TESTING_DOCUMENTATION.md) | Automated E2E test runner, 12 manual test cases, requirement traceability matrix (RTM), and test evidence. |
| 🤝 [**Contributing Guide**](CONTRIBUTING.md) | Branching conventions, coding standards, local workflow, and pull request procedures. |

---

## ⚡ System Architecture & Mathematical Model

```
+--------------------------------------------------------------------------------------------------+
|                                    SYSTEM TOPOLOGY OVERVIEW                                      |
+--------------------------------------------------------------------------------------------------+
|                                                                                                  |
|   +--------------------------+                         +--------------------------+              |
|   |   STUDENT CLIENT         |                         |   ADMIN / STAFF CLIENT   |              |
|   |   (React 18 / Mobile)    |                         |   (React 18 / Desktop)   |              |
|   |   Port 3000              |                         |   Port 3000 /admin       |              |
|   +-------------+------------+                         +------------+-------------+              |
|                 |                                                   |                            |
|                 | HTTP GET/POST                                     | HTTP GET/POST              |
|                 | (Vite Proxy: /api)                                | (Vite Proxy: /api)         |
|                 v                                                   v                            |
|   +-------------------------------------------------------------------------------+              |
|   |                       EXPRESS.JS BACKEND SERVICE                              |              |
|   |                       (Node.js runtime / Port 5000)                           |              |
|   |                                                                               |              |
|   |   +------------------------+             +--------------------------------+   |              |
|   |   | REST API Router        | <---------> | AI Waiting Time Prediction     |   |              |
|   |   | (server/routes/api.js) |             | Mathematical Engine            |   |              |
|   |   +-----------+------------+             +---------------+----------------+   |              |
|   |               |                                          |                    |              |
|   |               v                                          v                    |              |
|   |   +---------------------------------------------------------------+           |              |
|   |   |            IN-MEMORY SYNCHRONOUS STATE STORE                  |           |              |
|   |   |            (server/data/queueStore.js)                        |           |              |
|   |   +---------------------------------------------------------------+           |              |
|   +-------------------------------------------------------------------------------+              |
|                                                                                                  |
+--------------------------------------------------------------------------------------------------+
```

### The AI-Based Prediction Formula:
$$\text{waitingTime} = \left\lceil \frac{\text{queueLength} \times \text{averageServiceTime}}{\text{activeCounters}} \right\rceil$$

- **`queueLength`**: Total students awaiting preparation ($12$ in baseline state).
- **`averageServiceTime`**: Empirical service duration per student ($2\text{ minutes}$).
- **`activeCounters`**: Parallel operational service desks ($3\text{ active counters}$).
- **Sample Result:** $\frac{12 \times 2}{3} = \mathbf{8 \text{ Minutes}}$ (Classified as **`MEDIUM CROWD`**).

---

## 🚀 Quick Start & Installation

### Prerequisites
- [Node.js](https://nodejs.org/) (v18.0.0 or higher)
- npm (v9.0.0 or higher)

### Method 1: Windows 1-Click Launch (Recommended)
Double-click `start.bat` in the repository root:
```bat
start.bat
```
*(Or in PowerShell: `.\start.ps1`)*

This script automatically launches the backend server, starts the frontend Vite server, and opens both the Student View and Admin View in your default web browser.

---

### Method 2: Manual Terminal Execution

#### 1. Start Backend Server
```bash
cd server
npm install
npm start
```
*Backend runs on `http://localhost:5000`.*

#### 2. Start Frontend Client
In a second terminal window:
```bash
cd client
npm install
npm run dev
```
*Frontend runs on `http://localhost:3000`.*

---

## 🌐 Application URLs

| Interface | URL | Description |
|---|---|---|
| **Student Dashboard** | [http://localhost:3000](http://localhost:3000) | Live crowd stats, token dispenser, queue tracker, and menu. |
| **Admin Dashboard** | [http://localhost:3000/admin](http://localhost:3000/admin) | Queue table, Call Next, Complete Token, and counter modulation. |
| **Backend REST API** | [http://localhost:5000/api/dashboard](http://localhost:5000/api/dashboard) | Live JSON health and dashboard metrics endpoint. |

---

## 🛠️ REST API Specification

| HTTP Method | Endpoint Path | Functionality | Sample Response Payload |
|---|---|---|---|
| `GET` | `/api/dashboard` | High-level summary metrics | `{ currentCrowd: 42, nowServing: "A119", estimatedWaitingTime: 8, activeCounters: 3 }` |
| `GET` | `/api/queue` | Complete queue array & status | `{ nowServing: "A119", queue: [...], completedToday: 86 }` |
| `POST` | `/api/queue/join` | Issues sequential token | `{ token: "A127", queuePosition: 8, peopleAhead: 7, estimatedWait: "8 Minutes" }` |
| `GET` | `/api/queue/prediction` | AI prediction evaluation | `{ queueLength: 12, activeCounters: 3, averageServiceTime: 2, predictedWaitingTime: 8 }` |
| `POST` | `/api/queue/next` | Advances line to next token | `{ success: true, nowServing: "A120", estimatedWait: "7 Minutes" }` |
| `POST` | `/api/queue/complete`| Marks order as completed | `{ success: true, completedToken: "A120", completedToday: 87 }` |
| `GET` | `/api/menu` | Subsidized canteen dishes | `[{ id: 1, name: "Chicken Rice", price: 80, available: true }, ...]` |
| `POST` | `/api/queue/leave` | Cancels student token | `{ success: true, message: "Token A127 left the queue" }` |
| `POST` | `/api/counters` | Modulates active counters | `{ success: true, activeCounters: 4 }` |
| `POST` | `/api/reset` | Restores pristine demo state | `{ success: true, message: "Reset to initial demo data" }` |

---

## 🧪 Running Automated Tests

An automated end-to-end integration test runner is included to verify all API contracts, queue state transitions, and formula calculations:

```bash
# Ensure backend server is running on port 5000
npm test
```
*(Or directly: `node test/test_e2e.js`)*

**Test Suite Coverage:**
- State reset and baseline restoration.
- Student dashboard metrics accuracy.
- Digital token generation sequence (`A127`).
- Prediction formula calculation vs. queuing model.
- Food menu items and availability verification.
- Admin queue progression (Call Next & Complete).
- Dynamic counter adjustment and live formula re-evaluation.

---

## 📂 Repository Structure

```text
smart-canteen-and-waiting-system/
├── client/                        # React 18 + Vite 5 Frontend Application
│   ├── src/
│   │   ├── components/            # Reusable UI widgets (Navbar, MetricCard, CrowdBadge)
│   │   ├── pages/                 # Full views (Dashboard, GetToken, MyQueue, AI, Menu, Admin)
│   │   ├── services/api.js        # Centralized HTTP API fetch client
│   │   ├── App.jsx                # Root coordinator with 4s reactive polling
│   │   ├── App.css                # Polished responsive design styles
│   │   └── main.jsx               # Application DOM entrypoint
│   ├── index.html                 # Single page application template
│   ├── vite.config.js             # Vite build & /api reverse proxy configuration
│   └── package.json
│
├── server/                        # Node.js + Express.js REST Backend
│   ├── data/queueStore.js         # In-memory synchronous queue & prediction engine
│   ├── routes/apiRoutes.js        # REST API endpoint route handlers
│   ├── server.js                  # Express app listener & CORS middleware
│   └── package.json
│
├── docs/                          # Comprehensive Technical Documentation
│   ├── PROJECT_OVERVIEW.md        # Campus context, personas & scope
│   ├── FUNCTIONAL_MODULES.md      # Detailed 8-module engineering specifications
│   ├── DEVELOPMENT_PROGRESS.md    # Review 2 (35%) -> Review 3 (88.5%) report
│   ├── SYSTEM_ARCHITECTURE.md     # Architectural diagrams, models & sequence flows
│   └── TESTING_DOCUMENTATION.md   # Test suite, 12 test cases & traceability matrix
│
├── test/                          # Automated Verification
│   └── test_e2e.js                # Programmatic integration test runner
│
├── CONTRIBUTING.md                # Open-source contribution guidelines
├── package.json                   # Root workspace scripts (start, test, build)
├── start.bat                      # Windows 1-click batch launcher
├── start.ps1                      # Windows PowerShell launcher
├── .gitignore                     # Repository hygiene specification
└── README.md                      # Project presentation
```

---

## 🎓 Review 3 Demonstration Script (Step-by-Step)

1. **Launch System:** Double-click `start.bat`. Both browser tabs open automatically.
2. **Student Dashboard:** Confirm baseline KPIs: Crowd `42`, Now Serving `A119`, Wait `8 Minutes`, Counters `3`.
3. **Get Token:** Click **"Get Queue Token"** &rarr; Verify token `A127` generated (Position `8`, Ahead `7`, Wait `8 Minutes`).
4. **Inspect Algorithm:** Switch to **"AI Prediction"** &rarr; Verify formula values and `MEDIUM` crowd badge.
5. **Canteen Menu:** Switch to **"Canteen Menu"** &rarr; Verify 7 items with ₹ prices and `Available` badges.
6. **Admin Operations:** In Admin tab &rarr; Click **"Call Next"** &rarr; Now Serving shifts to `A120`. Click **"Complete"** &rarr; Completed Today increments to `87`.
7. **Counter Modulation:** In Admin tab &rarr; Click counter **4** &rarr; Observe estimated wait time drop immediately from 8m to 6m.
8. **Reset State:** Click **"Reset Demo Data"** &rarr; Seamlessly restore initial state for subsequent evaluations.

---

## 📄 License
This project is open-source under the [MIT License](LICENSE).
