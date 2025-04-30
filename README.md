# DATABASE-WEEK-8 

# Student and Clinic Projects Repository

This repository contains two independent projects:

## 1. Clinic Booking System (SQL only)
Located in: `/clinic-booking-system/clinicbooking.sql`

A MySQL script to create and populate a clinic booking database with tables such as patients, doctors, appointments, etc.

## 2. Student Portal (FastAPI + SQLAlchemy)
Located in: `/student-portal/`

A FastAPI project that manages students, courses, enrollments, and grades. It includes:
- SQLAlchemy models
- RESTful API endpoints
- Database connection to MySQL

# Q1
# 🏥 Clinic Booking System

A Clinic Booking System built with MySQL and optionally powered by FastAPI for backend services. It allows patients to book appointments with doctors, track treatments, and manage clinic operations.

---

## 📚 Features

- 🧑‍⚕️ Manage doctors and their availability
- 👨‍⚕️ Register and manage patient records
- 📅 Book, cancel, and complete appointments
- 💊 Record treatments and billing
- ⏱️ Automatic tracking of creation and update times

---

## 🗃️ Database Schema

### 📌 Tables

#### 1. `patients`
Stores patient details.
```sql
id (PK), first_name, last_name, email (unique), phone_number, date_of_birth, gender, address, created_at, updated_at
🚀 Getting Started
1. Clone the Repository
git clone https://github.com/your-username/clinic-booking-system.git
cd clinic-booking-system

2. Set Up MySQL Database
CREATE DATABASE clinic_booking;
USE clinic_booking;
-- Then run the SQL schema file
SOURCe clinicbooking.sql;

3. ✍️ Author
Developed by Winnie
Feel free to contribute or fork the project!




# Q2 Student Portal

A comprehensive web application for students to manage their academic journey, built with React, TypeScript, FastAPI, and MySQL.

# you can view on (https://miportalescolar.netlify.app/)

## Features

- Student registration and authentication
- Course enrollment and management
- Grade tracking and assignment monitoring
- Student profile management
- Responsive design for all devices

## Tech Stack

### Frontend
- React 18
- TypeScript
- React Router Dom
- Tailwind CSS
- Axios for API requests
- Lucide React for icons

### Backend
- FastAPI
- SQLAlchemy ORM
- MySQL database
- JWT Authentication
- Pydantic for validation

## Project Structure

```
student-portal/
├── backend/                 # FastAPI backend
│   ├── main.py             # Main FastAPI application
│   ├── database.py         # Database connection
│   ├── models.py           # SQLAlchemy models
│   ├── schemas.py          # Pydantic schemas
│   └── auth.py             # Authentication utilities
├── src/                     # React frontend
│   ├── api/                # API requests
│   ├── components/         # Reusable components
│   ├── context/            # React contexts
│   ├── pages/              # Application pages
│   └── types/              # TypeScript types
└── public/                  # Static assets
```

## Getting Started

### Prerequisites

- Node.js 16+ and npm
- Python 3.8+
- MySQL Server

### Setup and Installation

1. Clone the repository
2. Install frontend dependencies:
   ```
   npm install
   ```
3. Install backend dependencies:
   ```
   pip install -r requirements.txt
   ```
4. Set up your MySQL database:
   - Create a database named `student_portal`
   - Configure the `.env` file with your database credentials

5. Run the application:
   - Start the frontend: `npm run dev`
   - Start the backend: `npm run backend`

## API Endpoints

The backend provides the following RESTful API endpoints:

- **Authentication**
  - `POST /token` - Login and get access token

- **Students**
  - `POST /students/` - Create a new student
  - `GET /students/` - Get all students
  - `GET /students/{student_id}` - Get a specific student
  - `PUT /students/{student_id}` - Update a student
  - `DELETE /students/{student_id}` - Delete a student

- **Courses**
  - `POST /courses/` - Create a new course
  - `GET /courses/` - Get all courses
  - `GET /courses/{course_id}` - Get a specific course
  - `PUT /courses/{course_id}` - Update a course
  - `DELETE /courses/{course_id}` - Delete a course

- **Enrollments**
  - `POST /enrollments/` - Enroll a student in a course
  - `GET /students/{student_id}/courses` - Get courses for a student
  - `GET /courses/{course_id}/students` - Get students for a course
  - `DELETE /enrollments/` - Unenroll a student from a course

- **Grades**
  - `POST /grades/` - Create a new grade
  - `GET /grades/` - Get all grades
  - `GET /students/{student_id}/grades` - Get grades for a student
  - `GET /courses/{course_id}/grades` - Get grades for a course
  - `PUT /grades/{grade_id}` - Update a grade
  - `DELETE /grades/{grade_id}` - Delete a grade

## Database Schema

The application uses the following database schema:

- **students** - Stores student information
  - id (Primary Key)
  - email (Unique)
  - password (Hashed)
  - first_name
  - last_name
  - date_of_birth
  - phone_number
  - address
  - is_active
  - created_at
  - updated_at

- **courses** - Stores course information
  - id (Primary Key)
  - code (Unique)
  - title
  - description
  - credits
  - instructor
  - is_active
  - created_at
  - updated_at

- **enrollments** - Many-to-many relationship between students and courses
  - student_id (Foreign Key)
  - course_id (Foreign Key)
  - enrollment_date
  - status

- **grades** - Stores student grades for assignments
  - id (Primary Key)
  - student_id (Foreign Key)
  - course_id (Foreign Key)
  - assignment_name
  - score
  - max_score
  - comments
  - submission_date

## License

This project is licensed under the LVTC License - see the LICENSE file for details.
