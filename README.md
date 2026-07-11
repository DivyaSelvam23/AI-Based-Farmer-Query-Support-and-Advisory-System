# 🌾AI-Based Farmer Query Support and Advisory System

## **Project Overview**

The AI-Based Farmer Query Support and Advisory System is an intelligent agricultural assistance platform designed to help farmers obtain accurate and timely guidance related to crop cultivation, pest management, fertilizer usage, irrigation planning, weather conditions, and market prices.

The platform combines Artificial Intelligence, Natural Language Processing (NLP), Machine Learning, and a centralized database to provide personalized recommendations based on farmer queries. Farmers can interact with the system through a mobile application, web portal, or chatbot using their preferred language.

The system aims to improve agricultural productivity, reduce crop losses, support informed decision-making, and make expert farming knowledge accessible to farmers anytime and anywhere.

The platform is specifically designed for small and medium-scale farmers who require quick, reliable, and affordable agricultural guidance without depending solely on physical visits to agricultural experts.

---

## **Objective**

To develop an AI-powered agricultural advisory platform that assists farmers by providing intelligent recommendations, crop guidance, pest diagnosis, weather updates, and market information through an easy-to-use digital system.

The system aims to:

- Provide instant responses to farmer queries.
- Deliver crop-specific recommendations.
- Assist in pest and disease identification.
- Suggest suitable fertilizers and irrigation schedules.
- Provide weather forecasting information.
- Display current market prices of agricultural products.
- Support multilingual communication.
- Generate agricultural reports and insights.
- Improve crop yield and farming efficiency.
- Build a knowledge repository for future agricultural analytics.

---

## **Problem Statement**

Farmers often face difficulties in obtaining timely and accurate information regarding crop management, pest control, weather conditions, fertilizer usage, and market trends.

Traditional methods of seeking agricultural advice frequently result in:

- Delayed expert consultation.
- Incorrect farming decisions.
- Crop diseases remaining undetected.
- Improper fertilizer application.
- Water management issues.
- Limited access to agricultural knowledge.
- Lack of real-time market information.
- Reduced crop productivity.

The absence of a centralized digital advisory system limits farmers' ability to make data-driven decisions.

This project addresses these challenges by providing an AI-powered Farmer Query Support and Advisory System that delivers intelligent recommendations, automates advisory services, and supports effective farm management.

---

## **User & Module Identification**

The AI-Based Farmer Query Support and Advisory System serves Farmers, Agricultural Experts, Administrators, and Government Agricultural Officers.

Farmers interact with the system through mobile applications, websites, or chatbots, while experts and administrators monitor activities, manage knowledge bases, and generate reports.

---

## **Modules List**

**1. Farmer Registration Module**
- Farmer profile management
- Farm details management

**2. Query Management Module**
- Submit farming-related queries
- Query tracking and response management

**3. AI Advisory Module**
- AI-generated recommendations
- Personalized farming guidance

**4. Crop Management Module**
- Crop information
- Cultivation practices

**5. Pest & Disease Detection Module**
- Disease identification
- Treatment recommendations

**6. Weather Forecast Module**
- Weather updates
- Rainfall prediction

**7. Market Price Information Module**
- Crop market prices
- Market trend analysis

**8. Dashboard & Reporting Module**
- Farmer activity reports
- Agricultural analytics

**9. Authentication & Access Control Module**
- User login
- Role-based access control

---

## **System Use Case Overview**

### **Actors**

- Farmer
- Agricultural Expert
- Administrator
- Government Officer

### **Major Use Cases**

- Register Farmer
- Submit Query
- Receive AI Recommendation
- View Weather Updates
- Check Market Prices
- Detect Crop Diseases
- Generate Reports
- Manage Users

---

## **Database Requirement Analysis**

The AI-Based Farmer Query Support and Advisory System requires a centralized database to manage farmer information, crop records, queries, recommendations, weather data, disease records, and market information.

The database supports AI-driven advisory services, report generation, analytics, and historical agricultural data management.

---

## **Table List**

| Table Name | Description |
|---|---|
| Users | Stores system user accounts |
| Roles | Stores user roles and permissions |
| Farmers | Stores farmer profile information |
| Farms | Stores farm and land details |
| Crops | Stores crop information |
| Farmer_Queries | Stores farmer questions and requests |
| AI_Recommendations | Stores AI-generated advice |
| Diseases | Stores crop disease information |
| Disease_Reports | Stores detected disease records |
| Weather_Data | Stores weather forecast information |
| Market_Prices | Stores crop market prices |
| Notifications | Stores alerts and recommendations |
| Reports | Stores generated reports |
| Audit_Logs | Stores system activity history |

---

## **Database Schema**

The AI-Based Farmers Query Support and Advisory System requires a centralized PostgreSQL database to manage farmer profiles, crop information, agricultural queries, AI-generated recommendations, weather information, disease diagnosis records, and advisory services. The database is designed to support real-time query processing, AI-powered recommendations, report generation, and future agricultural analytics.

Entity Relationships

- One Farmer can submit multiple Queries.
- One Query can receive multiple Advisory Responses.
- One Crop can be associated with multiple Farmers.
- One Farmer can provide multiple Feedback Records.
- One Weather Record can be linked to multiple Advisory Recommendations.
- One Administrator can manage multiple system activities.

Database Tables

Table Name| Description
Users| Stores user login and authentication details
Roles| Stores user roles and permissions
Farmers| Stores farmer profile information
Crops| Stores crop details
Queries| Stores farmer-submitted questions
Query_Responses| Stores AI-generated advisory responses
Weather_Data| Stores weather forecasts and historical data
Soil_Data| Stores soil health information
Disease_Records| Stores crop disease information
Advisory_Records| Stores agricultural recommendations
Notifications| Stores alerts and notifications
Feedback| Stores farmer feedback
Audit_Logs| Stores system activity logs

---

## **UI Wireframe Design**

The user interface is designed to be simple, mobile-friendly, and accessible for farmers with minimal technical knowledge.

Main Wireframes

Login Screen

- Mobile Number / Username
- Password
- Login Button
- Register Option

Farmer Dashboard

- Total Queries Submitted
- AI Recommendations
- Weather Updates
- Crop Health Status
- Recent Notifications

Query Submission Screen

- Crop Selection
- Query Category
- Description Field
- Image Upload Option
- Submit Button

Advisory Screen

- Recommended Actions
- Disease Solutions
- Fertilizer Suggestions
- Irrigation Guidance

Weather Dashboard

- Current Weather
- Temperature
- Rainfall Forecast
- Humidity Information

---

## **Login & Dashboard UI Design**

Login Interface

The login interface provides secure access to Farmers, Agricultural Experts, and Administrators.

Features

- Secure Authentication
- Password Encryption
- Role-Based Access Control
- Mobile-Friendly Design

Dashboard Interface

The dashboard acts as the central hub for agricultural information and recommendations.

Dashboard Components

Farmer Dashboard

- Total Queries
- Pending Responses
- AI Recommendations
- Weather Alerts
- Disease Notifications
- Crop Advisory Updates

Administrator Dashboard

- Registered Farmers
- Active Queries
- Advisory Statistics
- System Reports
- User Management

---

## **Navigation and Form Design**

Navigation Menu

- Dashboard
- Submit Query
- My Queries
- Crop Advisory
- Disease Detection
- Weather Updates
- Notifications
- Reports
- Profile
- Logout

Form Design

Farmer Registration Form

Fields:

- Farmer Name
- Mobile Number
- Village
- District
- State
- Farm Size
- Main Crops

Query Submission Form

Fields:

- Crop Name
- Query Type
- Description
- Upload Crop Image
- Submit

Feedback Form

Fields:

- Rating
- Comments
- Submit Feedback

---

## **Design Review**

The design review evaluates usability, performance, security, and scalability of the advisory system.

Usability

- Simple Interface
- Easy Navigation
- Mobile Accessibility
- Multilingual Support

Performance

- Fast Query Processing
- Real-Time Recommendations
- Efficient Database Operations

Security

- User Authentication
- Secure Data Storage
- Role-Based Access Control
- Activity Logging

Scalability

- Supports Large Numbers of Farmers
- Expandable Crop Database
- Future AI Model Integration

Review Outcome

The proposed design effectively supports farmer query management, crop advisory services, weather-based recommendations, disease diagnosis assistance, and AI-powered agricultural decision-making.

---

## **Frontend Environment Setup**

Technology Stack

Component| Technology
Frontend Framework| React.js
Styling| Tailwind CSS
API Communication| Axios
Routing| React Router
Charts| Chart.js
State Management| Redux Toolkit
Build Tool| Vite

Frontend Features

- Farmer-Friendly Dashboard
- AI Query Support Interface
- Crop Disease Detection Screen
- Weather Information Dashboard
- Advisory Recommendation Panel
- Reports & Analytics Dashboard
- Mobile Responsive Design

---

## **Future Enhancements**

- Voice-Based Query Support
- Regional Language Assistance
- Mobile Application Development
- IoT Sensor Integration
- Satellite-Based Crop Monitoring
- Advanced Yield Prediction
- AI Chatbot for Farmers

---

## **Live Demo**
 Try The App here: https://ai-based-farmer-query-support-and-a-three.vercel.app/


 ---

 ## **PROJECT EXPLANATION VIDEO**
     https://drive.google.com/file/d/1DxFuiC7TmVHE4nYkvFAVJV_G0YOo-Yid/view?usp=sharing
