# UI/UX Wireframes

## Reception Dashboard

```
┌─────────────────────────────────────────────────────────────┐
│ Kenya HMS - Reception Dashboard                            │
├─────────────────────────────────────────────────────────────┤
│ Welcome, Receptionist Jane Doe                            │
│ Hospital: Nairobi General Hospital                        │
├─────────────────────────────────────────────────────────────┤
│ ┌─ Quick Actions ──────────────────────────────────────┐   │
│ │ [Register Patient] [Schedule Appointment] [Check In] │   │
│ │ [Emergency] [Queue Management]                       │   │
│ └───────────────────────────────────────────────────────┘   │
├─────────────────────────────────────────────────────────────┤
│ ┌─ Today's Appointments ────────────────────────────────┐   │
│ │ Time | Patient | Doctor | Status                      │   │
│ │ 09:00 | John Doe | Dr. Smith | Confirmed             │   │
│ │ 09:30 | Mary Jane | Dr. Brown | Waiting              │   │
│ │ 10:00 | Peter Pan | Dr. Green | No Show              │   │
│ └───────────────────────────────────────────────────────┘   │
├─────────────────────────────────────────────────────────────┤
│ ┌─ Patient Queue ──────────────────────────────────────┐   │
│ │ 1. Alice Cooper - Consultation                       │   │
│ │ 2. Bob Wilson - Follow-up                            │   │
│ │ 3. Carol Davis - Emergency                           │   │
│ └───────────────────────────────────────────────────────┘   │
├─────────────────────────────────────────────────────────────┤
│ ┌─ Recent Activity ────────────────────────────────────┐   │
│ │ 08:45 - Patient John Doe checked in                 │   │
│ │ 08:30 - Appointment confirmed for Mary Jane         │   │
│ │ 08:15 - New patient registered: Peter Pan           │   │
│ └───────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

### Patient Registration Form
```
┌─────────────────────────────────────────────────────────────┐
│ Patient Registration                                       │
├─────────────────────────────────────────────────────────────┤
│ Personal Information                                       │
│ First Name: [____________________] Last Name: [_________]  │
│ Date of Birth: [__/____] Gender: [Male] [Female] [Other]   │
│ Phone: [____________________] Email: [_________________]   │
│ Address: [_____________________________________________]  │
│                                                           │
│ Identification                                            │
│ National ID: [____________________] Passport: [_________]  │
│                                                           │
│ Emergency Contact                                         │
│ Name: [____________________] Phone: [_________________]   │
│                                                           │
│ NHIF Information                                          │
│ NHIF Number: [____________________]                       │
│ [Verify Eligibility]                                      │
│                                                           │
│ [Save Patient] [Cancel]                                   │
└─────────────────────────────────────────────────────────────┘
```

## Doctor Dashboard

```
┌─────────────────────────────────────────────────────────────┐
│ Kenya HMS - Doctor Dashboard                              │
├─────────────────────────────────────────────────────────────┤
│ Dr. Sarah Johnson - Nairobi General Hospital              │
├─────────────────────────────────────────────────────────────┤
│ ┌─ Today's Schedule ────────────────────────────────────┐   │
│ │ 09:00-09:30 | John Doe - Consultation                 │   │
│ │ 09:30-10:00 | Mary Jane - Follow-up                   │   │
│ │ 10:00-10:30 | Peter Pan - New Patient                 │   │
│ │ 10:30-11:00 | Alice Cooper - Check-up                 │   │
│ └───────────────────────────────────────────────────────┘   │
├─────────────────────────────────────────────────────────────┤
│ ┌─ Current Patient ─────────────────────────────────────┐   │
│ │ Patient: John Doe (ID: 12345)                        │   │
│ │ Age: 35 | NHIF: Active                               │   │
│ │ Chief Complaint: Fever and cough                     │   │
│ │                                                       │   │
│ │ [View EMR] [Order Lab Tests] [Prescribe Medication]  │   │
│ │ [Admit to Ward] [Schedule Follow-up]                 │   │
│ └───────────────────────────────────────────────────────┘   │
├─────────────────────────────────────────────────────────────┤
│ ┌─ Pending Tasks ──────────────────────────────────────┐   │
│ │ ⚠ Lab results ready for 3 patients                  │   │
│ │ 📋 Review prescriptions for 2 patients              │   │
│ │ 📅 5 follow-up appointments due                     │   │
│ └───────────────────────────────────────────────────────┘   │
├─────────────────────────────────────────────────────────────┤
│ ┌─ Quick EMR Entry ────────────────────────────────────┐   │
│ │ History: [________________________________________] │   │
│ │ Examination: [_____________________________________] │   │
│ │ Diagnosis: [_______________________________________] │   │
│ │ Treatment: [_______________________________________] │   │
│ │ [Save Record]                                        │   │
│ └───────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

### EMR View
```
┌─────────────────────────────────────────────────────────────┐
│ Electronic Medical Record - John Doe                      │
├─────────────────────────────────────────────────────────────┤
│ ┌─ Patient Summary ─────────────────────────────────────┐   │
│ │ Name: John Doe | Age: 35 | Gender: Male               │   │
│ │ Phone: 0712345678 | NHIF: 1234567890                  │   │
│ │ Last Visit: 2024-01-15 | Allergies: Penicillin        │   │
│ └───────────────────────────────────────────────────────┘   │
├─────────────────────────────────────────────────────────────┤
│ ┌─ Visit History ──────────────────────────────────────┐   │
│ │ Date | Diagnosis | Treatment | Doctor                │   │
│ │ 2024-01-15 | Malaria | Coartem | Dr. Smith           │   │
│ │ 2023-12-10 | Hypertension | Amlodipine | Dr. Brown   │   │
│ │ 2023-11-05 | Diabetes | Metformin | Dr. Green        │   │
│ └───────────────────────────────────────────────────────┘   │
├─────────────────────────────────────────────────────────────┤
│ ┌─ Current Visit ──────────────────────────────────────┐   │
│ │ Date: 2024-01-20 | Time: 09:00                       │   │
│ │ Chief Complaint: Fever, headache, body aches         │   │
│ │ History: Symptoms started 3 days ago                 │   │
│ │ Examination: Temp 38.5°C, BP 120/80                  │   │
│ │ Diagnosis: Viral infection                           │   │
│ │ Treatment: Rest, hydration, Paracetamol              │   │
│ │ Lab Orders: Malaria test, CBC                        │   │
│ └───────────────────────────────────────────────────────┘   │
├─────────────────────────────────────────────────────────────┤
│ ┌─ Prescriptions ──────────────────────────────────────┐   │
│ │ Drug | Dosage | Duration | Status                    │   │
│ │ Paracetamol | 500mg TID | 5 days | Pending          │   │
│ └───────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

## Billing Dashboard

```
┌─────────────────────────────────────────────────────────────┐
│ Kenya HMS - Billing Dashboard                             │
├─────────────────────────────────────────────────────────────┤
│ Billing Officer - Nairobi General Hospital                │
├─────────────────────────────────────────────────────────────┤
│ ┌─ Today's Summary ─────────────────────────────────────┐   │
│ │ Total Bills: KES 45,000                               │   │
│ │ Paid: KES 32,000 (71%)                                │   │
│ │ Pending: KES 13,000 (29%)                             │   │
│ │ M-Pesa Payments: 15 transactions                      │   │
│ │ NHIF Claims: 8 submitted                              │   │
│ └───────────────────────────────────────────────────────┘   │
├─────────────────────────────────────────────────────────────┤
│ ┌─ Pending Bills ──────────────────────────────────────┐   │
│ │ Patient | Amount | Due Date | Status                 │   │
│ │ John Doe | 2,500 | 2024-01-25 | Overdue              │   │
│ │ Mary Jane | 1,800 | 2024-01-22 | Pending             │   │
│ │ Peter Pan | 3,200 | 2024-01-20 | Paid                │   │
│ └───────────────────────────────────────────────────────┘   │
├─────────────────────────────────────────────────────────────┤
│ ┌─ Payment Methods ────────────────────────────────────┐   │
│ │ [Cash Payment] [M-Pesa STK Push] [Paybill] [NHIF]    │   │
│ └───────────────────────────────────────────────────────┘   │
├─────────────────────────────────────────────────────────────┤
│ ┌─ NHIF Claims ────────────────────────────────────────┐   │
│ │ Claim # | Patient | Amount | Status                  │   │
│ │ NHIF001 | John Doe | 2,000 | Approved                │   │
│ │ NHIF002 | Mary Jane | 1,500 | Submitted              │   │
│ │ NHIF003 | Peter Pan | 2,800 | Rejected               │   │
│ └───────────────────────────────────────────────────────┘   │
├─────────────────────────────────────────────────────────────┤
│ ┌─ Generate Bill ──────────────────────────────────────┐   │
│ │ Patient: [Search Patient...]                         │   │
│ │ Services:                                            │   │
│ │ [ ] Consultation - KES 500                           │   │
│ │ [ ] Lab Tests - KES 1,200                            │   │
│ │ [ ] Ward Stay - KES 2,000/day                        │   │
│ │ [ ] Medications - KES 800                            │   │
│ │ Total: KES 3,500                                      │   │
│ │ [Generate Bill] [Send to Patient]                    │   │
│ └───────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

### Bill Details View
```
┌─────────────────────────────────────────────────────────────┐
│ Bill #BILL001 - John Doe                                  │
├─────────────────────────────────────────────────────────────┤
│ Patient: John Doe (ID: 12345)                             │
│ Date: 2024-01-20 | Due: 2024-02-20                        │
│ Status: Pending                                           │
├─────────────────────────────────────────────────────────────┤
│ ┌─ Bill Items ──────────────────────────────────────────┐   │
│ │ Item | Quantity | Unit Price | Total | NHIF Covered    │   │
│ │ Consultation | 1 | 500 | 500 | Yes                    │   │
│ │ Malaria Test | 1 | 300 | 300 | Yes                    │   │
│ │ CBC Test | 1 | 400 | 400 | Yes                        │   │
│ │ Coartem | 1 | 200 | 200 | Yes                         │   │
│ │ Ward Stay (2 days) | 2 | 1,000 | 2,000 | No           │   │
│ └───────────────────────────────────────────────────────┘   │
├─────────────────────────────────────────────────────────────┤
│ Subtotal: KES 3,400                                       │
│ NHIF Coverage: KES 1,400 (41%)                            │
│ Patient Responsibility: KES 2,000                         │
│ Paid: KES 0                                               │
│ Balance: KES 2,000                                        │
├─────────────────────────────────────────────────────────────┤
│ ┌─ Payment Options ─────────────────────────────────────┐   │
│ │ [Pay with M-Pesa] [Cash Payment] [NHIF Claim]         │   │
│ └───────────────────────────────────────────────────────┘   │
├─────────────────────────────────────────────────────────────┤
│ ┌─ Payment History ─────────────────────────────────────┐   │
│ │ Date | Method | Amount | Reference                    │   │
│ │ No payments recorded                                  │   │
│ └───────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

## Mobile App Wireframes

### Mobile Patient Portal
```
┌─────────────────┐
│ 🏥 Kenya HMS    │
├─────────────────┤
│ Welcome, John   │
│ Doe             │
├─────────────────┤
│ 📅 Appointments │
│ Today: 2:00 PM  │
│ Dr. Sarah       │
├─────────────────┤
│ 💊 Medications  │
│ Paracetamol    │
│ 500mg TID      │
├─────────────────┤
│ 🧪 Lab Results  │
│ Malaria: Neg    │
│ CBC: Normal     │
├─────────────────┤
│ 💰 Bills        │
│ Balance: KES 0  │
├─────────────────┤
│ 📞 Emergency    │
│ Call Hospital   │
└─────────────────┘
```

### Mobile Payment
```
┌─────────────────┐
│ 💰 Pay Bill     │
├─────────────────┤
│ Bill #BILL001   │
│ Amount: KES 2000│
├─────────────────┤
│ Payment Method  │
│ 🔘 M-Pesa       │
│ □ Cash          │
│ □ Card          │
├─────────────────┤
│ Phone: 0712...  │
│ [Edit]          │
├─────────────────┤
│ [Pay Now]       │
└─────────────────┘
```