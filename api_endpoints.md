# API Endpoints Documentation

## Base URL
`https://api.kenya-hms.com/v1`

## Authentication
All endpoints require JWT token in Authorization header: `Bearer <token>`

### POST /auth/login
Login user and return JWT token
- **Body**: `{ "username": "string", "password": "string" }`
- **Response**: `{ "token": "string", "user": {...}, "expires_in": 3600 }`

### POST /auth/register
Register new user (Admin only)
- **Body**: User data
- **Response**: User object

## Patient Management

### GET /patients
Get patients list (paginated)
- **Query**: `?page=1&limit=20&search=name`
- **Response**: `{ "patients": [...], "total": 100, "page": 1 }`

### POST /patients
Register new patient
- **Body**: Patient data including national_id/passport
- **Response**: Patient object

### GET /patients/{id}
Get patient details
- **Response**: Patient object with medical history

### PUT /patients/{id}
Update patient information
- **Body**: Updated patient data

### POST /patients/{id}/nhif/verify
Verify NHIF eligibility
- **Integration**: Calls NHIF API
- **Response**: `{ "eligible": true, "coverage": {...} }`

## Appointments

### GET /appointments
Get appointments (filtered by date, doctor, status)
- **Query**: `?date=2024-01-01&doctor_id=1&status=scheduled`
- **Response**: Appointments array

### POST /appointments
Create new appointment
- **Body**: `{ "patient_id": 1, "doctor_id": 2, "date": "2024-01-01T10:00:00Z" }`
- **Response**: Appointment object

### PUT /appointments/{id}
Update appointment status
- **Body**: `{ "status": "confirmed" }`

## EMR (Electronic Medical Records)

### GET /patients/{id}/records
Get patient medical records
- **Response**: Medical records array

### POST /patients/{id}/records
Create new medical record
- **Body**: Medical record data
- **Response**: Medical record object

## Ward Management

### GET /wards
Get wards and bed status
- **Response**: Wards with beds array

### POST /admissions
Admit patient to ward
- **Body**: `{ "patient_id": 1, "ward_id": 2, "bed_id": 3 }`
- **Response**: Admission object

### PUT /admissions/{id}/discharge
Discharge patient
- **Body**: Discharge data

## Pharmacy

### GET /drugs
Get drug inventory
- **Query**: `?search=paracetamol&expiry_alert=true`
- **Response**: Drugs array with inventory

### POST /prescriptions/{id}/dispense
Dispense prescription
- **Body**: Dispensing data
- **Response**: Updated prescription

## Laboratory

### POST /lab/orders
Create lab order
- **Body**: `{ "patient_id": 1, "tests": [1,2,3] }`
- **Response**: Lab order object

### GET /lab/orders/{id}/results
Get lab results
- **Response**: Test results array

## Billing

### GET /bills
Get bills (filtered)
- **Query**: `?patient_id=1&status=pending`
- **Response**: Bills array

### POST /bills
Create new bill
- **Body**: Bill data with items
- **Response**: Bill object

### POST /bills/{id}/payments
Record payment
- **Body**: Payment data
- **Response**: Payment object

## NHIF Integration Endpoints

### POST /nhif/eligibility
Check patient NHIF eligibility
- **Integration**: NHIF API call
- **Body**: `{ "nhif_number": "string" }`
- **Response**: Eligibility data

### POST /nhif/claims
Submit NHIF claim
- **Integration**: NHIF API call
- **Body**: Claim data
- **Response**: Claim submission response

### GET /nhif/claims/{id}
Check claim status
- **Integration**: NHIF API call
- **Response**: Claim status

## M-Pesa Integration Endpoints

### POST /mpesa/stkpush
Initiate STK Push payment
- **Integration**: M-Pesa API call
- **Body**: `{ "phone": "2547xxxxxxxx", "amount": 1000, "bill_id": 1 }`
- **Response**: STK Push response

### POST /mpesa/paybill
Process Paybill payment
- **Integration**: M-Pesa callback
- **Body**: M-Pesa callback data
- **Response**: Payment confirmation

### GET /mpesa/transaction/{id}
Check transaction status
- **Integration**: M-Pesa API query
- **Response**: Transaction status

## Staff Management

### GET /staff
Get staff list
- **Query**: `?department=doctor&hospital_id=1`
- **Response**: Staff array

### POST /staff
Add new staff member
- **Body**: Staff data
- **Response**: Staff object

## Reporting

### GET /reports/patient-stats
Patient statistics report
- **Query**: `?start_date=2024-01-01&end_date=2024-12-31`
- **Response**: Statistics data

### GET /reports/financial
Financial report
- **Query**: `?period=monthly&year=2024`
- **Response**: Financial data

### GET /reports/nhif-claims
NHIF claims report
- **Response**: Claims summary

## Audit

### GET /audit/logs
Get audit logs
- **Query**: `?user_id=1&action=login&start_date=2024-01-01`
- **Response**: Audit logs array

## Webhooks

### POST /webhooks/mpesa/callback
M-Pesa payment callback
- **Body**: M-Pesa transaction data
- **Process**: Update payment status, send SMS confirmation

### POST /webhooks/nhif/status
NHIF claim status update
- **Body**: Claim status data
- **Process**: Update claim status in database