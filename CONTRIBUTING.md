# Contributing to Smart Canteen and Waiting System

Thank you for your interest in contributing to the **Smart Canteen and Waiting System**. This document outlines the standards, project architecture conventions, and development workflow.

---

## Code of Conduct

All contributors and maintainers are expected to maintain a welcoming, respectful, and collaborative environment.

---

## Development Workflow

### 1. Branching Strategy
- `main` / `master`: Production-ready, fully verified stable code.
- `feature/<feature-name>`: New modules or capabilities.
- `bugfix/<issue-name>`: Bug fixes and performance adjustments.
- `docs/<topic>`: Documentation and testing specification updates.

### 2. Local Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/ss37666555-cmyk/smart-canteen-and-waiting-system.git
   cd smart-canteen-and-waiting-system
   ```
2. Install backend dependencies:
   ```bash
   cd server
   npm install
   ```
3. Install frontend dependencies:
   ```bash
   cd ../client
   npm install
   ```
4. Start development servers:
   - Option A (Windows 1-Click): Run `start.bat` from project root.
   - Option B (Manual):
     - Terminal 1: `cd server && npm start` (Port 5000)
     - Terminal 2: `cd client && npm run dev` (Port 3000)

---

## Code Standards

### Backend (`server/`)
- Follow RESTful conventions.
- Place data modeling and business logic in `server/data/`.
- Place endpoint routing in `server/routes/`.
- Handle potential exceptions with descriptive HTTP status codes (`400`, `404`, `500`).
- Ensure all waiting time predictions conform to the mathematical AI formula:
  $$\text{waitingTime} = \left\lceil \frac{\text{queueLength} \times \text{averageServiceTime}}{\text{activeCounters}} \right\rceil$$

### Frontend (`client/`)
- Functional React components with standard hooks (`useState`, `useEffect`, `useCallback`).
- Centralize API requests in `client/src/services/api.js`.
- Responsive layout prioritizing mobile viewport (smartphones) as well as desktop kiosk screens.
- Keep CSS variables defined in `client/src/index.css`.

---

## Testing & Verification

Before submitting pull requests:
1. Ensure the frontend builds without errors:
   ```bash
   cd client
   npm run build
   ```
2. Run automated integration tests:
   ```bash
   node test/test_e2e.js
   ```
3. Verify that zero secrets, environment keys, or unneeded logs are staged.

---

## Pull Request Guidelines

1. Ensure documentation in `docs/` is updated if functional contracts change.
2. Provide a concise summary of changes and reference relevant issues.
3. Verify that demo data reset endpoints work cleanly for reviewers.
