🌾 AI-Based Farmer Query Support and Advisory System

📌 Project Overview
The AI-Based Farmer Query Support and Advisory System is an AI-powered, agriculture-centric digital platform designed to assist farmers with real-time guidance on crop management, soil health, weather conditions, pest control, irrigation planning, and market price insights.
The system combines mobile/Telegram-based interaction, a PostgreSQL-backed agricultural database, AI-powered natural language query processing, and a web-based analytics dashboard to provide farmers with instant and accurate agricultural recommendations.
It enables farmers and agricultural officers to interact with the system in natural language (text or voice) to receive crop suggestions, fertilizer recommendations, disease diagnosis, and farming best practices without needing technical knowledge.
This platform is especially useful for small and medium-scale farmers who need timely decision support to improve crop yield and reduce agricultural risks.

🎯 Objective
To develop a centralized AI-based agricultural advisory system that digitizes farming support services and provides intelligent decision-making assistance to farmers.
The system aims to:
Digitize farmer advisory services
Provide crop-specific recommendations
Assist in pest and disease identification
Deliver real-time weather-based farming advice
Track crop cycles and field activities
Support fertilizer and irrigation planning
Enable AI-powered natural language query handling
Provide market price insights for crops
Build agricultural data history for predictive analytics

❗ Problem Statement
Farmers often rely on traditional methods such as local vendors, manual experience, or word-of-mouth advice for agricultural decisions.
This leads to:
Incorrect crop selection
Poor pest and disease management
Inefficient fertilizer usage
Low yield productivity
Lack of real-time weather awareness
Dependency on middlemen for market pricing
No centralized agricultural data system
The absence of a smart advisory platform limits productivity and prevents data-driven farming decisions.
This project solves these issues by providing an AI-powered agricultural assistant that delivers personalized and data-driven farming guidance.

👥 User & Module Identification
The system supports multiple user roles including Farmers, Agricultural Officers, Experts, and Administrators.
Farmers interact via mobile/Telegram/voice interface
Agricultural Officers manage advisory data and verify recommendations
Experts contribute domain knowledge
Admins manage system configuration and data governance
An AI Advisory Assistant Module enables users to ask questions in natural language and receive instant agricultural insights.

📦 Modules List
🌱 Farmer Management Module
Farmer registration
Farm profile management
Land details tracking
🌾 Crop Management Module
Crop selection guidance
Crop cycle tracking
Seasonal recommendations
🐛 Pest & Disease Detection Module
AI-based disease prediction
Pest identification support
Treatment recommendations
🌦 Weather Advisory Module
Real-time weather integration
Rainfall forecasting alerts
Climate-based farming suggestions
💧 Irrigation & Fertilizer Management Module
Water requirement estimation
Fertilizer dosage recommendations
Soil-based input planning
💰 Market Price Intelligence Module
Crop price tracking
Market trend analysis
Selling time recommendations
📊 Dashboard & Analytics Module
Farm performance analytics
Crop yield predictions
Historical insights
🤖 AI Advisory Assistant Module
Natural language query system
Chatbot-based farming support
Tool-calling AI agent integration
🔐 Authentication & Access Control Module
Role-based access
Secure login system
Data privacy management

🗄️ Database Requirement Analysis
The system uses a centralized PostgreSQL database designed to manage farmer profiles, crops, soil data, weather history, pest records, and advisory logs.
It follows a farm-centric architecture, where every record is linked to a specific farmer or farm.

📋 Table List
Table Name
Description
Users
Stores system user accounts and authentication details
Roles
Stores user roles and permissions
Farmers
Stores farmer personal and contact details
Farms
Stores farm land details and location
Crops
Stores crop master data
Soil_Analysis
Stores soil test results and reports
Weather_Data
Stores historical and real-time weather data
Crop_Cycles
Tracks crop growth stages
Pest_Reports
Stores pest and disease records
Fertilizer_Recommendations
Stores AI-generated fertilizer advice
Irrigation_Schedules
Stores water management plans
Market_Prices
Stores crop market price data
Advisory_Queries
Stores farmer AI queries and responses
Experts
Stores agricultural expert information
Notifications
Stores alerts and advisory messages
Audit_Logs
Stores system activity logs

🧠 System Use Case Overview
Actors:
Farmer
Agricultural Expert
System Admin
AI Advisory Assistant
Key Use Cases:
Ask farming-related questions
Get crop recommendations
Detect plant diseases
Receive weather alerts
Check market prices
Manage farm data
Generate reports
Access AI advisory chatbot
