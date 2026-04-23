SELECT * FROM electionanalytics.us_election_2022; 
drop table electionanalytics.us_election_2022;
use electionanalytics;

describe  us_election_2022;
CREATE TABLE us_election_2022 (
    election_id INT AUTO_INCREMENT PRIMARY KEY,
    
    
    county VARCHAR(150),
    state VARCHAR(100),

    Democrat_RawVote BIGINT,
    Democrat_percentage DECIMAL(15,8),

    Republican_RawVote BIGINT,
    Republican_percentage DECIMAL(15,8),

    Other_RawVote BIGINT,
    Other_percentage DECIMAL(15,8),

    Under_9th_grade_eduPop DECIMAL(15,8),
    Bet_9th_12th_grade_no_diploma DECIMAL(15,8),
    High_School_graduate DECIMAL(15,8),
    SomeCollege_NoDegree DECIMAL(15,8),
    Associates_Degree DECIMAL(15,8),
    Bachelors_Degree DECIMAL(15,8),
    Graduate_or_Professional_Degree DECIMAL(15,8),

    Gini_Index DECIMAL(15,10),

    Median_income BIGINT,
    Mean_income BIGINT,

    Area_squareKm DECIMAL(18,6),
    Density_squareKm DECIMAL(18,6),

    Total_Population BIGINT,

    Hispanic_percent DECIMAL(15,8),
    NH_White_percent DECIMAL(15,8),
    NH_Black_percent DECIMAL(15,8),
    NH_AIAN_percent DECIMAL(15,8),
    NH_Asian_percent DECIMAL(15,8),
    NH_NHPI_percent DECIMAL(15,8),
    NH_Other_percent DECIMAL(15,8),
    NH_Two_or_more_percent DECIMAL(15,8),

    Pct_Management_Business_Science_Arts DECIMAL(15,8),
    Pct_Service DECIMAL(15,8),
    Pct_Sales_Office DECIMAL(15,8),
    Pct_Resources_Construction DECIMAL(15,8),
    Pct_Transportation DECIMAL(15,8)
);	

set global local_infile = 1;
LOAD DATA LOCAL INFILE 'C:/Users/STUDENT/Desktop/excel/US_Election_dataset_v1.csv'
INTO TABLE us_election_2022
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SHOW VARIABLES LIKE 'local_infile';


ALTER TABLE us_election_2022
MODIFY Democrat_percentage DECIMAL(10,3),
MODIFY Republican_percentage DECIMAL(10,3),
MODIFY Other_percentage DECIMAL(10,3),

MODIFY Under_9th_grade_eduPop DECIMAL(10,3),
MODIFY Bet_9th_12th_grade_no_diploma DECIMAL(10,3),
MODIFY High_School_graduate DECIMAL(10,3),
MODIFY SomeCollege_NoDegree DECIMAL(10,3),
MODIFY Associates_Degree DECIMAL(10,3),
MODIFY Bachelors_Degree DECIMAL(10,3),
MODIFY Graduate_or_Professional_Degree DECIMAL(10,3),

MODIFY Gini_Index DECIMAL(10,3),

MODIFY Area_squareKm DECIMAL(12,3),
MODIFY Density_squareKm DECIMAL(12,3),

MODIFY Hispanic_percent DECIMAL(10,3),
MODIFY NH_White_percent DECIMAL(10,3),
MODIFY NH_Black_percent DECIMAL(10,3),
MODIFY NH_AIAN_percent DECIMAL(10,3),
MODIFY NH_Asian_percent DECIMAL(10,3),
MODIFY NH_NHPI_percent DECIMAL(10,3),
MODIFY NH_Other_percent DECIMAL(10,3),
MODIFY NH_Two_or_more_percent DECIMAL(10,3),

MODIFY Pct_Management_Business_Science_Arts DECIMAL(10,3),
MODIFY Pct_Service DECIMAL(10,3),
MODIFY Pct_Sales_Office DECIMAL(10,3),
MODIFY Pct_Resources_Construction DECIMAL(10,3),
MODIFY Pct_Transportation DECIMAL(10,3);











