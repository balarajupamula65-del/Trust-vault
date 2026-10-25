# 🛡️ TrustVault — Secure Document Sharing & Access Management Platform

**Document Version:** 1.0  
**Status:** Product Requirements Specification (PRD) Implemented  
**Platform:** Web Application (React 19 + Vite)  
**Primary Users:** Administrators, Employees / Registered Users, Authorized Document Recipients  

> *"Every document has an owner. Every share has permissions. Every important action has an audit trail."*

---

## 🚀 Live Local Development

The development server is actively running at:
**[http://localhost:5173/](http://localhost:5173/)**

```bash
# Start development server
npm run dev

# Compile production bundle
npm run build
```

---

## 🎯 PRD Features & Architecture Implemented

### 1. Multi-Tenant Architecture & Strict Data Isolation (Section 8)
- **Tenants Included**:
  - `Acme Corporation` (`org-acme`): Enterprise Security & Defense
  - `Cyberdyne Systems` (`org-cyberdyne`): Robotics & AI Research
- **Strict Data Scoping**: All documents, users, shares, and audit logs are strictly scoped by `tenantId`. Documents from Acme Corporation are completely invisible to Cyberdyne Systems.
- **Cross-Tenant Prevention**: Cross-organization sharing is blocked with security enforcement banners.

---

### 2. Role-Based Access Control (RBAC) (Section 3)

| Role | Responsibilities & Capabilities |
|---|---|
| **Administrator** | Centralized dashboard overview, registered users monitoring, session revocation, account suspension, document ownership oversight, sharing management, audit log access, and security event investigation. |
| **Registered User** | Personal dashboard, document upload with SHA-256 hashing, document ownership management, permission-based sharing, and activity tracking. |
| **Authorized Recipient** | Dedicated *Shared With Me* view with permission enforcement (**View**, **Download**, **Manage Access**). |

---

### 3. Core Functional Requirements (PRD Section 6)

- **FR-01: Public Home Landing Page**: Product vision (*"Your Documents. Your Control. Your Trust."*), feature pillars, and instant 1-click persona sandbox.
- **FR-02 & FR-03: Passwordless OTP Authentication & Sessions**: Multi-tenant login requiring 6-digit One-Time Passwords (OTP) transmitted to corporate email, resend countdown timers, auto-fill simulation, generic error handling against enumeration, suspended account rejection, and role-based dashboard redirection.
- **FR-04: User Dashboard**: Total documents owned, shared by me, shared with me, recent documents, and recent activity.
- **FR-05: Document Upload**: Drag-and-drop file upload, size checks (25 MB max), automatic association with tenant & owner, and real-time client-side **SHA-256 hash calculation** via `window.crypto.subtle`.
- **FR-06: Document Management**: Search, filter, preview, download, SHA-256 verification, and deletion.
- **FR-07: Document Sharing**: Recipient selection scoped to organization, permission assignment (**View**, **Download**, **Manage Access**), expiration dates (7, 14, 30 days, or permanent), and audit event generation.
- **FR-08: Shared With Me**: Access only permitted documents. If granted *View Only*, downloads are blocked with security indicators.
- **FR-09: Shared By Me**: Real-time management of active shares, permission updates, and immediate access revocation buttons.
- **FR-10: Administrator Dashboard**: Executive summary cards matching PRD definitions:
  1. *Total Registered Users*
  2. *Currently Active Users*
  3. *Total Documents*
  4. *Total Shared Documents*
  5. *Total Sharing Relationships*
  6. *Document Owners count*
  Along with tables for *Recent User Activity*, *Document Ownership Distribution*, and *Sharing Overview*.
- **FR-11: User Management**: List users, filter by role/status, suspend/activate accounts (immediately terminates sessions), revoke active sessions, and assign roles.
- **FR-12: Cryptographic Audit Logs**: Dedicated administrative interface, filter by action, outcome, and user, modal event inspector with IP and metadata, and **CSV export**.
- **FR-13: Document Integrity Verification**: Recalculates file hash on demand, compares with trusted stored reference hash, validates bit-for-bit match, or simulates file tampering to demonstrate incident detection.
- **Visual Charts & Graphs Analytics (New)**:
  - **Administrator Dashboard**:
    - *Sharing Permissions & Governance Distribution* (Interactive Donut Chart with hover tooltips and dynamic slices)
    - *Weekly Cryptographic Audit & Event Activity* (Spline Area Curve with gradient fill over time)
    - *Enterprise Document Storage Allocation* (Multi-segment proportional bar for PDF, Word, Spreadsheets)
    - *User Accounts & Active Session Health* (Bar chart with rounded tops and hover tooltips)
  - **User Workspace Dashboard**:
    - *Allocated Storage Distribution* by document format
    - *Outgoing Sharing Permissions Ratio* (Donut Chart)
    - *Recent Activity Stream & Trend*

---

## 👥 Instant Evaluation Personas (1-Click Switcher)

In the top header, use the **ACT AS** quick switcher:
- **Admin (Marcus Vance)**: CISO at Acme Corp — Full administrative oversight, user management, audit logs, and security events.
- **Owner (Sarah Connor)**: Head of SecOps — Document owner who uploads files and grants permissions to colleagues.
- **Recipient (Dr. Miles Dyson)**: Principal Systems Architect — Recipient with View/Download permissions.
- **Cyberdyne Tenant**: Switch between Acme Corp and Cyberdyne Systems to verify data isolation.
