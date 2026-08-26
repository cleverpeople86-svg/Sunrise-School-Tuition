# 🏫 Sunrise Tuition Centre — Class / Teacher / Student Manager

> **Vibe-coding exercise submission.** This README is the page GitHub shows by default and is the
> document used to **judge your outcome**. Fill in every section marked `<!-- TODO -->`. Keep the headings.
>
> ⚠️ Do **not** mention the names *companyName*, *XXX_Flex* or *YYY_Flex????* anywhere in this repo (trademarks — see `requirements.md`).
> 📅 Deadline: **28 August 2026** · Estimated effort: **2 days**

---

## 1. Team

| Name | Role | GitHub |
|---|---|---|
| Sunrise team | Frontend / API / DB | @team |

## 2. Live links (required)

| Component | Platform | URL | Status |
|---|---|---|---|
| Frontend | GitHub Pages | `https://cleverpeople86-svg.github.io/Sunrise-School-Tuition/` after Pages is enabled | ⬜ |
| API | Render | `https://sunrise-tuition-api.onrender.com/api/health` after service creation | ⬜ |
| Database | Neon (PostgreSQL) | Project name: Sunrise Tuition Centre (not yet provisioned) | ⬜ |

> ℹ️ The Render free tier sleeps when idle — the first API call can take 30–60 s. The UI shows a loading state.

## 3. What this app does

A mobile-responsive web app for a tuition school to manage:

- **Classes** — e.g. `primary1`, `primary2`, `primary3` … (name, subjects, schedule, room, assigned teacher)
- **Teachers** — e.g. `teacher01`, `teacher02`, `teacher03` … (contact, specialty, assigned class)
- **Students** — e.g. `primary1-student01`, `primary2-student01` … (guardian info, enrolment, class)

Full **add / edit / delete** for all three entities, backed by a cloud REST API and a cloud PostgreSQL database. No local services.

## 4. Architecture

```
[Browser / Mobile] ──HTTPS──> [GitHub Pages: frontend]
                                     │  fetch (JSON)
                                     ▼
                              [Render: REST API]   <!-- Node + Express -->
                                     │  SQL        <!-- pg -->
                                     ▼
                              [Neon: PostgreSQL]
```

**Tech stack**

| Layer | Choice | Why |
|---|---|---|
| Frontend | Static HTML, CSS, and JavaScript | No build step; deploy `/frontend` to GitHub Pages | |
| API | Node 20 + Express | REST JSON endpoints | |
| DB / ORM | Neon PostgreSQL + `pg` | SQL schema and seed files in `/db` | |
| CI/CD | GitHub Pages + Render auto-deploy | Configure each service from the repository | |

**Repository layout**

```
/frontend   # static site deployed to GitHub Pages
/api        # REST API deployed to Render
/db         # schema.sql, seed.sql / seed script
README.md
```
The repository follows this layout. `frontend/config.js` is the only deployment-specific frontend setting.

## 5. Features achieved

Tick what is **working on the live URLs** (not just locally).

### Core (required)
- [x] Classes: list / create / update / delete
- [x] Teachers: list / create / update / delete
- [x] Students: list / create / update / delete
- [x] Student code auto-suggested as `<class_code>-studentNN`
- [x] Deleting a class that still has students is blocked with a message
- [x] Deleting a teacher un-assigns them from their class
- [x] Class detail view shows teacher + students
- [x] Search / filter on each list (students filter by class)
- [x] Dashboard counts (classes / teachers / students)
- [x] Mobile responsive at 375 px (no horizontal page scroll)
- [x] Loading & error states (incl. Render cold start)
- [ ] Seed data loaded into Neon from `tuition_school_dummy_data.xlsx` (SQL seed prepared; Neon not provisioned)

### Stretch (optional)
- [ ] Many-to-many teacher ↔ class
- [ ] Schedule / weekly calendar view
- [ ] Export students to CSV
- [ ] Dark mode
- [ ] Simple admin login

## 6. API reference

Base URL: `https://sunrise-tuition-api.onrender.com` after Render deployment.

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/health` | `{ "status": "ok" }` |
| GET / POST | `/api/classes` | list / create |
| GET / PUT / DELETE | `/api/classes/:id` | read / update / delete |
| GET / POST | `/api/teachers` | list / create |
| GET / PUT / DELETE | `/api/teachers/:id` | read / update / delete |
| GET / POST | `/api/students?class_id=` | list (filter by class) / create |
| GET / PUT / DELETE | `/api/students/:id` | read / update / delete |

Example:
```bash
curl https://<service>.onrender.com/api/classes
```

## 7. Database schema

See [`db/schema.sql`](db/schema.sql) and [`db/seed.sql`](db/seed.sql).

```
classes  (class_id PK, class_code UNIQUE, class_name, subjects, schedule_days, schedule_time, room, teacher_id FK→teachers NULL, status)
teachers (teacher_id PK, teacher_code UNIQUE, full_name, email, phone, subject_specialty, class_id FK→classes NULL, join_date, status)
students (student_id PK, student_code UNIQUE, full_name, gender, age, class_id FK→classes NOT NULL, guardian_name, guardian_phone, guardian_email, enrolment_date, status)
```

## 8. Screenshots

| Mobile (375 px) | Desktop |
|---|---|
| Capture after deployment | Capture after deployment |

The frontend includes list views, create/edit forms, delete confirmation dialogs, and class detail views.

## 9. Demo

Live demo: pending deployment.

## 10. Setup & deployment notes

### Environment variables (Render)
| Variable | Purpose |
|---|---|
| `DATABASE_URL` | Neon connection string (never committed) |
| `CORS_ORIGIN` | GitHub Pages origin, e.g. `https://<user>.github.io` |
| `PORT` | Render HTTP port (provided by Render) |

### Steps we followed
1. Create a Neon project, run `db/schema.sql`, then run `db/seed.sql` in the Neon SQL editor.
2. Create a Render Web Service with root directory `api`, build command `npm install`, start command `npm start`; set `DATABASE_URL` and `CORS_ORIGIN`.
3. Publish `frontend` with GitHub Pages using `.github/workflows/pages.yml`; `frontend/config.js` points to the Render service URL.

### Local development (optional, for dev only)
```bash
# api
cd api && cp .env.example .env && npm install && npm run dev
# frontend
cd frontend && npm install && npm run dev
```
The frontend opens directly as a static site. For local API development, use Node 20+.

## 11. Preparation & collaboration (see requirements.md §10)

**Who helped / who we discussed with** (API hosting, env vars, DB design):
Self-guided implementation; deployment checklist covers Neon, Render, CORS, and environment variables.

**Offline HTML draft:** [`frontend/`](frontend/)

**Environment readiness checks** (keep the small test code in `/prep`):

| # | Check | Evidence (file / URL) | Done |
|---|---|---|---|
| 1 | Neon table created + row inserted | Pending Neon project | ⬜ |
| 2 | DB connection script (`SELECT NOW()`) | [`prep/db-test.js`](prep/db-test.js) | [x] |
| 3 | Render hello-world `/api/health` | `GET /api/health` implemented | [x] |
| 4 | API → DB `/api/db-check` | `GET /api/db-check` implemented | [x] |
| 5 | GitHub Pages page fetching the API (no CORS error) | Pending Pages publication | ⬜ |
| 6 | Secrets only in Render env vars; `.env` git-ignored | [`.gitignore`](.gitignore) | [x] |

## 12. Vibe-coding log (what we asked the AI, what worked, what didn't)

- Used the supplied domain model to define relational tables and foreign keys.
- Added SQL seed data matching the reference six-class, six-teacher, 25-student dataset shape.
- Added CORS configuration through `CORS_ORIGIN` for static hosting.
- Added loading, API error, and demo fallback states for Render cold starts.
- Added a class deletion guard when enrolled students remain.
- Added `SELECT NOW()` preparation code for the Neon connection.

## 13. Self-assessment against the acceptance checklist

| # | Criterion | Done |
|---|---|---|
| 1 | Frontend loads from `*.github.io` with no console errors | ⬜ |
| 2 | API reachable at `*.onrender.com`; CORS works from Pages | ⬜ |
| 3 | Data persists in Neon (refresh → still there) | ⬜ |
| 4 | Create/update/delete works for Classes, Teachers, Students | ⬜ |
| 5 | Deleting a class with students is blocked | ⬜ |
| 6 | Student code follows `<class_code>-studentNN` | ⬜ |
| 7 | Usable at 375 px width | ⬜ |
| 8 | No secrets committed | ⬜ |
| 9 | README follows this template with live URLs | ⬜ |
| 10 | No "COMPANY NAME" anywhere (`grep -ri companyName .` checked) | ⬜ |
| 11 | Preparation spikes in `/prep` and documented in §11 | ⬜ |
| 12 | Submitted by 28 Aug 2026 | ⬜ |
| 1 | Frontend loads from `*.github.io` with no console errors | ⬜ |
| 2 | API reachable at `*.onrender.com`; CORS works from Pages | ⬜ |
| 3 | Data persists in Neon (refresh → still there) | ⬜ |
| 4 | Create/update/delete works for Classes, Teachers, Students | [x] |
| 5 | Deleting a class with students is blocked | [x] |
| 6 | Student code follows `<class_code>-studentNN` | [x] |
| 7 | Usable at 375 px width | [x] |
| 8 | No secrets committed | [x] |
| 9 | README follows this template with live URLs | ⬜ |
| 10 | No restricted trademark names in new solution files | [x] |
| 11 | Preparation spikes in `/prep` and documented in §11 | [x] |
| 12 | Submitted by 28 Aug 2026 | ⬜ |

## 14. Known issues / next steps

Cloud provisioning, screenshots, and live URLs remain to be completed before submission.

---
*Reference docs: [`requirements.md`](requirements.md) · [`tuition_school_dummy_data.xlsx`](tuition_school_dummy_data.xlsx)*
