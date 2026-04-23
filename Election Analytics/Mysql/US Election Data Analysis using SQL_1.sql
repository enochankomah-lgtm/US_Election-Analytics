

SELECT 
    SUM(Democrat_RawVote) AS total_dem,
    SUM(Republican_RawVote) AS total_rep,
    SUM(Other_RawVote) AS total_other
FROM us_election_2022;

SELECT 
    state,

    SUM(Democrat_RawVote) AS total_dem,
    SUM(Republican_RawVote) AS total_rep,

    (SUM(Democrat_RawVote) / 
     SUM(Democrat_RawVote + Republican_RawVote + Other_RawVote)) * 100 
     AS democrat_pct,

    (SUM(Republican_RawVote) / 
     SUM(Democrat_RawVote + Republican_RawVote + Other_RawVote)) * 100 
     AS republican_pct,

    ABS(
        (SUM(Democrat_RawVote) / 
         SUM(Democrat_RawVote + Republican_RawVote + Other_RawVote)) * 100
        -
        (SUM(Republican_RawVote) / 
         SUM(Democrat_RawVote + Republican_RawVote + Other_RawVote)) * 100
    ) AS margin,

    CASE 
        WHEN SUM(Democrat_RawVote) > SUM(Republican_RawVote) THEN 'Democrat'
        ELSE 'Republican'
    END AS winner

FROM us_election_2022
GROUP BY state;


CREATE VIEW election_education AS
SELECT 
    state,

    SUM(under_9th_grade_edupop + bet_9th_12th_grade_no_diploma) AS low_edu,
    SUM(High_school_graduate + SomeCollege_NoDegree + Associates_Degree) AS mid_edu,
    SUM(Bachelors_Degree + Graduate_or_professional_Degree) AS high_edu,

    SUM(Democrat_RawVote) AS total_dem,
    SUM(Republican_RawVote) AS total_rep,

    CASE 
        WHEN SUM(Democrat_RawVote) > SUM(Republican_RawVote) THEN 'Democrat'
        ELSE 'Republican'
    END AS winner

FROM us_election_2022
GROUP BY state;


WITH state_summary AS (
    SELECT 
        state,

        SUM(Median_income * Total_Population) / SUM(Total_Population) AS median_income,
        SUM(Mean_income * Total_Population) / SUM(Total_Population) AS mean_income,

        SUM(Democrat_RawVote) AS total_dem,
        SUM(Republican_RawVote) AS total_rep,
        SUM(Other_RawVote) AS total_other

    FROM us_election_2022
    GROUP BY state
)

SELECT
    state,
    median_income,
    mean_income,

    ABS(mean_income - median_income) AS income_gap,

    (total_dem / (total_dem + total_rep + total_other)) * 100 AS democrat_pct,
    (total_rep / (total_dem + total_rep + total_other)) * 100 AS republican_pct,

    CASE 
        WHEN total_dem > total_rep THEN 'Democrat'
        ELSE 'Republican'
    END AS winner

FROM state_summary;



SELECT 
    state,

    SUM(gini_index * Total_Population) / SUM(Total_Population) AS state_gini,

    SUM(Democrat_percentage * Total_Population) / SUM(Total_Population) AS democrat_pct,
    SUM(Republican_percentage * Total_Population) / SUM(Total_Population) AS republican_pct,

    CASE 
        WHEN SUM(Democrat_percentage * Total_Population) >
             SUM(Republican_percentage * Total_Population)
        THEN 'Democrat'
        ELSE 'Republican'
    END AS winner

FROM us_election_2022
GROUP BY state;



SELECT 
    state,

    SUM(NH_White_percent * Total_Population) / SUM(Total_Population) AS white_pct,
    SUM(NH_Black_percent * Total_Population) / SUM(Total_Population) AS black_pct,
    SUM(Hispanic_percent * Total_Population) / SUM(Total_Population) AS hispanic_pct,

    SUM(Democrat_percentage * Total_Population) / SUM(Total_Population) AS democrat_pct,
    SUM(Republican_percentage * Total_Population) / SUM(Total_Population) AS republican_pct

FROM us_election_2022
GROUP BY state;












