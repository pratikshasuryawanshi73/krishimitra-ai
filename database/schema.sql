-- Create database
CREATE DATABASE IF NOT EXISTS krishimitra_db;

-- Use database
USE krishimitra_db;

-- Create crops table
CREATE TABLE IF NOT EXISTS crops (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    planted_date DATE,
    expected_harvest_date DATE,
    status ENUM('planted', 'growing', 'harvested') DEFAULT 'planted'
);

-- Create irrigation_schedules table
CREATE TABLE IF NOT EXISTS irrigation_schedules (
    id INT AUTO_INCREMENT PRIMARY KEY,
    crop_id INT,
    date DATE NOT NULL,
    time TIME,
    status ENUM('scheduled', 'completed', 'cancelled') DEFAULT 'scheduled',
    FOREIGN KEY (crop_id) REFERENCES crops(id)
);

-- Create chemical_logs table
CREATE TABLE IF NOT EXISTS chemical_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    crop_id INT,
    chemical_name VARCHAR(255),
    application_date DATE,
    quantity DECIMAL(10,2),
    unit VARCHAR(50),
    FOREIGN KEY (crop_id) REFERENCES crops(id)
);