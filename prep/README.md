# Readiness checks

Run `node prep/db-test.js` with `DATABASE_URL` set to verify the Neon connection. The API exposes `GET /api/health` and `GET /api/db-check` for Render checks. The frontend's API status badge verifies the browser-to-API CORS path.

The offline UI draft is the static frontend in `/frontend`; it remains usable with demo data when no API URL is configured.
