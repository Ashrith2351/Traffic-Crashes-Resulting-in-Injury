CREATE DATABASE 580project;
USE 580project;
CREATE TABLE TrafficCrashes (
    Unique_Id INT PRIMARY KEY,
    Cnn_Intrsctn_Fkey INT,
    Cnn_Sgmt_Fkey INT,
    Case_Id_Pkey INT,
    Tb_Latitude FLOAT,
    Tb_Longitude FLOAT,
    Geocode_Source VARCHAR(50),
    Geocode_Location VARCHAR(50),
    Collision_Datetime VARCHAR(20),
    Collision_Date VARCHAR(20),
    Collision_Time VARCHAR(20),
    Accident_Year INT,
    Month VARCHAR(20),
    Day_Of_Week VARCHAR(20),
    Time_Cat VARCHAR(20),
    Juris INT,
    Officer_Id INT,
    Reporting_District INT,
    Beat_Number VARCHAR(10),
    Primary_Rd VARCHAR(50),
    Secondary_Rd VARCHAR(50),
    Distance INT,
    Direction VARCHAR(10),
    Weather_1 VARCHAR(50),
    Collision_Severity VARCHAR(50),
    Type_Of_Collision VARCHAR(50),
    Mviw VARCHAR(50),
    Ped_Action VARCHAR(50),
    Road_Surface VARCHAR(50),
    Road_Cond_1 VARCHAR(50),
    Road_Cond_2 VARCHAR(50),
    Lighting VARCHAR(50),
    Control_Device VARCHAR(50),
    Intersection VARCHAR(50),
    Vz_Pcf_Code VARCHAR(50),
    Vz_Pcf_Group VARCHAR(50),
    Vz_Pcf_Description VARCHAR(50),
    Vz_Pcf_Link VARCHAR(255),
    Number_Killed INT,
    Number_Injured INT,
    Street_View VARCHAR(255),
    Dph_Col_Grp INT,
    Dph_Col_Grp_Description VARCHAR(50),
    Party_At_Fault INT,
    Party1_Type VARCHAR(50),
    Party1_Dir_Of_Travel VARCHAR(50),
    Party1_Move_Pre_Acc VARCHAR(50),
    Party2_Type VARCHAR(50),
    Party2_Dir_Of_Travel VARCHAR(50),
    Party2_Move_Pre_Acc VARCHAR(50),
    Point VARCHAR(255),
    Data_As_Of VARCHAR(20),
    Data_Updated_At VARCHAR(20),
    Data_Loaded_At VARCHAR(20),
    Neighborhoods VARCHAR(50),
    Sf_Find_Neighborhoods INT,
    Current_Police_Districts INT,
    Current_Supervisor_Districts INT,
    Analysis_Neighborhoods INT
);

-- Count of Rows:
SELECT COUNT(*) AS TotalRows
FROM TrafficCrashes;

-- Average and Maximum Number of Injured:
SELECT AVG(Number_Injured) AS AvgInjured,
       MAX(Number_Injured) AS MaxInjured
FROM TrafficCrashes;

-- Collision Severity Distribution:
SELECT Collision_Severity, COUNT(*) AS CollisionCount
FROM TrafficCrashes
GROUP BY Collision_Severity;

-- Average Distance of Collisions:
SELECT AVG(Distance) AS AvgDistance
FROM TrafficCrashes;

-- Top 5 Primary Roads with the Highest Collision Count:
SELECT Primary_Rd, COUNT(*) AS CollisionCount
FROM TrafficCrashes
GROUP BY Primary_Rd
ORDER BY CollisionCount DESC
LIMIT 5;

SELECT Accident_Year, COUNT(*) as Frequency
FROM TrafficCrashes
GROUP BY Accident_Year
ORDER BY Frequency DESC
LIMIT 1;

-- staistical summary 
SELECT
    MIN(Number_Killed) AS Min_Killed,
    MAX(Number_Killed) AS Max_Killed,
    AVG(Number_Killed) AS Avg_Killed,
    SUM(Number_Killed) AS Total_Killed,
    MIN(Number_Injured) AS Min_Injured,
    MAX(Number_Injured) AS Max_Injured,
    AVG(Number_Injured) AS Avg_Injured,
    SUM(Number_Injured) AS Total_Injured
FROM TrafficCrashes;



