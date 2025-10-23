DROP DATABASE IF EXISTS Homework2;
CREATE DATABASE Homework2; 
USE Homework2; 

DROP TABLE IF EXISTS accidents2005and2007; 
CREATE TABLE accidents2005and2007 ( 
Accident_Index VARCHAR(50) PRIMARY KEY, 
Location_Easting_OSGR INT, 
Location_Northing_OSGR INT, 
Longitude DECIMAL(9,6), 
Latitude DECIMAL(9,6), 
Police_Force INT, 
Accident_Severity INT, 
Number_of_Vehicles INT, 
Number_of_Casualties INT, 
Date VARCHAR(20) 
); 

DROP TABLE IF EXISTS accidents2009and2011;
CREATE TABLE accidents2009and2011 ( 
Accident_Index VARCHAR(50) PRIMARY KEY, 
Location_Easting_OSGR INT, 
Location_Northing_OSGR INT, 
Longitude DECIMAL(9,6), 
Latitude DECIMAL(9,6), 
Police_Force INT, 
Accident_Severity INT, 
Number_of_Vehicles INT, 
Number_of_Casualties INT, 
Date VARCHAR(20) 
); 

DROP TABLE IF EXISTS accidents2012and2014;
CREATE TABLE accidents2012and2014 ( 
Accident_Index VARCHAR(50) PRIMARY KEY, 
Location_Easting_OSGR INT, 
Location_Northing_OSGR INT, 
Longitude DECIMAL(9,6), 
Latitude DECIMAL(9,6), 
Police_Force INT, 
Accident_Severity INT, 
Number_of_Vehicles INT, 
Number_of_Casualties INT, 
Date VARCHAR(20) 
);