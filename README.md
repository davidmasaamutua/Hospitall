# Kenya-Focused Hospital Management System (HMS)

## Overview
A comprehensive, scalable, and secure Hospital Management System tailored for hospitals in Kenya, supporting both public and private healthcare facilities with compliance to local healthcare workflows and payment systems.

## Core Modules
- Patient Registration (National ID/Passport support)
- Electronic Medical Records (EMR) with history tracking
- Appointment Scheduling and Queue Management
- Outpatient and Inpatient Management (wards, bed allocation)
- Pharmacy and Drug Inventory (batch tracking, expiry alerts)
- Laboratory and Diagnostic Management (test orders, results, reports)
- Billing and Invoicing System
- Staff Management (doctors, nurses, admin, payroll)

## Kenya-Specific Integrations
- **NHIF Integration**: Eligibility verification, claims submission, capitation/reimbursement
- **M-Pesa Integration**: STK Push, Paybill, Till Number payments, reconciliation, SMS confirmations

## Additional Features
- NHIF claim workflows
- Kenyan pricing models
- Multi-branch support
- SMS notifications
- Offline mode
- MoH reporting

## Security & Compliance
- Patient data privacy
- Role-based access control
- Audit logs
- Kenyan data protection compliance

## Technical Stack
- Frontend: React
- Backend: Node.js/Django
- Database: PostgreSQL/MySQL
- API-based architecture
- Cloud deployment (AWS/Azure/local)

## Deliverables
- System Architecture Diagram
- Database Schema Design
- API Endpoints Documentation
- UI/UX Wireframes
- Deployment and Maintenance Plan

## Local Starter Project
A minimal runnable React + Node.js starter project has been added under `frontend/` and `backend/`.

### Run locally
1. Open a terminal in the workspace root.
2. Install backend dependencies:
   - `cd backend`
   - `npm install`
3. Initialize the demo data:
   - `npm run init-db`
4. Start the backend server:
   - `npm start`
5. In a second terminal, install frontend dependencies:
   - `cd frontend`
   - `npm install`
6. Start the frontend app:
   - `npm run dev`

### Default login
- Username: `admin`
- Password: `Admin123!`

### Access the app
- Frontend: `http://localhost:5173`
- Backend API: `http://localhost:4000`
