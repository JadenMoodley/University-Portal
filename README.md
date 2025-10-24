University Portal — Project Documentation
1. Project Overview

The University Portal is a web-based system designed to provide a simple yet functional interface for managing and viewing university course information.
It serves two main types of users:

Students, who can view their registered courses and schedules.

Faculty, who can update course information such as instructor details and schedules.

This project was developed using:

Java Servlets for backend logic

JSP (JavaServer Pages) for dynamic page rendering

JDBC (Java Database Connectivity) for database interaction

PostgreSQL as the database

Apache Tomcat as the web server

Maven for dependency and build management

2. Objectives

Implement a simple, maintainable Java EE web application.

Integrate database operations using JDBC and DAO patterns.

Enable CRUD-like operations for both students and faculty.

3. System Architecture
 Layered Overview:
Layer	Technology	Responsibility
Presentation	JSP + HTML + CSS	User Interface for students and faculty
Controller	Servlets (CourseServlet, StudentServlet, FacultyServlet)	Handle requests and responses
Model	POJOs (Student, Course)	Represent database entities
Data Access	DAO classes (CourseDAO, StudentDAO)	Handle all SQL operations
Database	PostgreSQL	Store course, student, and enrollment data

5. Database Design

Database Name: university_portal

Tables:
 students
Column	Type	Description
student_id	SERIAL PRIMARY KEY	Unique ID for each student
first_name	VARCHAR(50)	Student’s first name
last_name	VARCHAR(50)	Student’s last name
email	VARCHAR(100)	Student’s email address

courses
Column	Type	Description
course_id	SERIAL PRIMARY KEY	Unique ID for each course
course_code	VARCHAR(10)	Unique course code
course_name	VARCHAR(100)	Name of the course
instructor	VARCHAR(100)	Instructor’s name
schedule	VARCHAR(100)	Schedule details 

student_course
Column	Type	Description
student_id	INT	FK referencing students
course_id	INT	FK referencing courses


5. Technology Stack
Component	Technology
Programming Language	Java 
Web Framework	Servlets + JSP
Database	PostgreSQL
Server	Apache Tomcat 11
Build Tool	Maven
UI Styling	HTML5, CSS3
